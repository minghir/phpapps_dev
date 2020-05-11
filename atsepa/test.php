<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class test extends template{

    private $app_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->tpl = "test.tpl";        
        $this->app_id = $app_id;
        $this->display_template();
    }
}

new test($_GET["app_id"]);
?>