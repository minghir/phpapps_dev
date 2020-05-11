<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");
require_once("admin_contact_form_imp.php");


class contact extends template{

    private $app_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->layout = CURRENT_APP_LAYOUTS_DIR . "atsepa.lay";
        $this->app_id = $app_id;
        $this->globals->sm->assign("CURRENT_PAGE","contact");
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "contact: Youre code here."));
        $admin_contact_form_Impl = new admin_contact_form_impl();
    }
}

new contact($_GET["app_id"]);
?>