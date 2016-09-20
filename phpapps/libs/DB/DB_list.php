<?php

class DB_list{
	var $globals;
	var $list_name;
	
	var $list_array = array();
	
	function __construct($listname){
		global $GLOBALS_OBJ;
		$this->globals = $GLOBALS_OBJ;
		
		$this->list_name = $listname;
		return $this;
	}
	
	function getArray(){
		$sql = new DB_query("SELECT ID,VALUE FROM ".$this->list_name);
		if( $this->globals->con->query($sql, $this->list_name) != -1 ){
		
			while($res=$this->globals->con->fetch_array($this->list_name)){
				$this->list_array[$res["ID"]] = $res["VALUE"];
			}
		}else{
			//eroare
		}
		return $this->list_array;
	}
	
	function getID($val){
		$id = -1;
		$sql = new DB_query("SELECT ID FROM ".$this->list_name . " WHERE VALUE = :val",array(":val"=>$val));
		if($this->globals->con->query($sql,"DB_list_getID") != -1){
			$this->globals->con->next("DB_list_getID");
			$id = $this->globals->con->get_field("ID","DB_list_getID");
		}
		return $id;
	}
	
	function getValue($id){
		$value = -1;
		$sql = new DB_query("SELECT VALUE FROM ".$this->list_name . " WHERE ID = :val",array(":val"=>$id));
		if($this->globals->con->query($sql,"DB_list_getVALUE") != -1){
			$this->globals->con->next("DB_list_getVALUE");
			$value = $this->globals->con->get_field("VALUE","DB_list_getVALUE");
		}
		return $value;
	}

};
