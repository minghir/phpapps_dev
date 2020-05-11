<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class test_jquery extends template{

    private $app_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->layout = PHPAPPS_LAYOUTS_DIR . "default.lay";
        $this->tpl = "test_jquery.tpl";        
        $this->app_id = $app_id;
        
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "test_jquery: Youre code here."));
        
        $this->display_template();
    }
}

new test_jquery($_GET["app_id"]);
?>