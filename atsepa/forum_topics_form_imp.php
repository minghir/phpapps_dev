<?php
require_once ("globals.php");
include ("gen_php/forum_topics_form.php");
	class forum_topics_form_impl  extends forum_topics_form{
		function __construct(){
			parent::__construct();
			$this->template = "forum_topics_form_imp.tpl";
			$this->init();
			$this->USER_ID = $_SESSION["_USER_ID"];
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
	
	$forum_topics_form_Impl = new forum_topics_form_impl();
?>