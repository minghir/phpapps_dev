<?php
require_once ("globals.php");
include ("gen_php/phpapps_admin_tables_edit_form.php");
	class phpapps_admin_tables_edit_form_impl  extends phpapps_admin_tables_edit_form{
		function __construct(){
			$this->template = "phpapps_admin_tables_edit_form_imp.tpl";
			$this->init();
			$this->display();
		}
	};
	
	$phpapps_admin_tables_edit_form_Impl = new phpapps_admin_tables_edit_form_impl();
?>