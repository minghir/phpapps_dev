<?php
require_once ("globals.php");
include ("gen_php/phpapps_lang_aa_test_form.php");
	class phpapps_lang_aa_test_form_impl  extends phpapps_lang_aa_test_form{
		//function phpapps_lang_aa_test_form_impl(){
		function __construct(){
			$this->template = "phpapps_lang_aa_test_form_imp.tpl";
			$this->init();
			$this->display();
		}
	};
	
	$phpapps_lang_aa_test_form_Impl = new phpapps_lang_aa_test_form_impl();
?>