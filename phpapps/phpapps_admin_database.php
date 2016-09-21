<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class phpapps_admin_database extends phpapps_display_abs{
    
    var $app_id;
    
    function __construct($app_id) {
        parent::__construct();
                
        $this->app_id = $app_id;
    }
}

$aa  = new phpapps_admin_database($_GET["app_id"]);
$aa->displayTpl();
?>