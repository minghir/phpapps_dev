<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class eshop_admin_module extends phpapps_display_abs{

        private $app_id;
        private $module_id;
        public $APP_NAME;
        public $MODULE_TITLE;
    
    
        public $script_id = 299;
        public $display_objects_type_id = '2';
        public $display_objects_type = 'SCRIPT';
        public $display_objects_id = 299;
    
    function __construct($app_id) {
        parent::__construct();
        
        $this->tpl = "eshop_admin_module.tpl";        
        $this->display_objects_id = $this->script_id;
        
        $this->app_id = 7;
        $this->module_id = 10;
        
        $this->APP_NAME = "eshop";
        $this->MODULE_TITLE = "admin";
        $this->app_id = $app_id;
        
    	

        // phpapps_display_abs Load all elelments
        $this->loadElements(); // parent function
        $this->setupDisplay();
        $this->displayTpl(); // parent function
    }
    
    function setupDisplay() {
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "eshop_admin_module: Youre code here."));
    }
    
}

new eshop_admin_module($_GET["app_id"]);
?>