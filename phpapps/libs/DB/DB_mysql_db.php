<?php
//namespace wabdo;
// Clasa pentru baze de date mysql
class mysql
 {
    var $Log;
    var $con_str;
    var $conn;
    var $res = array();
    var $row = array();
    var $row_no = array();
    var $recordcount = array();
    var $SQL;
    
    function mysql($con_str,$Log){
	$this->Log = &$Log;
	$this->con_str = $con_str;
        if (!$this->conn=@mysql_connect($con_str["host"] . ":" . $con_str["port"] . ($con_str["sock"] != "" ? $_tmp = ":" . $con_str["sock"] : $_tmp = "" ) 
			    ,$con_str["user"],$con_str["pass"]))
        {
            $this->Log->do_log("Connection ERROR: " . $this->get_error());
	    $this->Log->print_log();
            //exit;
        }
	$this->Log->do_log("Connection OK");
	$this->res["default"] = "";
	if($this->con_str["db"]!="")
	    $this->select_db($this->con_str["db"]);
    }

    function reconnect(){
	if($this->conn)
            $this->close_db();
        if (!$this->conn=@mysql_connect($this->con_str["host"] . ":" . $this->con_str["port"] . ($this->con_str["sock"] != "" ? $_tmp = ":" . $this->con_str["sock"] : $_tmp = "" ) 
			    ,$this->con_str["user"],$this->con_str["pass"]))
        {
            $this->Log->do_log("Connection ERROR: " . $this->get_error());
	    return false;
        }
	$this->Log->do_log("Connection OK");
	$this->res["default"] = "";
	if($this->con_str["db"]!="")
	    $this->select_db($this->con_str["db"]);
	return true;
    }
    
    function select_db($database) {
	$this->con_str["db"] = $database;
        if (!@mysql_select_db($database,$this->conn)) {
	    $this->Log->do_log("ERROR: " . $this->get_error());
	    return false;
        }else {
	    $this->Log->do_log("DB ".$this->con_str["db"] ." selected ");
	    return true;
	}
    }
    
    function free_result($res_id){
	if($this->conn && $this->res[$res_id])
            return @mysql_free_result ($this->res[$res_id]);
    }
        
    function query($sql,$res_id){ //return false on error or number of rows on succes
	$this->SQL[$res_id] = $sql;
	if($this->conn){
	    $this->free_result($res_id);
	    $this->res[$res_id]=@mysql_query($this->SQL[$res_id], $this->conn);
	    if($this->res[$res_id]){
		$this->recordcount[$res_id] = @mysql_num_rows($this->res[$res_id]);
		$this->row_no[$res_id] = 0;
		$this->Log->do_log("Query OK: ". $this->SQL[$res_id] ." got: " . $this->recordcount[$res_id] . " rows");
		$this->get_row($res_id);
		$this->first($res_id);
		@mysql_data_seek($this->res[$res_id],0);
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
	    $this->row[$res_id] = @mysql_fetch_array($this->res[$res_id]);
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
	if($this->row_no[$res_id] == $this->recordcount[$res_id] )
	    return false;
	else {
		$this->get_row($res_id);
		$this->row_no[$res_id]++;
		return true;
	}
    }

    function first($res_id){
	if(@mysql_data_seek($this->res[$res_id],0)){
	    $this->get_row($res_id);
	    return true;
	}else
	    return true;
    }
    
    function last($res_id){
	//return @mysql_data_seek($this->res[$res_id],$this->recordcount[$res_id] - 1);
	return $this->move_to(($this->recordcount[$res_id]) - 1 ,$res_id);
    }
    
    function move_to($row_id,$res_id){
	if($this->res){
	    if( $row_id >=0 && $row_id < $this->recordcount[$res_id] ){
		if (!@mysql_data_seek($this->res[$res_id],$row_id)){
		    $this->Log->do_log("ERROR:  Could not move to record $row_id got :" . $this->get_error());
		    return false;
		}else {
		    $this->row_no[$res_id] = $row_id;
		    $this->get_row($res_id);
		    return true;
		}
	    } else
		return false;
	}else{
	    $this->Log->do_log("ERROR: no result open");
	    return false;
	}
    }
    
    function prev($res_id){
        if(!($this->row_no[$res_id] < 0) ){
    	    if (!@mysql_data_seek($this->res[$res_id],$this->row_no[$res_id])){
	        $this->Log->do_log("ERROR:  Could not move to record $row_id got :" . $this->get_error());
	        return false;
	    }else {
	        $this->get_row($res_id);
		$this->row_no[$res_id]--;
	        return true;
	    }
	} else  return false;
    }
    
    function get_field($field,$res_id){
	return $this->row[$res_id][$field];
    }
    
    function get_field_name($field,$res_id){
	if($this->res[$res_id]){
	    return @mysql_field_name($this->res[$res_id],$field);
	}else{
	    $this->Log->do_log("ERROR: no result open");
	    return "";
	}
    }
    
    function get_num_fields($res_id){
	if($this->res[$res_id]){
	    return @mysql_num_fields($this->res[$res_id]);
	}else{
	    $this->Log->do_log("ERROR: no result open");
	    return -1;
	}
    }		 
    
    function get_field_num($field,$res_id){
	if($this->res[$res_id]){
	    for($i=0;$i<$this->get_num_fields($res_id);$i++)
		if($field == $this->get_field_name($i,$res_id))
		    return $i;
	    return -1;
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
				$this->res[$res_id]=@mysql_query($queries, $this->conn);
				if($this->res[$res_id]){
					$results[$i] = @mysql_affected_rows($this->conn);
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
					//return $results;
					return -1;
				}else{
					$this->recordcount[$res_id] = 0;
					$this->Log->do_log("Queries OK.");
					return $results;
				}
			}
			}else{
				$this->SQL[$res_id] = $sql;
				$result = 0;
				$this->res[$res_id]=@mysql_query($sql, $this->conn);
				if($this->res[$res_id]){
					$result = @mysql_affected_rows($this->conn);
					$this->recordcount[$res_id]=0;
					$this->Log->do_log("Query OK: ". $sql ." got: " . $result . " affected rows");
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
    
    function insert_id(){
        return @mysql_insert_id($this->conn);           
    }

    function record_count($res_id){
	return $this->recordcount[$res_id];
    }
    
    function get_db_name(){
	return $this->con_str["db"];
    }
    
    function close_db(){
	if($this->conn){
    	    @mysql_close($this->conn);
	    unset($this->conn);
	    $this->Log->do_log("Database: " . $this->con_str["db"] . " released");
	} else $this->Log->do_log("ERROR: no database open");
	$this->Log->stop_log();
    }
    
    function is_connected(){
	return $this->check_con();
    }
    
    function get_error(){
	return @mysql_errno()." ".@mysql_error();
    }
    
    function begin(){
	 return true;
    }
				      
    function commit(){
	return true;
    }
								      
    function rollback(){
	return true;
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
				    
    function fetch_object($res_id){
        if(!($result = @mysql_fetch_object($this->res[$res_id])))
	    return false;
	else {
	    $this->row_no[$res_id]++;
	    return $result;
	}
    }
    
    function fetch_array($res_id){
        if(!($result = @mysql_fetch_array($this->res[$res_id],MYSQL_ASSOC)))
	    return false;
	else {
	    $this->row_no[$res_id]++;
	    return $result;
	}
    }
    
    function fetch_row($res_id){
	if(!($result = @mysql_fetch_row($this->res[$res_id])))
	    return false;
	else {
	    $this->row_no[$res_id]++;
	    return $result;
	}
    }

    function num_rows($res_id){
        return @mysql_num_rows($this->res[$res_id]);            
    }
}
?>