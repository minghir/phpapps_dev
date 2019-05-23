<?php
require_once ("globals.php");
include ("gen_php/phpapps_users_users_form.php");
	class phpapps_users_users_form_impl  extends phpapps_users_users_form{
		public function __construct(){
                    global $GLOBALS_OBJ;
                    $this->layout = PHPAPPS_LAYOUTS_DIR . "default.lay";   
                    $this->globals = $GLOBALS_OBJ;
                    $this->globals->con->select_db("phpapps");
                            $this->template = "phpapps_users_users_form_imp.tpl";
                            $this->init();
                            $this->display();
		}
	};
	
	$phpapps_users_users_form_Impl = new phpapps_users_users_form_impl();
        //$phpapps_users_users_form_Impl->displayTpl();
?>