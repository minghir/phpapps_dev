<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class eshop_template extends phpapps_display_abs{

    private $app_id;
    private $module_id;
    private $script_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->layout = PHPAPPS_LAYOUTS_DIR . "default.tpl";
        $this->tpl = "eshop_template.tpl";        
        $this->app_id = 7;
        $this->module_id = 10;
        $this->script_id = 249;
        $this->app_id = $app_id;
        
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "eshop_template: Youre code here."));
        
        $this->displayTpl();
    }
}

new eshop_template($_GET["app_id"]);
?>