<?php
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
	var $columncount = array();
	var $SQL = array();
	var $DB_queries = array();

	function __constructor(){

	}	
	/*PDO*/
    function mysql($con_str,$Log){
		$this->Log = &$Log;
		$this->con_str = $con_str;
		$dsn = "mysql:host=".$this->con_str["host"].";port=".$this->con_str["port"].";dbname=".$this->con_str["db"].";charset=utf8";

		try{
			$this->conn = new PDO($dsn, $this->con_str["user"], $this->con_str["pass"]);
		} catch (PDOException $err) {
			$this->Log->do_log("Connection ERROR: " . $err->getMessage());
			$this->Log->print_log();
		}
/*
		if (!$this->conn = new PDO($dsn, $this->con_str["user"], $this->con_str["pass"])) {
            $this->Log->do_log("Connection ERROR: " . $this->get_error());
			$this->Log->print_log();
        }
*/		
		//$this->Log->do_log("Connection OK");
		$this->res["default"] = "";
    }
	
	/*PDO*/
    function reconnect(){
		if($this->conn){
			$this->conn = null;
		}
		
		$dsn = "mysql:host=".$this->con_str["host"].";port=".$this->con_str["port"].";dbname=".$this->con_str["db"].";charset=utf8";
		
		try{
			$this->conn = new PDO($dsn, $this->con_str["user"], $this->con_str["pass"]);
		} catch (PDOException $err) {
			$this->Log->do_log("Connection ERROR: " . $err->getMessage());
			$this->Log->print_log();
			return false;
		}
		
		$this->res["default"] = "";
		return true;
    }
    
	/*PDO*/
    function select_db($database) {
		$this->con_str["db"] = $database;
		$this->reconnect();
    }
    
	/*PDO*/
    function free_result($res_id){
		if($this->conn && $this->res[$res_id]){
        	$this->row[$res_id] = array();
			$this->recordcount[$res_id]=0;
			$this->row_no[$res_id] = 0;
			return $this->res[$res_id]->closeCursor();
		}
    }
	
    /*PDO*/    
    //function query($sql,$res_id){ //return false on error or number of rows on succes
	function query($db_query,$res_id){ //return false on error or number of rows on succes
		$this->SQL[$res_id] = $db_query->sql();

		if($this->conn){
			$this->free_result($res_id);
			//$this->res[$res_id]=$this->conn->query($sql);
			$this->res[$res_id]=$this->conn->prepare($db_query->sql(),array(PDO::ATTR_CURSOR => PDO::CURSOR_SCROLL));
		
//echo"<br>===========<br>";			
//print_r($db_query);			
//echo $db_query->sql();
//echo"<br>==========<br>";

			//$this->res[$res_id]->execute($db_query->getParams());
			//if($this->res[$res_id]){
			
			if($this->res[$res_id]->execute($db_query->getParams())){
				$this->recordcount[$res_id] = $this->res[$res_id]->rowCount();
				$this->columncount[$res_id] = $this->res[$res_id]->columnCount();
				$this->Log->do_log("Query OK: \"". $this->SQL[$res_id] ."\" got: " . $this->recordcount[$res_id] . " rows");
				return $this->recordcount[$res_id];
			}else{
				$this->recordcount[$res_id] = 0;
				$this->columncount[$res_id] = 0;
				$this->Log->do_log("Query ERROR: " . $this->SQL[$res_id] . " got: ". $this->get_error($res_id));
				return -1;
			}
		}else{
			$this->recordcount[$res_id] = 0;
			$this->columncount[$res_id] = 0;
			$this->Log->do_log("ERROR: no database open");
			return -1;
		}
    }

	/*PDO*/    
    function get_row($res_id,$ori = PDO::FETCH_ORI_NEXT){
		if($this->res[$res_id]){
			//if(!($result = $this->res[$res_id]->fetch(PDO::FETCH_ASSOC))){
			$this->row[$res_id] = $this->res[$res_id]->fetch(PDO::FETCH_ASSOC,PDO::FETCH_ORI_NEXT);
			if($this->row[$res_id])
				return true;
			else
				return false;
		}else{
				$this->Log->do_log("ERROR: no database open");
			return false;
		}
    }
	
	/*PDO*/    
	function get_field($field,$res_id){
		return $this->row[$res_id][$field];
    }

	/*PDO*/
    function next($res_id){
		if($this->res[$res_id]){
			$this->row[$res_id] = $this->res[$res_id]->fetch(PDO::FETCH_ASSOC,PDO::FETCH_ORI_NEXT);
			if($this->row[$res_id]){
				$this->row_no++;
				return true;
			}else{
				return false;
			}
		}else{
				$this->Log->do_log("ERROR: no database open");
			return false;
		}
    }
	
	/*PDO*/
    function first($res_id){
		if($this->res[$res_id]){
			$this->row[$res_id] = $this->res[$res_id]->fetch(PDO::FETCH_ASSOC,PDO::FETCH_ORI_FIRST);
			if($this->row[$res_id]){
				$this->row_no = 0;
				return true;
			}else{
				return false;
			}
		}else{
				$this->Log->do_log("ERROR: no database open");
			return false;
		}
    }
    
	/*PDO*/
    function last($res_id){
		if($this->res[$res_id]){
			$this->row[$res_id] = $this->res[$res_id]->fetch(PDO::FETCH_ASSOC,PDO::FETCH_ORI_LAST);
			if($this->row[$res_id])
				return true;
			else
				return false;
		}else{
				$this->Log->do_log("ERROR: no database open");
			return false;
		}
    }
    
	/* PDO */
    function move_to($row_id,$res_id){
		if($this->res[$res_id]){
			$this->row[$res_id] = $this->res[$res_id]->fetch(PDO::FETCH_ASSOC,PDO::FETCH_ORI_REL, $row_id );
			if($this->row[$res_id])
				return true;
			else
				return false;
		}else{
				$this->Log->do_log("ERROR: no database open");
			return false;
		}
    }
    
	/* PDO */
    function prev($res_id){
		if($this->res[$res_id]){
			$this->row[$res_id] = $this->res[$res_id]->fetch(PDO::FETCH_ASSOC,PDO::FETCH_ORI_PRIOR);
			if($this->row[$res_id])
				return true;
			else
				return false;
		}else{
				$this->Log->do_log("ERROR: no database open");
			return false;
		}
    }
    
	/* PDO */
	function get_field_name($field,$res_id){
			if($this->res[$res_id]){
			$tmp = $this->res[$res_id]->getColumnMeta($field);
			return $tmp["name"];
		}else{
			$this->Log->do_log("ERROR: no result open");
			return null;
		}
    }
	
	/* PDO */
    function get_num_fields($res_id){
		if($this->res[$res_id]){
			return $this->res[$res_id]->columnCount();
		}else{
			$this->Log->do_log("ERROR: no result open");
			return -1;
		}
    }		 
    
	/* PDO */
    function get_field_num($field,$res_id){
		if($this->res[$res_id]){
			for($i=0;$i<$this->get_num_fields($res_id);$i++){
				if($field == $this->get_field_name($i,$res_id)){
					return $i;
				}
			}
			return -1;
		}else{
			$this->Log->do_log("ERROR: no result open");
			return -1;
		}
    }
    
	/* PDO */
	
	//function exec($sql,$res_id){} ///de sters
	/*
		if($this->conn){
			$this->free_result($res_id);
			if(is_array($sql)){
			$results = array();
			$i = 0;
			$test = 0;
			foreach($sql as $queries){
				$this->res[$res_id]=$this->conn->prepare($queries);
				$this->res[$res_id]->execute();
				if($this->res[$res_id]){
					$results[$i] = $this->res[$res_id]->rowCount();
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
				$this->res[$res_id]=$this->conn->prepare($sql);
				$this->res[$res_id]->execute();
				if($this->res[$res_id]){
					$result = $this->res[$res_id]->rowCount();
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
    */
	/*PDO*/
    function insert_id($res_id){
       // return @mysql_insert_id($this->conn);   
		return $this->res[$res_id]->lastInsertId();
    }

    /*PDO*/
	function record_count($res_id){
		return $this->recordcount[$res_id];
    }
	
	/*PDO*/
	function column_count($res_id){
		return $this->columncount[$res_id];
    }
    
	/*PDO*/
    function get_db_name(){
		return $this->con_str["db"];
    }
    
	/*PDO*/
    function close_db(){
	if($this->conn){
    	   $this->conn = null;
	    unset($this->conn);
	    $this->Log->do_log("Database: " . $this->con_str["db"] . " released");
	} else $this->Log->do_log("ERROR: no database open");
		$this->Log->stop_log();
    }
    
    function is_connected(){
		return $this->check_con();
    }
    
	/*PDO*/
    function get_error($res_id){
		// doar sting error
		return $this->res[$res_id]->errorInfo()[2];
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
			
	/*PDO*/			
    function fetch_object($res_id){
        if(!($result = $this->res[$res_id]->fetchObject())){
			return false;
		}else {
			$this->row_no[$res_id]++;
			return $result;
		}
    }
    
	/*PDO*/			
    function fetch_array($res_id){
		if(!($result = $this->res[$res_id]->fetch(PDO::FETCH_ASSOC))){
			return false;
		}else {
			$this->row_no[$res_id]++;
			return $result;
		}
    }
    
	/*PDO*/			
    function fetch_row($res_id){

		if(!($result = $this->res[$res_id]->fetch(PDO::FETCH_NUM))){
			return false;
		}else {
			$this->row_no[$res_id]++;
			return $result;
		}
    }

	/*PDO*/	
    function num_rows($res_id){
        return $this->res[$res_id]->rowCount();         
    }
}
?>