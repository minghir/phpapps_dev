<?php
require_once ("globals.php");
include ("gen_php/eshop_admin_categories_form.php");
	class eshop_admin_categories_form_impl  extends eshop_admin_categories_form{
                        public $script_id = 298;
                        public $display_objects_type_id = '2';
                        public $display_objects_type = 'SCRIPT';
                        public $display_objects_id = 298;
                
		function __construct(){
			parent::__construct();
                        
                        
                        $this->tpl = "eshop_admin_categories_form_imp.tpl";
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
                    $this->PID_sel->set_empty_option_value(0);
                     $this->PID_sel->setup_select_options();
		}
		
		function afterDisplay(){	
		}
		
	};
	
	$eshop_admin_categories_form_Impl = new eshop_admin_categories_form_impl();
?>