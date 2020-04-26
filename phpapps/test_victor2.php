<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class test_victor2 extends phpapps_display_abs{

        private $app_id;
        private $module_id;
    
    
        public $script_id = 281;
        public $display_objects_type_id = '2';
        public $display_objects_type = 'SCRIPT';
        public $display_objects_id = 281;
    
    function __construct($app_id) {
        parent::__construct();
        
        $this->tpl = "test_victor2.tpl";        
        $this->display_objects_id = $this->script_id;
        
        $this->app_id = 1;
        $this->module_id = 21;
        
        
        $this->app_id = $app_id;
        
    	

        // phpapps_display_abs Load all elelments
        $this->loadElements(); // parent function
        $this->setupDisplay();
        $this->displayTpl(); // parent function
    }
    
    function setupDisplay() {
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "test_victor2: Youre code here."));
    }
    
}

new test_victor2($_GET["app_id"]);
?>