<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class sql_console2 extends phpapps_display_abs{

    private $app_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->layout = PHPAPPS_LAYOUTS_DIR . "default.lay";
        $this->tpl = "sql_console2.tpl";        
        $this->app_id = $app_id;
        
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "sql_console2: Youre code here."));
        
        $this->displayTpl();
    }
}

new sql_console2($_GET["app_id"]);
?>