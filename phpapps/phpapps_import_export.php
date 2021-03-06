<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class phpapps_import_export extends template{

    private $app_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->layout = PHPAPPS_LAYOUTS_DIR . "default.lay";
        $this->tpl = "phpapps_import_export.tpl";        
        $this->app_id = $app_id;
        
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "phpapps_import_export: Youre code here."));
        
        $this->display_template();
    }
}

new phpapps_import_export($_GET["app_id"]);
?>