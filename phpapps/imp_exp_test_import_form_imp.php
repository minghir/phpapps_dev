<?php
require_once ("globals.php");
include ("gen_php/imp_exp_test_import_form.php");
	class imp_exp_test_import_form_impl  extends imp_exp_test_import_form{
		function __construct(){
			parent::__construct();
			$this->template = "imp_exp_test_import_form_imp.tpl";
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
	
	$imp_exp_test_import_form_Impl = new imp_exp_test_import_form_impl();
?>