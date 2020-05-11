<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class layout_designer extends template{

    private $app_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->layout = PHPAPPS_LAYOUTS_DIR . "layout_designer.tpl";
        $this->tpl = "layout_designer.tpl";        
        $this->app_id = $app_id;
        
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "layout_designer: Youre code here."));
        
        $this->display_template();
    }
}

new layout_designer($_GET["app_id"]);
?>