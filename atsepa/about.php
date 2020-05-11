<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class about extends template{

    private $app_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->layout = CURRENT_APP_LAYOUTS_DIR . "atsepa.lay";
        $this->tpl = "about.tpl";        
        $this->app_id = $app_id;
        
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "about: Youre code here."));
        $this->globals->sm->assign("CURRENT_PAGE","about");
        $this->display_template();
    }
}

new about($_GET["app_id"]);
?>