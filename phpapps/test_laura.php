<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class test_laura extends phpapps_display_abs{

    private $app_id;
    private $module_id;
    public  $script_id = 253;
    
    function __construct($app_id) {
        parent::__construct();
        //$this->layout = PHPAPPS_LAYOUTS_DIR . "default.tpl";
        $this->tpl = "test_laura.tpl";        
        $this->app_id = 1;
        $this->module_id = 21;
        $this->script_id = 253;
        $this->app_id = $app_id;
		
	$this->display_objects_type_id = '2';
    	$this->display_objects_type = 'SCRIPT';
    	$this->display_objects_id = $this->script_id;
        
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "test_laura: Youre code here."));
        $this->loadElements();
        $this->displayTpl();
    }
}

new test_laura($_GET["app_id"]);
?>