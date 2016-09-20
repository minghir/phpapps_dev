<?php
require_once ("globals.php");
include ("gen_php/phpapps_admin_views_form.php");
	class phpapps_admin_views_form_impl  extends phpapps_admin_views_form{
		function phpapps_admin_views_form_impl(){
			$this->template = "phpapps_admin_views_form_imp.tpl";
			$this->init();
			$this->display();
		}
	};
	
	$phpapps_admin_views_form_Impl = new phpapps_admin_views_form_impl();
?>