<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class user_profile extends template{

    private $app_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->layout = PHPAPPS_LAYOUTS_DIR . "default.lay";
        $this->tpl = "user_profile.tpl";        
        $this->app_id = $app_id;
        
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "user_profile: Youre code here."));
        
        $this->display_template();
    }
}

new user_profile($_GET["app_id"]);
?>