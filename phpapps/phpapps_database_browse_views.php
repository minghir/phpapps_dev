<?php
namespace wabdo;
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class phpapps_database_browse_views extends template{

    private $app_id;
    private $get_table_id;
    private $get_module_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->tpl = "phpapps_database_browse_tables.tpl";        
        $this->app_id = $app_id;
        
        $this->get_table_id = $_GET["gfield_value"];
        $this->get_module_id = $_GET["module_id"];
        
        /*
        $sql = new DB_query("SELECT 
				ID, 
				MODULE_ID,
				VIEW_NAME,
				CREATE_VIEW_QUERY,
                                DESCRIPTION
		FROM {$this->globals->PHPAPPS_DB}.views
		WHERE 	ID = :id AND 
		MODULE_ID = :module_id ",
	array(":id"=>$this->get_table_id,":module_id"=>$this->get_module_id));
         * 
         */
        $sql = new DB_query("SELECT 
				ID, 
				MODULE_ID,
				VIEW_NAME,
				CREATE_VIEW_QUERY,
                                DESCRIPTION
		FROM {$this->globals->PHPAPPS_DB}.views
		WHERE 	ID = :id ",
	array(":id"=>$this->get_table_id));
        
        //print_r($sql);
        echo $sql->prnt();
        $this->globals->con->query($sql);	
        $this->globals->con->next();
        //echo $this->globals->con->get_field("TABLE_SCHEMA") . "." . $this->globals->con->get_field("TABLE_NAME");
        //$phpapps_admin_tables_form_grid =  new DB_grid($this->globals->con, "table",$this->globals->con->get_field("TABLE_SCHEMA") . "." . $this->globals->con->get_field("TABLE_NAME"),"phpapps_".$this->globals->con->get_field("TABLE_NAME")."_grid");
        $grid_name =  "phpapps_".$this->globals->con->get_field("VIEW_NAME")."_grid";
        echo "<br>" . $grid_name ;
        $phpapps_admin_queries_grid =  new DB_grid($this->globals->con, "table", $this->globals->con->get_field("VIEW_NAME"), $grid_name);
      //$phpapps_admin_tables_form_grid =  new DB_grid($this->globals->con, "table","{$this->globals->PHPAPPS_DB}.table_details","aaaa");
        $phpapps_admin_queries_grid->paginable = true;
        $phpapps_admin_queries_grid->sortable = true;
        $phpapps_admin_queries_grid->editable = false;
        $phpapps_admin_queries_grid->filterable = true;
        $phpapps_admin_queries_grid->rows_on_pg = 20;
        $phpapps_admin_queries_grid->grid_title = $this->globals->con->get_field("VIEW_NAME");
        
        $this->globals->sm->assign("SCRIPT_CONTENT",$phpapps_admin_queries_grid->get_grid_str());
        $this->globals->sm->display($this->tpl);
    }
}

new phpapps_database_browse_views($_GET["app_id"]);
?>