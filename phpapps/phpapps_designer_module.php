<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class phpapps_designer_module extends phpapps_display_abs{

        private $app_id;
        var $ID;
        var $APP_ID;
        var $MODULE_NAME;
	var $MODULE_TITLE;
	var $MODULE_DATE;
	var $MODULE_SCHEMA;
	var $DESCRIPTION;
	var $APP_NAME;
	var $APP_TITLE;
        var $MODULE_ID;
    
    function __construct($module_id) {
        parent::__construct();
        $this->layout = PHPAPPS_LAYOUTS_DIR . "default.tpl";
        $this->tpl = "phpapps_designer_module.tpl";        
        $this->app_id = $app_id;
        $this->setupDisplay();
        
        $this->MODULE_ID = $module_id;
        
        $this->globals->con->select_db("phpapps");
		
		$sql = new DB_query("SELECT 	m.ID,
						m.APP_ID,
						m.MODULE_NAME,
						m.MODULE_TITLE,
						m.MODULE_DATE,
						m.MODULE_SCHEMA,
						m.DESCRIPTION,
						m.APP_NAME,
						a.APP_TITLE
				FROM phpapps.view_modules m, phpapps.applications a
				WHERE m.APP_ID = a.ID AND m.ID = :module_id ",array(':module_id'=>$module_id));
				
		$this->globals->con->query($sql);	
		$this->globals->con->next();
		$this->ID = $this->globals->con->get_field("ID");
		$this->APP_ID = $this->globals->con->get_field("APP_ID");
		$this->MODULE_NAME = $this->globals->con->get_field("MODULE_NAME");
		$this->MODULE_TITLE = $this->globals->con->get_field("MODULE_TITLE");
		$this->MODULE_DATE = $this->globals->con->get_field("MODULE_DATE");
		$this->MODULE_SCHEMA = $this->globals->con->get_field("MODULE_SCHEMA");
		$this->DESCRIPTION = $this->globals->con->get_field("DESCRIPTION");
		$this->APP_NAME = $this->globals->con->get_field("APP_NAME");
		//$this->BASE_DIR = $this->globals->con->get_field("BASE_DIR");
		$this->APP_TITLE = $this->globals->con->get_field("APP_TITLE");
        
        
        $this->displayTpl();
    }
	
	function setupDisplay(){
		$layouts_grid = new DB_grid($this->globals->con, "table","phpapps.view_layouts","phpapps_layouts_grid");
		$layouts_grid->grid_title = "LAYOUTS";

		$layouts_grid->cols = (array("NAME","APP_NAME","DESCRIPTION"));
		$layouts_grid->labels = (array("LAYOUT NAME","APP NAME","DESCRIPTION"));
		
		$layouts_grid->paginable = true;
		$layouts_grid->filterable = false;
		$layouts_grid->exportable = false;
		//$tables_grid->editable = false;
		$layouts_grid->rows_on_pg = 20;
		$layouts_grid->edit_form = "phpapps_designer_layouts_form_imp.php?module_id=".$this->ID;
		$this->globals->sm->assign("layouts_grid",$layouts_grid->get_grid_str());
                
                $this->globals->sm->assign("module",$this);
	}
}

new phpapps_designer_module($_GET["module_id"]);
?>