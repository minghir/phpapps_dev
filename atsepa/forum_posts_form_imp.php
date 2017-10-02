<?php
require_once ("globals.php");
include ("gen_php/forum_posts_form.php");
	class forum_posts_form_impl  extends forum_posts_form{
		function __construct(){
			parent::__construct();
			$this->template = "forum_posts_form_imp.tpl";
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
	
	$forum_posts_form_Impl = new forum_posts_form_impl();
?>