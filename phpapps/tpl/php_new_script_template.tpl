<?php
namespace wabdo;
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class {$CLASS_NAME} extends phpapps_display_abs{ldelim}

        private $app_id;
        private $module_id;
    
    
        public $script_id = {$SCRIPT_ID};
        public $display_objects_type_id = '2';
        public $display_objects_type = 'SCRIPT';
        public $display_objects_id = {$SCRIPT_ID};
    
    function __construct($app_id) {ldelim}
        parent::__construct();
        
        $this->tpl = "{$CLASS_NAME}.tpl";        
        $this->display_objects_id = $this->script_id;
        
        $this->app_id = {$APP_ID};
        $this->module_id = {$MODULE_ID};
        
        
        $this->app_id = $app_id;
        
    	

        // phpapps_display_abs Load all elelments
        $this->loadElements(); // parent function
        $this->setupDisplay();
        $this->displayTpl(); // parent function
    {rdelim}
    
    function setupDisplay() {ldelim}
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "{$CLASS_NAME}: Youre code here."));
    {rdelim}
    
{rdelim}

new {$CLASS_NAME}($_GET["app_id"]);
?>