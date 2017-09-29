<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class test_layout extends phpapps_display_abs{

    private $app_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->tpl = "test_layout.tpl";        
        $this->app_id = $app_id;
        //$this->layout = PHPAPPS_LAYOUTS_DIR . "test1.lay.tpl";
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "test_layout: Youre code here."));
        
        $this->displayTpl();
    }
}

new test_layout($_GET["app_id"]);
?>