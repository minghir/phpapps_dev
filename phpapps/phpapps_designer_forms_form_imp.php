<?php
require_once ("globals.php");
include ("gen_php/phpapps_designer_forms_form.php");
	class phpapps_designer_forms_form_impl  extends phpapps_designer_forms_form{
        
                        //public $layout = PHPAPPS_LAYOUTS_DIR . "default.tpl";
			
                        
                        public $script_id = 278;
                        public $display_objects_type_id = '2';
                        public $display_objects_type = 'SCRIPT';
                        public $display_objects_id = 278;
                
		function __construct(){
			parent::__construct();
                        
                        
                        $this->tpl = "phpapps_designer_forms_form_imp.tpl";
                        $this->display_objects_id = $this->script_id;
                        
                        $this->init();
                        $this->load_elements(); // parent function
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
	
	$phpapps_designer_forms_form_Impl = new phpapps_designer_forms_form_impl();
?>