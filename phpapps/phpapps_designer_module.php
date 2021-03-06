<?php
namespace wabdo;
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");
require_once (PHPAPPS_LIBS_DIR . "DB_grid_imp.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_modules_base_grids.php");

class phpapps_designer_module extends template{


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
        
        protected $display_objects_id = 174;
        protected $display_objects_type_id = '2';
    	protected $display_objects_type = 'SCRIPT';
        
    
    function __construct($module_id) {
        parent::__construct($module_id);
        //$this->layout = PHPAPPS_LAYOUTS_DIR . "default.tpl";
        $this->tpl = "phpapps_designer_module.tpl";        
        $this->app_id = $app_id;
       //$this->script_id = 174;
       
        
        
        //$this->setup_display();
        
        $this->MODULE_ID = $module_id;
        
        $this->globals->con->select_db($this->globals->PHPAPPS_DB);
		
		$sql = new DB_query("SELECT 	m.ID,
						m.APP_ID,
						m.MODULE_NAME,
						m.MODULE_TITLE,
						m.MODULE_DATE,
						m.MODULE_SCHEMA,
						m.DESCRIPTION,
						m.APP_NAME,
						a.APP_TITLE
				FROM {$this->globals->PHPAPPS_DB}.view_modules m, {$this->globals->PHPAPPS_DB}.applications a
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
        
        $this->load_elements();
        $this->setup_display();
        $this->display_template();
    }
	
	function setup_display(){
		$layouts_grid = new DB_grid($this->globals->con, "table","{$this->globals->PHPAPPS_DB}.view_layouts","phpapps_layouts_grid");
		$layouts_grid->grid_title = "LAYOUTS";
		$layouts_grid->cols = (array("NAME","APP_NAME","DESCRIPTION"));
		$layouts_grid->labels = (array("LAYOUT NAME","APP NAME","DESCRIPTION"));
		$layouts_grid->paginable = true;
		$layouts_grid->filterable = false;
		$layouts_grid->exportable = false;
		$layouts_grid->rows_on_pg = 20;
		$layouts_grid->edit_form = "phpapps_designer_layouts_form.php?module_id=".$this->ID;
		
                $as2 = new HrefActions();
		$as2->act_script = "run_code_editor.php?module_id=".$this->ID;
		$as2->label = "edit layout tpl";
		$as2->action = "editLayoutTpl";
		$as2->fields = array("ID");
		$layouts_grid->add_row_acction($as2);

                $this->globals->sm->assign("layouts_grid",$layouts_grid->get_grid_str());

                
                $themes_grid = new DB_grid($this->globals->con, "table","{$this->globals->PHPAPPS_DB}.view_themes","phpapps_themes_grid");
		$themes_grid->grid_title = "THEMES";
		$themes_grid->cols = (array("THEME_NAME","APP_NAME"));
		$themes_grid->labels = (array("THEME NAME","APP_NAME"));
		$themes_grid->paginable = true;
		$themes_grid->filterable = false;
		$themes_grid->exportable = false;
		$themes_grid->rows_on_pg = 20;
		//$themes_grid->edit_form = "phpapps_designer_themes_form_imp.php?module_id=".$this->ID;
                $themes_grid->edit_form = "phpapps_designer_themes_form.php";
                
                $thg = new HrefActions();
		$thg->act_script = "run_code_editor.php?module_id=".$this->ID;
		$thg->label = "edit css";
		$thg->action = "editTheme";
		$thg->fields = array("ID");
		$themes_grid->add_row_acction($thg);
                
                
                $this->globals->sm->assign("themes_grid",$themes_grid->get_grid_str());

                
                $menus_grid = new DB_grid($this->globals->con, "table","{$this->globals->PHPAPPS_DB}.view_menus","phpapps_menus_grid");
		$menus_grid->grid_title = "MENUS";
		$menus_grid->cols = (array("NAME","MENU_TYPE","ORIENTATION","QUERY_NAME"));
		$menus_grid->labels = (array("MENU NAME","TYPE","ORIENTATION","QUERY"));
		$menus_grid->paginable = true;
		$menus_grid->filterable = false;
		$menus_grid->exportable = false;
		$menus_grid->rows_on_pg = 20;
		$menus_grid->edit_form = "phpapps_designer_menus_form_imp.php?module_id=".$this->ID;

                $as3 = new HrefActions();
		$as3->act_script = "phpapps_designer_menu_run.php?module_id=".$this->ID;
		$as3->label = "test menu";
		$as3->action = "test";
		$as3->fields = array("ID");
		$menus_grid->add_row_acction($as3);
                
                $this->globals->sm->assign("menus_grid",$menus_grid->get_grid_str());

                $base_grds = new phpapps_modules_base_grids($this->ID);
                $base_grds->baseGrids();
                
                
                $this->globals->sm->assign("module",$this);
	}
        
        
}

new phpapps_designer_module($_GET["module_id"]);
?>