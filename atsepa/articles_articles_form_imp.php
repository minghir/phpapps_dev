<?php
require_once ("globals.php");
include ("gen_php/articles_articles_form.php");
	class articles_articles_form_impl  extends articles_articles_form{
		function __construct(){
			parent::__construct();
			$this->template = "articles_articles_form_imp.tpl";
			$this->init();
			$this->display();
		}
		
		function beforeGetRec(){
		}
		
		function afterGetRec(){
		}
	
		function beforeAddRec(){
			$this->USER_ID = $_SESSION["_USER_ID"];
                        $this->ARTICLE_DATE = date("Y-m-d");
                        //echo "AAAA" . $this->USER_ID;
		}
		
		function afterAddRec(){
			//header("Location:win_close.html");
		}
		
		function beforeSaveRec(){
			$this->USER_ID = $_SESSION["_USER_ID"];
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
	
	$articles_articles_form_Impl = new articles_articles_form_impl();
?>