<?php
namespace wabdo;
// Clasa pentru baze de date pgsql
class pgsql
 {
    var $Log;
    var $con_str;
    var $conn;
    var $res = array();
    var $row = array();
    var $row_no = array();
    var $recordcount = array();
    var $SQL;

    var $pg_query;
    var $pg_affected_rows;
    var $pg_num_rows;
    var $pg_free_result;
    var $pg_field_name, 
        $pg_num_fields,
        $pg_field_num,
        $pg_last_error;
    
function pgsql($con_str,$Log){
  $this->Log = &$Log;
	$this->con_str = $con_str;
	
	$constr = ($con_str["host"] != "" ? $_tmp = "host=" . $con_str["host"] : $_tmp = "");
	$constr .=($con_str["port"] != "" ? $_tmp = " port=" . $con_str["port"] : $_tmp = "");
	$constr .=($con_str["db"] != "" ? $_tmp = " dbname=" . $con_str["db"] : $_tmp = "");
	$constr .=($con_str["user"] != "" ? $_tmp = " user=" . $con_str["user"] : $_tmp = "");
	$constr .=($con_str["pass"] != "" ? $_tmp = " password=" . $con_str["pass"] : $_tmp = "");
	
	if (!$this->conn = @pg_connect($constr))
        {
	    $this->Log->do_log("Connection ERROR " . $this->get_error());
	    $this->Log->print_log();
	    //exit;
	}
	$this->Log->do_log("Connection OK");
	$this->res["default"] = "";
  if (function_exists("pg_exec")) {
    // vers < 4.2.0
    $this->pg_query         = "pg_exec";
    $this->pg_affected_rows = "pg_cmdtuples";
    $this->pg_num_rows      = "pg_numrows";
    $this->pg_free_result   = "pg_freeresult";
    $this->pg_field_name    = "pg_fieldname";
    $this->pg_num_fields    = "pg_numfields";
    $this->pg_field_num     = "pg_fieldnum";
    $this->pg_last_error    = "pg_errormessage";
  } else {
    // vers >= 4.2.0
    $this->pg_query         = "pg_query";
    $this->pg_affected_rows = "pg_affected_rows";
    $this->pg_num_rows      = "pg_num_rows";
    $this->pg_free_result   = "pg_free_result";       
    $this->pg_field_name    = "pg_field_name";
    $this->pg_num_fields    = "pg_num_fields";
    $this->pg_field_num     = "pg_field_num";
    $this->pg_last_error    = "pg_last_error";
  }
}
    
function reconnect(){
	if($this->conn)
	    $this->close_db();
	$constr = ($this->con_str["host"] != "" ? $_tmp = "host=" . $this->con_str["host"] : $_tmp = "");
	$constr .=($this->con_str["port"] != "" ? $_tmp = " port=" . $this->con_str["port"] : $_tmp = "");
	$constr .=($this->con_str["db"] != "" ? $_tmp = " dbname=" . $this->con_str["db"] : $_tmp = "");
	$constr .=($this->con_str["user"] != "" ? $_tmp = " user=" . $this->con_str["user"] : $_tmp = "");
	$constr .=($this->con_str["pass"] != "" ? $_tmp = " password=" . $this->con_str["pass"] : $_tmp = "");
	
	if (!$this->conn = @pg_connect($constr))
        {
	    $this->Log->do_log("Connection ERROR " . $this->get_error());
	    return false;
	    //exit;
	}
	$this->Log->do_log("Connection OK");
	$this->res["default"] = "";
	return true;
    }

    function select_db($database)
    {
	$this->$con_str["db"] = $database;
	$constr = ($this->con_str["host"] != "" ? $_tmp = "host=" . $this->con_str["host"] : $_tmp = "");
	$constr .=($this->con_str["port"] != "" ? $_tmp = " port=" . $this->con_str["port"] : $_tmp = "");
	$constr .=($database != "" ? $_tmp = " dbname=" . $database : $_tmp = "");
	$constr .=($this->con_str["user"] != "" ? $_tmp = " user=" . $this->con_str["user"] : $_tmp = "");
	$constr .=($this->con_str["pass"] != "" ? $_tmp = " password=" . $this->con_str["pass"] : $_tmp = "");
	
	if (!$this->conn=@pg_connect($constr)){
	
	    $this->Log->do_log("Connection ERROR: " . $this->get_error());
	    return false;
	}else {
	    $this->Log->do_log("DB ".$this->con_str["db"] ." selected ");
	    return true;
	}
    }
    
    function free_result($res_id){
	if($this->conn && $this->res[$res_id]) {
        $fname = $this->pg_free_result;
	    return @$fname($this->res[$res_id]);
    }
    }
    
    function query($sql,$res_id){ //return false on error or number of rows on succes
	$this->SQL[$res_id] = $sql;
	if($this->conn){
	        $this->free_result($res_id);
            $fname = $this->pg_query; 
    	    $this->res[$res_id]=@$fname($this->conn, $this->SQL[$res_id]);
    	    if($this->res[$res_id]){
            $fname = $this->pg_num_rows;
        	$this->recordcount[$res_id] = @$fname($this->res[$res_id]);
        	$this->row_no[$res_id] = 0;
        	$this->Log->do_log("Query OK: ". $this->SQL[$res_id] ." got: " . $this->recordcount[$res_id] . " rows");
		    $this->get_row($res_id);
        	return $this->recordcount[$res_id];
    	    }else{
        	$this->recordcount[$res_id]=0;
        	$this->Log->do_log("Query ERROR: " . $this->SQL[$res_id] . " got: ". $this->get_error());
        	return -1;
    	    }
	}else{
    	    $this->recordcount[$res_id]=0;
    	    $this->Log->do_log("ERROR: no database open");
    	    return -1;
	}
    }
    
    function get_row($res_id){
        if($this->res[$res_id] && $this->conn){
	    $this->row[$res_id] = @pg_fetch_array($this->res[$res_id],$this->row_no[$res_id]);
    	    if($this->row[$res_id])
	        return true;
	    else 
	        return false;
        }else{
    	    $this->Log->do_log("ERROR: no database open");
	    return false;
        }
    }
																		
    function next($res_id){
	if($this->row_no[$res_id] == $this->recordcount[$res_id])
	    return false;
	else{
	    $this->get_row($res_id);
    	    $this->row_no[$res_id]++;
	    return true;
	}
    }    
    
    function prev($res_id){
	if($this->row_no[$res_id] == 0)
	    return false;
	else {
	    $this->row_no[$res_id]--;
	    $this->get_row($res_id);
	    return true;
	}
    }
    
    function first($res_id){
	$this->row_no[$res_id] = 0;
	$this->get_row($res_id);
	return true;
    }

    function last($res_id){
	$this->row_no[$res_id] = $this->recordcount[$res_id];
	$this->get_row($res_id);
	return true;
    }
											    
    function move_to($row_id,$res_id){
	if($row_id >= 0 && $row_id <= $this->recordcount[$res_id] - 1){
	    $this->row_no[$res_id] = $row_id;
	    $this->get_row($res_id);
	    return true;
	}
	else 
	    return false;
    }
																												    
    
    function get_field($field,$res_id){
	return $this->row[$res_id][$field];
    }
				    
    function get_field_name($field,$res_id){
        if($this->res[$res_id]){
            $fname = $this->pg_field_name;
            return @$fname($this->res[$res_id],$field);
        }else{
            $this->Log->do_log("ERROR: no result open");
        }
    }
    
    function get_num_fields($res_id){
        if($this->res[$res_id]){
            $fname = $this->pg_num_fields;
            return @$fname($this->res[$res_id]);
        }else{
            $this->Log->do_log("ERROR: no result open");
        }
    }
    
    function get_field_num($field,$res_id){
        if($this->res[$res_id]){
            $fname = $this->pg_field_num;
            return @$fname($this->res[$res_id],$field);
        }else{
            $this->Log->do_log("ERROR: no result open");
        }
    }
							
    function exec($sql,$res_id){
        if($this->conn){
	    $this->free_result($res_id);
            if(is_array($sql)){
                $results = array();
		$i = 0;
		$test = 0;
                foreach($sql as $queries){
                    $fname = $this->pg_query;
                    $this->res[$res_id]=@$fname($this->conn, $queries);
                    if($this->res[$res_id]){
                        $fname = $this->pg_affected_rows;
                        $results[$i] = @$fname($this->res[$res_id]);
                        $this->Log->do_log("Query OK: ". $queries ." got: " . $results[$i] . " affected rows");
			$test++;
                    }else{
                        $results[$i] = -1;
                        $this->Log->do_log("Query ERROR: " . $queries . " got: ". $this->get_error());
                    }
		    $i++;
                }
                if($test == 0){
                    $this->Log->do_log("Queries ERROR: all queries failed");
		    $this->recordcount[$res_id] = 0;
                    return -1;
                }else{
                    if($test<count($sql)){
                        $this->Log->do_log("Queries ERROR: some queries failed");
			$this->recordcount[$res_id] = 0;
                        return $results;
                    }else{
			$this->recordcount[$res_id] = 0;
                        $this->Log->do_log("Queries OK.");
                        return $results;
                    }
                }
            }else{
                $this->SQL[$res_id] = $sql;
                $result = 0;
                $fname = $this->pg_query;
                $this->res[$res_id]=@$fname($this->conn,$sql);
                if($this->res[$res_id]){
                    $fname = $this->pg_affected_rows;
                    $result = @$fname($this->res[$res_id]);
		    $this->recordcount[$res_id] = 0;
                    $this->Log->do_log("Query OK: ". $sql ." got: " . $result . " affected rows");
		    if($result==0)
			return true;
                    return $result;
                }else{
		    $this->recordcount[$res_id] = 0;
                    $this->Log->do_log("Query ERROR: " . $sql . " got: ". $this->get_error());
                    return -1;
                }
            }
        }else{
            $this->Log->do_log("ERROR: no database open");
            return -1;
        }
    }

    
    
    function insert_id($res_id){//????????????????????
        return -1;
    }
    
    function record_count($res_id){
        return $this->recordcount[$res_id];
    }
    
    function get_db_name(){
        return $this->con_str["db"];
    }
    
    function close_db(){
	if($this->conn){
    	    @pg_close($this->conn);
	    unset($this->conn);
	    $this->Log->do_log("Database: " . $this->con_str["db"] . " released");
	}else $this->Log->do_log("ERROR: no database open");
	$this->Log->stop_log();
    }
    
    function is_connected(){
        return $this->check_con();
    }

   function get_error(){
       $fname = $this->pg_last_error;
       return @$fname($this->conn);
   }
   
    function begin(){
	if($this->conn){
      $fname = $this->pg_query; 
	    if(@$fname($this->conn, "BEGIN")){
		$this->Log->do_log("Transaction OK: started.");
		return true;
	    }
	    else {
		$this->Log->do_log("Transaction FAILED: BEGIN got." . $this->get_error());
		return false;
	    }
	}
	else {
	    $this->Log->do_log("ERROR: no database open");
	    return false;
	}
    }
				     
    function commit(){
	if($this->conn){
      $fname = $this->pg_query;
	    if(@$fname($this->conn, "COMMIT")){
		$this->Log->do_log("Transaction OK: ended.");
		return true;
	    }
	    else {
		$this->Log->do_log("Transaction FAILED: COMMIT got: " . $this->get_error());
		return false;
	    }
	}
	else {
	    $this->Log->do_log("ERROR: no database open");
	    return false;
	}
    }									     
    
    function rollback(){
	if($this->conn){
      $fname = $this->pg_query;
	    if(@$fname($this->conn, "ROLLBACK")){
		$this->Log->do_log("Transaction OK: aborted.");
		return true;
	    }
	    else {
		$this->Log->do_log("Transaction FAILED: ROLLBACK got: " . $this->get_error());
		return false;
	    }
	}
	else {
	    $this->Log->do_log("ERROR: no database open");
	    return false;
	}
    }									     

    function current_row($res_id){
	return $this->row_no[$res_id];
    }

    
    function get_conn_str($var){
        return $this->con_str[$var];
    }
    
    function set_conn_str($var,$val){
        $this->con_str[$var] = $val;
    }
   
		   
    function check_con(){
	if(!$this->conn)
	    return false;
	return true;
    }
    
    function check_res(){
	if(!$this->res)
	    return false;
	return true;
    }
    
    function fetch_object($res_id){
        if(!($result=@pg_fetch_object($this->res[$res_id],$this->row_no[$res_id])))
	    return false;
	else{
	    $this->row_no[$res_id]++;
	    return $result;
	}
    }
    
    function fetch_array($res_id){
        if(!($result=@pg_fetch_array($this->res[$res_id],$this->row_no[$res_id])))
	    return false;
	else{
	    $this->row_no[$res_id]++;
	    return $result;
	}
    }
    
    function fetch_row($res_id){
        if(!($result=@pg_fetch_row($this->res[$res_id],$this->row_no[$res_id])))
	    return false;
	else{
	    $this->row_no[$res_id]++;
	    return $result;
	}
    }
    
    function num_rows($res_id){
        $fname = $this->pg_num_rows;
        return @$fname($this->res[$res_id]);            
    }		
}
?>
