<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class php_quiz extends template{

    private $app_id;
    private $module_id;
    private $script_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->layout = PHPAPPS_LAYOUTS_DIR . "default.tpl";
        $this->tpl = "php_quiz.tpl";        
        $this->app_id = 7;
        $this->module_id = 10;
        $this->script_id = 250;
        $this->app_id = $app_id;
        
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "php_quiz: Youre code here."));
        
        $this->display_template();
    }
}

new php_quiz($_GET["app_id"]);
?>