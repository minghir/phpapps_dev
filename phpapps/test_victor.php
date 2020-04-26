<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class test_victor extends phpapps_display_abs{

    private $app_id;
    private $module_id;
    public $script_id;
    
    function __construct($app_id) {
        parent::__construct();
        //$this->layout = PHPAPPS_LAYOUTS_DIR . "default.tpl";
        $this->tpl = "test_victor.tpl";        
        $this->app_id = 1;
        $this->module_id = 21;
        $this->script_id = 268;
        $this->app_id = $app_id;
        $this->display_objects_type_id = '2';
    	$this->display_objects_type = 'SCRIPT';
    	$this->display_objects_id = $this->script_id;

        // phpapps_display_abs Load all elelments
        $this->loadElements(); // parent function
        $this->setupDisplay();
        $this->displayTpl(); // parent function
    }
    
    function setupDisplay() {
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "test_victor: Youre code here."));
    }
    
}

new test_victor($_GET["app_id"]);
?>