<?php
require_once ("globals.php");
include ("gen_php/eshop_admin_categories_form.php");
	class eshop_admin_categories_form_impl  extends eshop_admin_categories_form{
		function eshop_admin_categories_form_impl(){
			$this->template = "eshop_admin_categories_form_imp.tpl";
			$this->init();
			$this->display();
		}
	};
	
	$eshop_admin_categories_form_Impl = new eshop_admin_categories_form_impl();
?>