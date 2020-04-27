<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class aa extends phpapps_display_abs{

        private $app_id;
        private $module_id;
    
    
        public $script_id = 286;
        public $display_objects_type_id = '2';
        public $display_objects_type = 'SCRIPT';
        public $display_objects_id = 286;
    
    function __construct($app_id) {
        parent::__construct();
        
        $this->tpl = "aa.tpl";        
        $this->display_objects_id = $this->script_id;
        
        $this->app_id = 1;
        $this->module_id = 27;
        
        
        $this->app_id = $app_id;
        
    	

        // phpapps_display_abs Load all elelments
        $this->loadElements(); // parent function
        $this->setupDisplay();
        $this->displayTpl(); // parent function
    }
    
    function setupDisplay() {
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "aa: Youre code here."));
    }
    
}

new aa($_GET["app_id"]);
?>