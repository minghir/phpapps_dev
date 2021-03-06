<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class atsepa extends template{

    private $app_id;
    private $module_id;
    private $script_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->layout = PHPAPPS_LAYOUTS_DIR . "default.tpl";
        $this->tpl = "atsepa.tpl";        
        $this->app_id = 10;
        $this->module_id = 20;
        $this->script_id = 251;
        $this->app_id = $app_id;
        
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "atsepa: Youre code here."));
        
        $this->display_template();
    }
}

new atsepa($_GET["app_id"]);
?>