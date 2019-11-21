<?php
require_once ("globals.php");
include ("gen_php/test_app_aaa_form.php");
	class test_app_aaa_form_impl  extends test_app_aaa_form{
		function __construct(){
			parent::__construct();
			$this->template = "test_app_aaa_form_imp.tpl";
			$this->init();
			$this->display();
		}
		
		function beforeGetRec(){
		}
		
		function afterGetRec(){
		}
	
		function beforeAddRec(){
		}
		
		function afterAddRec(){
			//header("Location:win_close.html");
		}
		
		function beforeSaveRec(){
		}
		
		function afterSaveRec(){
			//header("Location:win_close.html");
		}

		function beforeDeleteRec(){
		}
		
		function afterDeleteRec(){
		//	header("Location:win_close.html");
		}
		
		function beforeDisplay(){	
		}
		
		function afterDisplay(){	
		}
		
	};
	
	$test_app_aaa_form_Impl = new test_app_aaa_form_impl();
?>