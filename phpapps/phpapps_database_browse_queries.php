<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class phpapps_database_browse_queries extends phpapps_display_abs{

    private $app_id;
    private $get_table_id;
    private $get_module_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->tpl = "phpapps_database_browse_tables.tpl";        
        $this->app_id = $app_id;
        
        $this->get_table_id = $_GET["gfield_value"];
        $this->get_module_id = $_GET["module_id"];
        
        $sql = new DB_query("SELECT 
				ID, 
				MODULE_ID,
				QUERY_NAME,
				QUERY_BODY,
                                DESCRIPTION
		FROM phpapps.queries
		WHERE 	ID = :id AND 
		MODULE_ID = :module_id ",
	array(":id"=>$this->get_table_id,":module_id"=>$this->get_module_id));
        
        print_r($sql);
        $this->globals->con->query($sql);	
        $this->globals->con->next();
        //echo $this->globals->con->get_field("TABLE_SCHEMA") . "." . $this->globals->con->get_field("TABLE_NAME");
        //$phpapps_admin_tables_form_grid =  new DB_grid($this->globals->con, "table",$this->globals->con->get_field("TABLE_SCHEMA") . "." . $this->globals->con->get_field("TABLE_NAME"),"phpapps_".$this->globals->con->get_field("TABLE_NAME")."_grid");
        $grid_name =  "phpapps_".$this->globals->con->get_field("QUERY_NAME")."_grid";
        
        $phpapps_admin_queries_grid =  new DB_grid($this->globals->con, "query", $this->globals->con->get_field("QUERY_BODY"), $grid_name);
      //$phpapps_admin_tables_form_grid =  new DB_grid($this->globals->con, "table","phpapps.table_details","aaaa");
        $phpapps_admin_queries_grid->paginable = false;
        $phpapps_admin_queries_grid->sortable = false;
        $phpapps_admin_queries_grid->editable = false;
        $phpapps_admin_queries_grid->filterable = FALSE;
        $phpapps_admin_queries_grid->rows_on_pg = 20;
        
        $this->globals->sm->assign("SCRIPT_CONTENT",$phpapps_admin_queries_grid->get_grid_str());
        $this->globals->sm->display($this->tpl);
    }
}

new phpapps_database_browse_queries($_GET["app_id"]);
?>