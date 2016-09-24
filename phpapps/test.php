<?php
require_once ("globals.php");
include ("libs/DB/DB_table_def.php");

class test{
	
	public $table1;
	public $globals;
	
	function test(){
		$this->globals = new Globals();
		$this->globals->con->select_db("phpapps");
		
		//$col1 = 
		//$col1->globals = $this->globals;
		//$col1->setup_tpl();
		
		$this->table1=new DB_table_def_html($this->globals,"phpapps","test1");
		$this->table1->columns[] = new DB_column_def("nume","1","2","10","","");
		echo count($this->table1->columns);
	}
	
	
	function displayTpl(){
	
		
		$this->globals->sm->assign(array(
                  "test" => $this->table1->get_html_str(),
		//          "test" => $select_column_types->get_select_str(),
                  ));
		
		$this->globals->sm->display("test.tpl");
	}
}

$aa=new test();
$aa->displayTpl();


?>