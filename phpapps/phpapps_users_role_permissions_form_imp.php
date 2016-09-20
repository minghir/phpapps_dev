<?php
require_once ("globals.php");
include ("gen_php/phpapps_users_role_permissions_form.php");
	class phpapps_users_role_permissions_form_impl  extends phpapps_users_role_permissions_form{
		function phpapps_users_role_permissions_form_impl(){
			$this->template = "phpapps_users_role_permissions_form_imp.tpl";
			$this->init();
			$this->display();
		}
	};
	
	$phpapps_users_role_permissions_form_Impl = new phpapps_users_role_permissions_form_impl();
?>