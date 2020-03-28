<?php
require_once ("globals.php");
include ("gen_php/phpapps_test_app_test2_form.php");
	class phpapps_test_app_test2_form_impl  extends phpapps_test_app_test2_form{
		function __construct(){
			parent::__construct();
			$this->template = "phpapps_test_app_test2_form_imp.tpl";
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
	
	$phpapps_test_app_test2_form_Impl = new phpapps_test_app_test2_form_impl();
?>