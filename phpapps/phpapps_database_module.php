<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class phpapps_database_module extends phpapps_display_abs{

    var $app_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->tpl = "phpapps_database_module.tpl";        
        $this->app_id = $app_id;
        $this->displayTpl();
    }
}

new phpapps_database_module($_GET["app_id"]);
?>