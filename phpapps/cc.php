<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class cc extends template{

        private $app_id;
        private $module_id;
    
    
        public $script_id = 306;
        public $display_objects_type_id = '2';
        public $display_objects_type = 'SCRIPT';
        public $display_objects_id = 306;
    
    function __construct($app_id) {
        parent::__construct();
        
        $this->tpl = "cc.tpl";        
        $this->display_objects_id = $this->script_id;
        
        $this->app_id = 1;
        $this->module_id = 27;
        
        
        $this->app_id = $app_id;
        
    	

        // template Load all elelments
        $this->load_elements(); // parent function
        $this->setup_display();
        $this->display_template(); // parent function
    }
    
    function setup_display() {
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "cc: Youre code here."));
    }
    
}

new cc($_GET["app_id"]);
?>