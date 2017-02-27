<?php
require_once ("globals.php");
include ("gen_php/php_quiz_questions_questions_form.php");
	class php_quiz_questions_questions_form_impl  extends php_quiz_questions_questions_form{
		function __construct(){
			parent::__construct();
			$this->template = "php_quiz_questions_questions_form_imp.tpl";
                        $this->CATEG_ID = trim($_GET["CATEG_ID"]);
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
                    if( count($this->errors) == 0){
			header("Location:win_close.html");
                    }
		}
		
		function beforeSaveRec(){
		}
		
		function afterSaveRec(){
                    if( count($this->errors) == 0){
			header("Location:win_close.html");
                    }
		}

		function beforeDeleteRec(){
		}
		
		function afterDeleteRec(){
                    if( count($this->errors) == 0){
			header("Location:win_close.html");
                    }
		}
		
		function beforeDisplay(){	
		}
		
		function afterDisplay(){	
		}
		
	};
	
	$php_quiz_questions_questions_form_Impl = new php_quiz_questions_questions_form_impl();
?>