<?php
require_once ("globals.php");
include ("gen_php/emanag_lol_lol_vars_form.php");
	class emanag_lol_lol_vars_form_impl  extends emanag_lol_lol_vars_form{
		function __construct(){
			parent::__construct();
			$this->template = "emanag_lol_lol_vars_form_imp.tpl";
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
			echo "salvare BRAVO adaugat";
			//header("Location:win_close.html");
		}
		
		function beforeSaveRec(){
		}
		
		function afterSaveRec(){
			echo "salvare BRAVO modificat";
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
	
	$emanag_lol_lol_vars_form_Impl = new emanag_lol_lol_vars_form_impl();
?>