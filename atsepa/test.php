<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class test extends phpapps_display_abs{

    private $app_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->tpl = "test.tpl";        
        $this->app_id = $app_id;
        $this->displayTpl();
    }
}

new test($_GET["app_id"]);
?>