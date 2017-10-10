<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class sign_up extends phpapps_display_abs{

    private $app_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->layout = CURRENT_APP_LAYOUTS_DIR . "atsepa.lay";
        $this->tpl = "sign_up.tpl";        
        $this->app_id = $app_id;
         $this->globals->sm->assign("CURRENT_PAGE","sign_up");
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "sign_up: Youre code here."));
        
        $this->displayTpl();
    }
}

new sign_up($_GET["app_id"]);
?>