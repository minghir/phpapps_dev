<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class phpapps extends template{

    private $app_id;
    private $module_id;
    private $script_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->layout = PHPAPPS_LAYOUTS_DIR . "default.tpl";
        $this->tpl = "phpapps.tpl";
        $this->app_id = 1;
        $this->module_id = 1;
        $this->script_id = 248;
        $this->app_id = $app_id;
        
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "phpapps: Youre code here."));
        
        $this->display_template();
    }
}

new phpapps($_GET["app_id"]);
?>