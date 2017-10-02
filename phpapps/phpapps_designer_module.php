<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class phpapps_designer_module extends phpapps_display_abs{

    private $app_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->layout = PHPAPPS_LAYOUTS_DIR . "default.lay";
        $this->tpl = "phpapps_designer_module.tpl";        
        $this->app_id = $app_id;
        $this->setupDisplay();
        $this->displayTpl();
    }
	
	function setupDisplay(){
		$layouts_grid = new DB_grid($this->globals->con, "table","phpapps.layouts","phpapps_layouts_grid");
		$layouts_grid->grid_title = "LAYOUTS";

		$layouts_grid->cols = (array("NAME","DESCRIPTION"));
		$layouts_grid->labels = (array("LAYOUT NAME","DESCRIPTION"));
		
		$layouts_grid->paginable = true;
		$layouts_grid->filterable = false;
		$layouts_grid->exportable = false;
		//$tables_grid->editable = false;
		$layouts_grid->rows_on_pg = 20;
		$layouts_grid->edit_form = "phpapps_designer_layouts_form_imp.php?module_id=".$this->ID;
		$this->globals->sm->assign("layouts_grid",$layouts_grid->get_grid_str());
	}
}

new phpapps_designer_module($_GET["app_id"]);
?>