<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class phpapps_test4_get_php extends phpapps_display_abs{

    private $app_id;
    private $module_id;
    private $script_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->layout = PHPAPPS_LAYOUTS_DIR . "default.lay";
        $this->tpl = "phpapps_test4_get_php.tpl";        
        $this->app_id = ;
        $this->module_id = 27;
        $this->script_id = ;
        $this->app_id = $app_id;
        
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "phpapps_test4_get_php: Youre code here."));
        
        $this->displayTpl();
    }
}

new phpapps_test4_get_php($_GET["app_id"]);
?>