<?php
require_once ("globals.php");
include ("gen_php/phpapps_designer_display_object_elements_form.php");
	class phpapps_designer_display_object_elements_form_impl  extends phpapps_designer_display_object_elements_form{
                public $script_id = 260;
		function __construct(){
			parent::__construct();
                        $this->layout = PHPAPPS_LAYOUTS_DIR . "default_form.tpl";
			$this->tpl = "phpapps_designer_display_object_elements_form_imp.tpl";
                        
                        //obj_id=".$this->ID."&obj_type='2'"
                        
                        $this->DISPLAY_OBJECT_ID = $_GET["obj_id"];
                        $this->DISPLAY_OBJECT_TYPE_ID = $_GET["obj_type"];
                        
			$this->init();
                        $this->loadElements();
			$this->display();
		}
		
		function beforeGetRec(){
		}
		
		function afterGetRec(){
		}
                
                function beforePostActions(){
                }
	
		function beforeAddRec(){
                    
               //     $this->DISPLAY_OBJECT_TYPE_ID = _tbl("phpapps.view_posible_display_object_elements","");
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
	
	$phpapps_designer_display_object_elements_form_Impl = new phpapps_designer_display_object_elements_form_impl();
?>