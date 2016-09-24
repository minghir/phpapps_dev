<?php
require_once ("globals.php");
include ("gen_php/eshop_admin_products_form.php");
	class eshop_admin_products_form_impl  extends eshop_admin_products_form{
		function eshop_admin_products_form_impl(){
			$this->template = "eshop_admin_products_form_imp.tpl";
			$this->init();
			$this->display();
		}
	};
	
	$eshop_admin_products_form_Impl = new eshop_admin_products_form_impl();
?>