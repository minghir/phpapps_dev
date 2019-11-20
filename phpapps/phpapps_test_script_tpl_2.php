<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class test_script_tpl extends phpapps_display_abs{

    private $app_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->layout = PHPAPPS_LAYOUTS_DIR . "default.lay";
        $this->tpl = "test_script_tpl.tpl";        
        $this->app_id = $app_id;
        
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "test_script_tpl: Youre code here."));
        
        $this->displayTpl();
    }
}

new test_script_tpl($_GET["app_id"]);
?>