<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class phpapps_database_browse_tables extends phpapps_display_abs{

    private $app_id;
    private $get_table_id;
    private $get_module_id;
    
    function __construct($app_id) {
        parent::__construct();
        
        $this->setLayoutFile("phpapps_popup.lay");
        
        $this->tpl = "phpapps_database_browse_tables.tpl";        
        $this->app_id = $app_id;
        
        $this->get_table_id = $_GET["gfield_value"];
        $this->get_module_id = $_GET["module_id"];
        
        $sql = new DB_query("SELECT 
				ID, 
				APP_NAME,
				TABLE_NAME,
				TABLE_SCHEMA 
		FROM phpapps.view_tables
		WHERE 	ID = :id AND 
		MODULE_ID = :module_id AND
                ORIGIN_ID = '0'",
	array(":id"=>$this->get_table_id,":module_id"=>$this->get_module_id));
        
        $this->globals->con->query($sql);	
        $this->globals->con->next();
        //echo $this->globals->con->get_field("TABLE_SCHEMA") . "." . $this->globals->con->get_field("TABLE_NAME");
        //$phpapps_admin_tables_form_grid =  new DB_grid($this->globals->con, "table",$this->globals->con->get_field("TABLE_SCHEMA") . "." . $this->globals->con->get_field("TABLE_NAME"),"phpapps_".$this->globals->con->get_field("TABLE_NAME")."_grid");
        $grid_name =  "phpapps_".$this->globals->con->get_field("TABLE_NAME")."_grid_browse";
        
        $phpapps_admin_tables_form_grid =  new DB_grid($this->globals->con, "table", $this->globals->con->get_field("TABLE_SCHEMA") . "." . $this->globals->con->get_field("TABLE_NAME"), $grid_name);
      //$phpapps_admin_tables_form_grid =  new DB_grid($this->globals->con, "table","phpapps.table_details","aaaa");
        $phpapps_admin_tables_form_grid->paginable = true;
        //$phpapps_admin_tables_form_grid->filterable = FALSE;
        $phpapps_admin_tables_form_grid->rows_on_pg = 20;
        
        $sql = new DB_query("SELECT FORM_PHP_DIR, FORM_NAME , APP_NAME
					FROM phpapps.view_forms f
					WHERE f.TABLE_NAME = :table_name 
					AND f.MODULE_ID = :module_id ORDER BY f.ID ASC",
					array(":table_name" => $this->globals->con->get_field("TABLE_NAME"),":module_id"=>$this->get_module_id));

        $this->globals->con->query($sql);	
        $this->globals->con->next();
        
        if(file_exists(GLOBALS_DIR . $this->globals->con->get_field("APP_NAME") .DIR_SEP. $this->globals->con->get_field("FORM_NAME") . "_imp.php")){// && 
            $phpapps_admin_tables_form_grid->edit_form = WEB_BASE_DIR . $this->globals->con->get_field("APP_NAME") ."/".$this->globals->con->get_field("FORM_NAME") . "_imp.php";
        }else{
            $phpapps_admin_tables_form_grid->editable = false;	
        }
        //echo $phpapps_admin_tables_form_grid->get_grid_str();
        
        $this->globals->sm->assign("SCRIPT_CONTENT",$phpapps_admin_tables_form_grid->get_grid_str());
        $this->globals->sm->display($this->tpl);
        
    }
}

new phpapps_database_browse_tables($_GET["app_id"]);
?>