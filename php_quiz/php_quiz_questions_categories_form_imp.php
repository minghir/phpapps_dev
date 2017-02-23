<?php
require_once ("globals.php");
include ("gen_php/php_quiz_questions_categories_form.php");
	class php_quiz_questions_categories_form_impl  extends php_quiz_questions_categories_form{
		function __construct(){
			parent::__construct();
			$this->template = "php_quiz_questions_categories_form_imp.tpl";
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
	
	$php_quiz_questions_categories_form_Impl = new php_quiz_questions_categories_form_impl();
?>