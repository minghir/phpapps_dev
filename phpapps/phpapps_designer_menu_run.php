<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");
require_once(DB_LIBS_DIR . 'DB_menu.php');

class phpapps_designer_menu_run extends phpapps_display_abs{

    private $app_id;
    private $module_id;
    private $script_id;
    private $menu_id;
    private $tested_menu_obj;
    
    function __construct($app_id) {
        parent::__construct();
        $this->layout = PHPAPPS_LAYOUTS_DIR . "default.tpl";
        $this->tpl = "phpapps_designer_menu_run.tpl";        
        $this->app_id = 1;
        $this->module_id = 21;
        $this->script_id = 238;
        $this->app_id = $app_id;
        $this->menu_id = $_GET["gfield_value"];
        
        $this->tested_menu_obj = new DB_menu($this->menu_id);
        
        
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => $this->tested_menu_obj->get_menu_str()));
        $this->displayTpl();
        
    }
    
}

new phpapps_designer_menu_run($_GET["app_id"]);
?>