<?php
require_once ("globals.php");
include ("gen_php/phpapps_admin_test2s_form.php");
	class phpapps_admin_test2s_form_impl  extends phpapps_admin_test2s_form{
		function __construct(){
			parent::__construct();
			$this->template = "phpapps_admin_test2s_form_imp.tpl";
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
	
	$phpapps_admin_test2s_form_Impl = new phpapps_admin_test2s_form_impl();
?>