<?php
require_once ("globals.php");
include ("gen_php/diomax_admin_links_form.php");
	class diomax_admin_links_form_impl  extends diomax_admin_links_form{
		function __construct(){
			parent::__construct();
			$this->template = "diomax_admin_links_form_imp.tpl";
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
	
	$diomax_admin_links_form_Impl = new diomax_admin_links_form_impl();
?>