<?php
namespace wabdo;
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");
require_once (PHPAPPS_LIBS_DIR . "DB_grid_imp.php");

class phpapps_designer_grid_run extends template{

    private $app_id;
    private $module_id;
    public $script_id = 258;
    private $grid_id;
    
    function __construct($app_id) {
        parent::__construct();
        //$this->layout = PHPAPPS_LAYOUTS_DIR . "default.tpl";
        $this->tpl = "phpapps_designer_grid_run.tpl";        
        $this->app_id = 1;
        $this->module_id = 21;
        $this->script_id = 258;
        $this->app_id = $app_id;
        $this->grid_id = $_GET["gfield_value"];
        
	
        
        $this->load_elements();
		$this->tested_grid_obj = new DB_grid_imp($this->grid_id);
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => $this->tested_grid_obj->get_grid_str()));
        $this->display_template();
    }
}

new phpapps_designer_grid_run($_GET["app_id"]);
?>