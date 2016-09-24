<?php
require_once ("globals.php");
include ("gen_php/phpapps_database_list_form.php");
	class phpapps_database_list_form_impl  extends phpapps_database_list_form{
		function __construct(){
			parent::__construct();
			$this->template = "phpapps_database_list_form_imp.tpl";
                        $this->table = $_GET["list_name"];
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
			header("Location:win_close.html");
		}
		
		function beforeSaveRec(){
		}
		
		function afterSaveRec(){
			header("Location:win_close.html");
		}

		function beforeDeleteRec(){
		}
		
		function afterDeleteRec(){
			header("Location:win_close.html");
		}
		
		function beforeDisplay(){	
		}
		
		function afterDisplay(){	
		}
		
	};
	
	$phpapps_database_list_form_Impl = new phpapps_database_list_form_impl();
?>