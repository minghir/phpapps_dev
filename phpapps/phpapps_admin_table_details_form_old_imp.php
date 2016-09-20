<?php
require_once ("globals.php");
include ("gen_php/phpapps_admin_table_details_form.php");
	class phpapps_admin_table_details_form_impl  extends phpapps_admin_table_details_form{
		function __construct(){
			$this->template = "phpapps_admin_table_details_form_imp.tpl";
			$this->init();
			$this->display();
		}
	};
	
	$phpapps_admin_table_details_form_Impl = new phpapps_admin_table_details_form_impl();
?>