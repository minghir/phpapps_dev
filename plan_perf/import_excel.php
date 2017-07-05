<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class import_excel extends phpapps_display_abs{

    private $app_id;
    private $TABLES_sel;
    private $module_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->tpl = "import_excel.tpl";        
        $this->app_id = $app_id;
        
        $this->parse_get_values();
        
        $this->TABLES_sel = new DB_select("TABLES_SEL","phpapps.view_tables");
        $this->TABLES_sel->query = "SELECT ID AS VALUE, "
                . "                     CONCAT(TABLE_SCHEMA,'.',TABLE_NAME) AS LABEL "
                . "                     FROM phpapps.view_tables "
                . "                       WHERE APP_NAME = :app_name  "
                . "                     ORDER BY :order_rle";
        $this->TABLES_sel->query_params[":app_name"] = "plan_perf";
        $this->TABLES_sel->query_params[":order_rle"] = "TABLE_NAME";
        
        //$this->TABLES_sel->empty_option = true;
        $this->TABLES_sel->setup_select_options();
        
        $this->globals->sm->assign(array(
            "TABLE_sel" => $this->TABLES_sel->get_select_str() ));
        
        $this->displayTpl();
    }
    
    function parse_get_values(){
        $this->module_id = trim($_GET["module_id"]);
    }
}

new import_excel($_GET["app_id"]);
?>