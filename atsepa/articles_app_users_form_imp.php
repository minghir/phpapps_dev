<?php
require_once ("globals.php");
include ("gen_php/articles_app_users_form.php");
	class articles_app_users_form_impl  extends articles_app_users_form{
		function __construct(){
			parent::__construct();
			$this->template = "articles_app_users_form_imp.tpl";
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
	
	$articles_app_users_form_Impl = new articles_app_users_form_impl();
?>