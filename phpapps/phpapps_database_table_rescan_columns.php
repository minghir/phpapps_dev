<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class table_details_rec{
    //UNSIGN	COLUMN_SIZE	ACCEPT_NULL	COLUMN_DEFAULT_VALUE	AUTOINCREMENT	DESCRIPTION
    public $ID;
    public $TABLE_ID;
    public $COLUMN_NAME;
    public $COLUMN_TYPE_ID;
    
    function __construct($app_id) {
        
    }
}

class phpapps_database_table_rescan_columns extends phpapps_display_abs{

    private $app_id;
    public $TABLE_ID;
    public $SCHEMA_NAME;
    public $TABLE_NAME;
    
    function __construct($app_id) {
        parent::__construct();
        $this->layout = PHPAPPS_LAYOUTS_DIR . "default.lay";
        $this->tpl = "phpapps_database_table_rescan_columns.tpl";        
        $this->app_id = $app_id;
        
        $this->TABLE_ID = $_GET["gfield_value"];
        echo "AICIL" . $this->TABLE_ID;
        $this->SCHEMA_NAME = (new DB_table("view_tables"))->getValue("TABLE_SCHEMA",$this->TABLE_ID);
        $this->TABLE_NAME = (new DB_table("view_tables"))->getValue("TABLE_NAME",$this->TABLE_ID);
        
        echo "<h1>" . $this->SCHEMA_NAME .".".$this->TABLE_NAME."</h1><br>";
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "phpapps_database_table_rescan_columns: Youre code here."));
        
        $this->displayTpl();
    }
}

new phpapps_database_table_rescan_columns($_GET["app_id"]);
?>