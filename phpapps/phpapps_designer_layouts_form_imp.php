<?php
namespace wabdo;
require_once ("globals.php");
include ("gen_php/phpapps_designer_layouts_form.php");
	
	class phpapps_designer_layouts_form_impl  extends phpapps_designer_layouts_form{
            	public $script_id = 261;
                private $OLD_LAYOUT_NAME;
                private $APP_NAME;
                public $ID;
		  		public $display_objects_type_id = '2';
                public $display_objects_type = 'SCRIPT';
                protected $display_objects_id = 261;
            
		function __construct(){
			parent::__construct();
			//$this->layout = PHPAPPS_LAYOUTS_DIR . "phpapps_form.tpl";
			$this->tpl = "phpapps_designer_layouts_form_imp.tpl";
			
                        
                        $this->ID = 261;
			$this->script_id = 261;
			
                        
                        
			$this->init();
                        
                        $display_object_elements_grid = new DB_grid($this->globals->con, "table","{$this->globals->PHPAPPS_DB}.view_display_object_elements","display_object_elements_grid");
                        $display_object_elements_grid->grid_title = "LAYOUT TEMPLATE ELEMENTS";
                            
                        //$display_object_elements_grid->cols = (array("DISPLAY_OBJECT_NAME","DISPLAY_OBJECT_TYPE","ELEMENT_NAME","ELEMENT_TYPE","TEMPLATE_VARIABLE_NAME"));
                        //$display_object_elements_grid->labels = (array("DISPLAY_OBJECT_NAME","DISPLAY_OBJECT_TYPE","ELEMENT_NAME","ELEMENT_TYPE","TEMPLATE_VARIABLE_NAME"));
                        $display_object_elements_grid->cols = (array("ELEMENT_NAME","ELEMENT_TYPE","TEMPLATE_VARIABLE_NAME"));
                        $display_object_elements_grid->labels = (array("ELEMENT NAME","ELEMENT TYPE","TEMPLATE VARIABLE"));
                        
                        $display_object_elements_grid->where_rules = array("DISPLAY_OBJECT_ID = :script_id","DISPLAY_OBJECT_TYPE_ID = :obj_type_id");
                        $display_object_elements_grid->where_params = array(":script_id" => $this->ID,":obj_type_id" => '1');
                        $display_object_elements_grid->paginable = true;
                        $display_object_elements_grid->filterable = false;
                        $display_object_elements_grid->exportable = false;
                        $display_object_elements_grid->rows_on_pg = 20;
                        $display_object_elements_grid->edit_form = "phpapps_designer_display_object_elements_form_imp.php?obj_id=".$this->ID."&obj_type=1";
                        $this->globals->sm->assign("display_object_elements_grid",$display_object_elements_grid->get_grid_str());
                        $this->load_elements(); // parent function  
                        $app_name = _tbl("applications","APP_NAME",$this->APP_ID);
                        if($this->gact == "editRec"){
                            $file_to_edit = GLOBALS_DIR . $app_name . DIR_SEP .'tpl' . DIR_SEP . 'layouts' . DIR_SEP . $this->NAME . '.tpl';
                            //echo "aaaa";
                            $this->template_elements['custom_elements']["LAYOUT_TEMPLATE_EDITOR"]->file_to_edit = $file_to_edit;
                        }
                        
			$this->display();
		}
		
		function beforeGetRec(){
		}
		
		function afterGetRec(){
                    //$this->OLD_LAYOUT_NAME = $this->NAME;
                    $_SESSION["OLD_LAYOUT_NAME"] = $this->NAME;
		}
	
		function beforeAddRec(){
		}
		
		function afterAddRec(){
                    
                    print_r($this->errors);
			if(count($this->errors) == 0){
				$app_name = _tbl("applications","APP_NAME",$this->APP_ID);
                                
                        //echo PHPAPPS_LAYOUTS_DIR . 'default.tpl' ."<br>";
                        //echo GLOBALS_DIR . $app_name . DIR_SEP .'tpl' . DIR_SEP . 'layouts' . DIR_SEP . $this->NAME . '.tpl';
				copy( PHPAPPS_LAYOUTS_DIR . 'default.tpl', 
					 GLOBALS_DIR . $app_name . DIR_SEP .'tpl' . DIR_SEP . 'layouts' . DIR_SEP . $this->NAME . '.tpl' ); 
				//header("Location:win_close.html");
			}
			//header("Location:win_close.html");
		}
		
		function beforeSaveRec(){
		}
		
		function afterSaveRec(){
                    
                    print_r($this->errors);
			if(count($this->errors) == 0){
				$app_name = _tbl("applications","APP_NAME",$this->APP_ID);
                                
                        //echo "<br>" . GLOBALS_DIR . $app_name . DIR_SEP .'tpl' . DIR_SEP . 'layouts' . DIR_SEP . $_SESSION["OLD_LAYOUT_NAME"] . '.tpl' ."<br>";
                        //echo GLOBALS_DIR . $app_name . DIR_SEP .'tpl' . DIR_SEP . 'layouts' . DIR_SEP . $this->NAME . '.tpl';
                                if($_SESSION["OLD_LAYOUT_NAME"] != $this->NAME){
                                    rename( GLOBALS_DIR . $app_name . DIR_SEP .'tpl' . DIR_SEP . 'layouts' . DIR_SEP . $_SESSION["OLD_LAYOUT_NAME"] . '.tpl', 
					 GLOBALS_DIR . $app_name . DIR_SEP .'tpl' . DIR_SEP . 'layouts' . DIR_SEP . $this->NAME . '.tpl' ); 
                                }
				//header("Location:win_close.html");
			}
			//header("Location:win_close.html");
                  
		}

		function beforeDeleteRec(){
			$this->ID = $this->gfield_value;
                        $this->NAME  = _tbl("view_layouts","NAME",$this->ID);
			$this->APP_NAME = _tbl("view_layouts","APP_NAME",$this->ID);
		}
		
		function afterDeleteRec(){
                    if(count($this->errors) == 0){
                        $file_del = GLOBALS_DIR . $this->APP_NAME . DIR_SEP .'tpl' . DIR_SEP . 'layouts' . DIR_SEP . $this->NAME . '.tpl';
                        unlink($file_del);
        	}
			
		//	header("Location:win_close.html");
		}
		
		function beforeDisplay(){
                   //  parent::display_tpl();
		}
		
		function afterDisplay(){	
                    
		}
		
	};
	
	$phpapps_designer_layouts_form_Impl = new phpapps_designer_layouts_form_impl();
?>