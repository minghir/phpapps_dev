<?php
require_once ("globals.php");
include ("gen_php/phpapps_database_query_parameters_form.php");
	class phpapps_database_query_parameters_form_impl  extends phpapps_database_query_parameters_form{
		function __construct(){
			parent::__construct();
			$this->template = "phpapps_database_query_parameters_form_imp.tpl";
                        
                        $this->QUERY_ID = $_GET["query_id"];
                        
			$this->init();
                        
                        $this->PARAMETER_TYPE_sel->set_empty_option(false);
                        
			$this->display();
		}
		
		function beforeGetRec(){
		}
		
		function afterGetRec(){
		}
	
		function beforeAddRec(){
		}
		
		function afterAddRec(){
                    print_r($this->errors);
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
	
	$phpapps_database_query_parameters_form_Impl = new phpapps_database_query_parameters_form_impl();
?>