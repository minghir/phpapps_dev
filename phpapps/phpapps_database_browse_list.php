<?php
namespace wabdo;
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class phpapps_database_browse_list extends template{

    var $app_id;
     protected $display_objects_id = 166;
        protected $display_objects_type_id = '2';
    	protected $display_objects_type = 'SCRIPT';
    
    function __construct($app_id) {
        
        parent::__construct();
        
        $this->tpl = "phpapps_database_browse_list.tpl";        
        $this->app_id = $app_id;
        
        $sql = new DB_query("SELECT 
			t.ID, 
			CONCAT(d.VALUE,'.',t.TABLE_NAME) AS TABLE_NAME,
			t.TABLE_NAME AS SHORT_TABLE_NAME	
		FROM {$this->globals->PHPAPPS_DB}.tables t, {$this->globals->PHPAPPS_DB}.view_modules m, {$this->globals->PHPAPPS_DB}.list_databases d 
		WHERE t.ID = :ID 
                AND 
		
		t.MODULE_ID = m.ID AND m.MODULE_SCHEMA = d.ID",
		array(":ID" => $_GET["gfield_value"],
				));
//echo $sql->prnt();
        $this->globals->con->query($sql);	
        $this->globals->con->next();
        $phpapps_admin_browse_lists =  new DB_grid($this->globals->con, "table",$this->globals->con->get_field("TABLE_NAME"),"phpapps_list_grid");
        $phpapps_admin_browse_lists->cols = (array("ID","VALUE","DESCRIPTION"));
        $phpapps_admin_browse_lists->paginable = true;
        $phpapps_admin_browse_lists->filterable = false;
        $phpapps_admin_browse_lists->rows_on_pg = 20;
        $phpapps_admin_browse_lists->edit_form = "phpapps_database_list_form_imp.php?list_name=".$this->globals->con->get_field("SHORT_TABLE_NAME");
        $this->globals->sm->assign("SCRIPT_CONTENT",$phpapps_admin_browse_lists->get_grid_str());

       
        $this->globals->sm->display($this->tpl);
        
      // echo  $phpapps_admin_browse_lists->prnt();
    }
}

new phpapps_database_browse_list($_GET["app_id"]);
?>

