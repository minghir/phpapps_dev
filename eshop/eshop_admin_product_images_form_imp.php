<?php
require_once ("globals.php");
include ("gen_php/eshop_admin_product_images_form.php");
	class eshop_admin_product_images_form_impl  extends eshop_admin_product_images_form{
                        public $script_id = 303;
                        public $display_objects_type_id = '2';
                        public $display_objects_type = 'SCRIPT';
                        public $display_objects_id = 303;
                
		function __construct(){
			parent::__construct();
                        
                        $this->PRODUCT_ID = $_GET["product_id"];
                        
                        
                        $this->tpl = "eshop_admin_product_images_form_imp.tpl";
                        $this->display_objects_id = $this->script_id;
                        
                        $this->init();
                        $this->loadElements(); // parent function
                        //$this->display_elements["grids"]["ESHOP_PRODUCT_IMGS"]->editForm = 
                        
                        
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
                    if(count($this->errors) > 0) print_r($this->errors);
		}
		
		function afterDisplay(){	
		}
		
	};
	
	$eshop_admin_product_images_form_Impl = new eshop_admin_product_images_form_impl();
?>