<?php
require_once ("globals.php");
include ("gen_php/eshop_admin_categories_form22.php");
	class eshop_admin_categories_form22_impl  extends eshop_admin_categories_form22{
		function eshop_admin_categories_form22_impl(){
			$this->template = "eshop_admin_categories_form22_imp.tpl";
			$this->init();
			$this->display();
		}
	};
	
	$eshop_admin_categories_form22_Impl = new eshop_admin_categories_form22_impl();
?>