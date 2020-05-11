<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class sql_console2 extends template{

    private $app_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->layout = PHPAPPS_LAYOUTS_DIR . "default.lay";
        $this->tpl = "sql_console2.tpl";        
        $this->app_id = $app_id;
        
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "sql_console2: Youre code here."));
        
        $this->display_template();
    }
}

new sql_console2($_GET["app_id"]);
?>