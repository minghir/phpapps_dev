<?php
require_once ("globals.php");
include ("gen_php/phpapps_users_user_profiles_form.php");
	class phpapps_users_user_profiles_form_impl  extends phpapps_users_user_profiles_form{
		function __construct(){
			$this->template = "phpapps_users_user_profiles_form_imp.tpl";
			$this->init();
			$this->display();
		}
	};
	
	$phpapps_users_user_profiles_form_Impl = new phpapps_users_user_profiles_form_impl();
?>