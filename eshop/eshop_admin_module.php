<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class eshop_admin_module extends template{

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
        
    	

        // template Load all elelments
        $this->load_elements(); // parent function
        $this->setup_display();
        $this->display_template(); // parent function
    }
    
    function setup_display() {
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "eshop_admin_module: Youre code here."));
    }
    
}

new eshop_admin_module($_GET["app_id"]);
?>