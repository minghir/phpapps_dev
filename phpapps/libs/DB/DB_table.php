<?php
class DB_table{
	var $globals;
	var $table_name;
        public $errors;
	
	function __construct($tablename){
		global $GLOBALS_OBJ;
		$this->globals = &$GLOBALS_OBJ;
                $this->table_name = $tablename;
		return $this;
	}
	
	function getID($fld,$val){
		$id = -1;
		$sql = new DB_query("SELECT ID FROM ".$this->table_name . " WHERE $fld = :val LIMIT 1",array(":val"=>$val));
		if($this->globals->con->query($sql,"DB_table_getID") != -1){
			$this->globals->con->next("DB_table_getID");
			$id = $this->globals->con->get_field("ID","DB_table_getID");
		}
		return $id;
	}
	
	function getValue($fld,$id){
		$value = -1;
		$sql = new DB_query("SELECT $fld FROM ".$this->table_name . " WHERE ID = :val",array(":val"=>$id));
		if($this->globals->con->query($sql,"DB_table_getVALUE") != -1){
			$this->globals->con->next("DB_table_getVALUE");
			$value = $this->globals->con->get_field($fld,"DB_table_getVALUE");
		}
		return $value;
	}
        
        function getValueByField($fld1,$fld2,$val2){
		$value = -1;
		$sql = new DB_query("SELECT $fld1 FROM ".$this->table_name . " WHERE $fld2 = :val",array(":val"=>$val2));
		if($this->globals->con->query($sql,"DB_table_getVALUE") != -1){
			$this->globals->con->next("DB_table_getVALUE");
			$value = $this->globals->con->get_field($fld1,"DB_table_getVALUE");
		}
		return $value;
	}
	
	function getArray($fld){
		$sql = new DB_query("SELECT ID, $fld AS VALUE FROM ".$this->table_name);
		if( $this->globals->con->query($sql, $this->table_name) != -1 ){
		
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
            $sql  =  new DB_query("SELECT " . implode(",",$array_flds) . 
                        " FROM " .$this->table_name . 
                        " WHERE $search_fld = :$search_fld LIMIT 1",
                    array(":$search_fld"=>$search_val));
//            print_r($sql);
            if($this->globals->con->query($sql,"DB_table_getVALUES") != -1){
			$value = $this->globals->con->fetch_array("DB_table_getVALUES");
            }else{
                $this->errors[] = $this->globals->con->get_error("DB_table_getVALUES");
            }
            return $value;
        }
}


function _tbl($table_name,$fld,$val,$val_fld = "ID"){
    return (new DB_table($table_name))->getValueByField($fld,$val_fld,$val);
}
