<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_modules_base_grids.php");

class phpapps_languages_module extends phpapps_display_abs{

    private $app_id;
    private $module_id;
    //private $script_id;
        var $ID;
	var $APP_ID;
	var $MODULE_NAME;
	var $MODULE_TITLE;
	var $MODULE_DATE;
	var $MODULE_SCHEMA;
	var $DESCRIPTION;
	var $APP_NAME;
	var $APP_TITLE;
	var $BASE_DIR;
        
        var $script_id = 252;
        
    function __construct($module_id) {
        parent::__construct();
        //$this->layout = PHPAPPS_LAYOUTS_DIR . "default.tpl";
        $this->tpl = PHPAPPS_TPL_DIR . "phpapps_languages_module.tpl";        
        $this->app_id = 1;
        $this->module_id = 8;
        
        $this->app_id = $app_id;
        
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
				WHERE m.APP_ID = a.ID AND m.ID = :module_id ",array(':module_id'=>$this->module_id));
				
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
        
       // $this->globals->sm->assign(array("SCRIPT_CONTENT" => "phpapps_languages_module: Youre code here."));
          
                $base_grds = new phpapps_modules_base_grids($this->ID);
                $base_grds->baseGrids();
                $this->globals->sm->assign("module",$this);
         $this->loadElements();       
        $this->displayTpl();
    }
}

new phpapps_languages_module($_GET["module_id"]);
?>