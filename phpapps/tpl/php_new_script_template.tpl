<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class {$CLASS_NAME} extends phpapps_display_abs{ldelim}

    var $app_id;
    
    function __construct($app_id) {ldelim}
        parent::__construct();
        $this->tpl = "{$CLASS_NAME}.tpl";        
        $this->app_id = $app_id;
        $this->displayTpl();
    {rdelim}
{rdelim}

new {$CLASS_NAME}($_GET["app_id"]);
?>