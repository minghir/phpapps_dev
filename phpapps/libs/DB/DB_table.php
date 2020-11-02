<?php
namespace wabdo;
class DB_table{
	var $globals;
	var $table_name;
        public $errors;
        public $sql;
	
	function __construct($tablename){
		global $GLOBALS_OBJ;
		$this->globals = &$GLOBALS_OBJ;
                $this->table_name = $tablename;
                $this->sql = "";
		return $this;
	}
	
	function getID($fld,$val){
		$id = -1;
		$this->sql = new DB_query("SELECT ID FROM ".$this->table_name . " WHERE $fld = :val LIMIT 1",array(":val"=>$val));
		if($this->globals->con->query($this->sql,"DB_table_getID_$fld") != -1){
			$this->globals->con->next("DB_table_getID_$fld");
			$id = $this->globals->con->get_field("ID","DB_table_getID_$fld");
		}
		return $id;
	}
	
	function getValue($fld,$id){
		$value = -1;
		$this->sql = new DB_query("SELECT $fld FROM ".$this->table_name . " WHERE ID = :val",array(":val"=>$id));
		if($this->globals->con->query($this->sql,"DB_table_getVALUE_$fld") != -1){
			$this->globals->con->next("DB_table_getVALUE_$fld");
			$value = $this->globals->con->get_field($fld,"DB_table_getVALUE_$fld");
		}
		return $value;
	}
        
        function getValueByField($fld1,$fld2,$val2){
		$value = -1;
		$this->sql = new DB_query("SELECT $fld1 FROM ".$this->table_name . " WHERE $fld2 = :val",array(":val"=>$val2));
		if($this->globals->con->query($this->sql,"DB_table_getVALUE_$fld1") != -1){
			$this->globals->con->next("DB_table_getVALUE_$fld1");
			$value = $this->globals->con->get_field($fld1,"DB_table_getVALUE_$fld1");
		}
		return $value;
	}
	
	function getArray($fld){
		$this->sql = new DB_query("SELECT ID, $fld AS VALUE FROM ".$this->table_name);
		if( $this->globals->con->query($this->sql, $this->table_name) != -1 ){
		
			while($res=$this->globals->con->fetch_array($this->table_name)){
				$this->list_array[$res["ID"]] = $res["VALUE"];
			}
		}else{
			//eroare
		}
		return $this->list_array;
	}
        
        function getColumnArray($fld,$search_fld,$search_val){
		$this->sql = new DB_query("SELECT ID, $fld AS VALUE " 
                        . "FROM ".$this->table_name .
                        " WHERE $search_fld = :$search_fld",
                    array(":$search_fld"=>$search_val));
                
		if( $this->globals->con->query($this->sql, $this->table_name) != -1 ){
		
			while($res=$this->globals->con->fetch_array($this->table_name)){
				$this->list_array[$res["ID"]] = $res["VALUE"];
			}
		}else{
			//eroare
		}
		return $this->list_array;
	}
        
        function getFieldsArray($array_flds = array(),$search_fld,$search_val){
            $value = -1;
            $this->sql  =  new DB_query("SELECT " . implode(",",$array_flds) . 
                        " FROM " .$this->table_name . 
                        " WHERE $search_fld = :$search_fld LIMIT 1",
                    array(":$search_fld"=>$search_val));
            if($this->globals->con->query($this->sql,"DB_table_getVALUES_$search_fld") != -1){
			$value = $this->globals->con->fetch_array("DB_table_getVALUES_$search_fld");
            }else{
                $this->errors[] = $this->globals->con->get_error("DB_table_getVALUES_$search_fld");
            }
            return $value;
        }
        
        function getLineArray($search_fld,$search_val){
            $value = -1;
            $this->sql  =  new DB_query("SELECT * " .
                        " FROM " .$this->table_name . 
                        " WHERE $search_fld = :$search_fld LIMIT 1",
                    array(":$search_fld"=>$search_val));
//            print_r($sql);
            if($this->globals->con->query($this->sql,"DB_table_getVALUES_$search_fld") != -1){
			$value = $this->globals->con->fetch_array("DB_table_getVALUES_$search_fld");
            }else{
                $this->errors[] = $this->globals->con->get_error("DB_table_getVALUES_$search_fld");
            }
            return $value;
        }
        
        function prnt(){
            return $this->sql->prnt();
        }
}

// returns $fld from $table_name where $search_fld = $serach_val
function _tbl($table_name,$fld,$serach_val,$search_fld = "ID"){
    return (new DB_table($table_name))->getValueByField($fld,$search_fld,$serach_val);
}

