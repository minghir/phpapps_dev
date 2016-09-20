<?php
require_once ("globals.php");
include ("gen_php/phpapps_admin_users_form.php");
	class phpapps_admin_users_form_impl  extends phpapps_admin_users_form{
		function phpapps_admin_users_form_impl(){
			$this->template = "phpapps_admin_users_form_imp.tpl";
			$this->init();
//			$this->globals->sm->assign("FROM_IMP_CLASS","<tr><td>implement din cacao class </td><td> aaaaaaaaaaa</td></tr>");
			$this->display();
		}
	};
	
	$phpapps_admin_users_form_Impl = new phpapps_admin_users_form_impl();
?>