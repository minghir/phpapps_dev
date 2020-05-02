<?php
require_once ("globals.php");
include ("gen_php/test_app_test3_form.php");
	class test_app_test3_form_impl  extends test_app_test3_form{
                        public $script_id = 304;
                        public $display_objects_type_id = '2';
                        public $display_objects_type = 'SCRIPT';
                        public $display_objects_id = 304;
                
		function __construct(){
			parent::__construct();
                        
                        
                        $this->tpl = "test_app_test3_form_imp.tpl";
                        $this->display_objects_id = $this->script_id;
                        
                        $this->init();
                        $this->loadElements(); // parent function
			$this->display();
                        
		}
		
		function beforeGetRec(){
		}
		
		function afterGetRec(){
		}
                
                function beforePostActions(){
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
		
                function afterPostActions(){
                }
                
		function beforeDisplay(){	
		}
		
		function afterDisplay(){	
		}
		
	};
	
	$test_app_test3_form_Impl = new test_app_test3_form_impl();
?>