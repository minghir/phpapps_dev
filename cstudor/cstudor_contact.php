<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class cstudor_contact extends template{

    private $app_id;
    private $module_id;
    private $script_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->layout = PHPAPPS_LAYOUTS_DIR . "default.lay";
        $this->tpl = "cstudor_contact.tpl";        
        $this->app_id = 88;
        $this->module_id = 29;
        $this->script_id = 234;
        $this->app_id = $app_id;
        
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "cstudor_contact: Youre code here."));
        
        $this->display_template();
    }
}

new cstudor_contact($_GET["app_id"]);
?>