<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class {$CLASS_NAME} extends phpapps_display_abs{ldelim}

    private $app_id;
    private $module_id;
    private $script_id;
    
    function __construct($app_id) {ldelim}
        parent::__construct();
        //$this->layout = PHPAPPS_LAYOUTS_DIR . "default.tpl";
        $this->tpl = "{$CLASS_NAME}.tpl";        
        $this->app_id = {$APP_ID};
        $this->module_id = {$MODULE_ID};
        $this->script_id = {$SCRIPT_ID};
        $this->app_id = $app_id;
        $this->display_objects_type_id = '2';
    	$this->display_objects_type = 'SCRIPT';
    	$this->display_objects_id = $this->script_id;
        
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "{$CLASS_NAME}: Youre code here."));
        
        $this->displayTpl();
    {rdelim}
{rdelim}

new {$CLASS_NAME}($_GET["app_id"]);
?>