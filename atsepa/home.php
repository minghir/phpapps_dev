<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class home extends phpapps_display_abs{

    private $app_id;
    
    function __construct($app_id) {
        parent::__construct();
        
        require_once( 'auth.php');
        $this->ath = new auth($this);
        $this->ath->authenticate();
                
        $this->layout = CURRENT_APP_LAYOUTS_DIR . "atsepa.lay";
        $this->tpl = "home.tpl";        
        $this->app_id = $app_id;
        $this->globals->sm->assign("CURRENT_PAGE","home");
        
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "home: Youre code here."));
        
        $this->displayTpl();
    }
}

new home($_GET["app_id"]);
?>