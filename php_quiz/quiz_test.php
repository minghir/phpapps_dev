<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class quiz_test extends phpapps_display_abs{

    private $app_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->tpl = "quiz_test.tpl";        
        $this->app_id = $app_id;
        $this->displayTpl();
    }
}

new quiz_test($_GET["app_id"]);
?>