<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class phpapps_database_table_rescan_indexes extends phpapps_display_abs{

    private $app_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->layout = PHPAPPS_LAYOUTS_DIR . "default.lay";
        $this->tpl = "phpapps_database_table_rescan_indexes.tpl";        
        $this->app_id = $app_id;
        
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "phpapps_database_table_rescan_indexes: Youre code here."));
        
        $this->displayTpl();
    }
}

new phpapps_database_table_rescan_indexes($_GET["app_id"]);
?>