<?php
require_once ("globals.php");
include ("gen_php/eshop_admin_products_form.php");
	class eshop_admin_products_form_impl  extends eshop_admin_products_form{
                        public $script_id = 301;
                        public $display_objects_type_id = '2';
                        public $display_objects_type = 'SCRIPT';
                        public $display_objects_id = 301;
                
		function __construct(){
			parent::__construct();
                        
                        
                        $this->tpl = "eshop_admin_products_form_imp.tpl";
                        $this->display_objects_id = $this->script_id;
                        
                        $this->init();
                        $this->load_elements(); // parent function
                        $this->template_elements['grids']["ESHOP_PRODUCT_IMGS"]->grid_title = "Imagini";
                        $this->template_elements['grids']["ESHOP_PRODUCT_IMGS"]->cols = array("CONCAT('<img width=\'90\' src=',IMG_FILE_NAME,'>') AS IMG");
                        $this->template_elements['grids']["ESHOP_PRODUCT_IMGS"]->where_rules = array("PRODUCT_ID = :prod_id");
                        $this->template_elements['grids']["ESHOP_PRODUCT_IMGS"]->where_params = array(":prod_id" => $this->ID);
                        $this->template_elements['grids']["ESHOP_PRODUCT_IMGS"]->edit_form = "eshop_admin_product_images_form_imp.php?product_id=".$this->ID;
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
	
	$eshop_admin_products_form_Impl = new eshop_admin_products_form_impl();
?>