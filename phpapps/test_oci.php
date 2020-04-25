<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



require_once ("globals.php");
require_once (DB_LIBS_DIR . "DB_grid_v5_oci.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");
set_time_limit ( 600 );
class test_oci extends phpapps_display_abs{

    private $app_id;
    
    function __construct($app_id) {
        parent::__construct();
        //$this->layout = PHPAPPS_LAYOUTS_DIR . "phpapps.tpl";
        $this->tpl = "test_oci.tpl";        
        $this->app_id = $app_id;
        
        $this->tets_oci_run();
        
        //$this->globals->sm->assign(array("SCRIPT_CONTENT" => "test_oci: Youre code here."));
		
        $this->displayTpl();
    }
	
	function tets_oci_run(){



 
 //$sql = new DB_query("describe per_all_assignments_f");


//$sql = new DB_query("SELECT sysdate as A from dual");
$sql = new DB_query("SELECT * FROM customers");
 $this->globals->con2->query($sql);
 $this->globals->con2->next();
 echo "<h1>AICI:".$this->globals->con2->get_field("A")."</h1>";
 

$test_grid = new DB_grid_oci($this->globals->con2, "query",$sql,"phpapps_lists_grid");	
$test_grid->cols = array ("ID","NAME","CITY");
$test_grid->labels = array ("ID","NAME","CITY");
$test_grid->paginable = false;
$test_grid->editable = false;
$test_grid->sortable = false;
$test_grid->filterable = false;

echo $test_grid->get_grid_str();
$this->globals->sm->assign(array("SCRIPT_CONTENT" => "AAAAAAAAAAAAAA" . $test_grid->get_grid_str()));		

	}
	
}

new test_oci($_GET["app_id"]);
?>