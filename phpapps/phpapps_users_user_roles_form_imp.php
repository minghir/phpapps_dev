<?php
require_once ("globals.php");
include ("gen_php/phpapps_users_user_roles_form.php");
	class phpapps_users_user_roles_form_impl  extends phpapps_users_user_roles_form{
		function phpapps_users_user_roles_form_impl(){
			$this->template = "phpapps_users_user_roles_form_imp.tpl";
			
			$this->init();
			$this->UID = $_GET["user_id"];
			$this->display();
		}
	};
	
	$phpapps_users_user_roles_form_Impl = new phpapps_users_user_roles_form_impl();
?>