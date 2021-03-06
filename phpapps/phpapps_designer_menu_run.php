<?php
namespace wabdo;
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");
require_once(DB_LIBS_DIR . 'DB_menu.php');

class phpapps_designer_menu_run extends template{

    private $app_id;
    private $module_id;
    public $script_id = 238;
    private $menu_id;
    private $tested_menu_obj;
    protected $display_objects_type_id = '2'; //?????
    protected $display_objects_type = 'SCRIPT';
    protected $display_objects_id = 238; 
    
    function __construct($app_id) {
        parent::__construct();
        //$this->layout = PHPAPPS_LAYOUTS_DIR . "default.tpl";
        $this->tpl = "phpapps_designer_menu_run.tpl";        
        $this->app_id = 1;
        $this->module_id = 21;
        $this->script_id = 238;
        $this->app_id = $app_id;
        $this->menu_id = $_GET["gfield_value"];
        
        $this->tested_menu_obj = new DB_menu($this->menu_id);
        
        $this->load_elements();
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => $this->tested_menu_obj->get_menu_str()));
        $this->display_template();
        
    }
    
}

new phpapps_designer_menu_run($_GET["app_id"]);
?>