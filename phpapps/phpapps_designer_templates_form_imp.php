<?php
require_once ("globals.php");
include ("gen_php/phpapps_designer_templates_form.php");
	class phpapps_designer_templates_form_impl  extends phpapps_designer_templates_form{
            
                private $OLD_TEMPLATE_NAME;
                private $APP_NAME;
                public $ID;
            
		function __construct(){
			parent::__construct();
                        $this->layout = PHPAPPS_LAYOUTS_DIR . "default_form.tpl";
			$this->tpl = "phpapps_designer_templates_form_imp.tpl";
                        
                        $this->script_id = 274;
                        $this->display_objects_type_id = '2';
                        $this->display_objects_type = 'SCRIPT';
                        $this->display_objects_id = $this->script_id;
                        
                        $this->init();
                        $this->loadElements(); // parent function
			$this->display();
                        
		}
		
		function beforeGetRec(){
		}
		
		function afterGetRec(){
                    $_SESSION["OLD_TEMPLATE_NAME"] = $this->TEMPLATE_NAME;
		}
                
                function beforePostActions(){
                }
	
		function beforeAddRec(){
		}
		
		function afterAddRec(){
                     print_r($this->errors);
                    if(count($this->errors) == 0){
			$app_name = _tbl("applications","APP_NAME",$this->APP_ID);
                        
                        switch(_tbl("phpapps.list_template_types","VALUE",$this->ELEMENT_TYPE_ID)){
                            case 'SCRIPT': 
                                $path_to = "scripts";
                            break;
                            case 'FORM': 
                                $path_to = "forms";
                            break;
                            case 'GRID': 
                                $path_to = "grids";
                            break;
                            case 'MENU': 
                                $path_to = "menus";
                            break;
                            case 'CUSTOM_ELEMENT': 
                                $path_to = "custom_elements";
                            break;
                            default:
                                $this->errors[] = "UNKNOWN ELEMENT!!!";
                            break;
                        }
                        
			copy( PHPAPPS_TPL_DIR ."templates" . DIR_SEP . 'empty_template.tpl', 
					 GLOBALS_DIR . $app_name . DIR_SEP .'tpl' . DIR_SEP . $path_to . DIR_SEP . $this->TEMPLATE_NAME . '.tpl' ); 
                    }
		}
		
		function beforeSaveRec(){
		}
		
		function afterSaveRec(){
			if(count($this->errors) == 0){
				$app_name = _tbl("applications","APP_NAME",$this->APP_ID);
                            switch(_tbl("phpapps.list_template_types","VALUE",$this->ELEMENT_TYPE_ID)){
                                case 'SCRIPT': 
                                    $path_to = "scripts";
                                break;
                                case 'FORM': 
                                    $path_to = "forms";
                                break;
                                case 'GRID': 
                                    $path_to = "grids";
                                break;
                                case 'MENU': 
                                    $path_to = "menus";
                                break;
                                case 'CUSTOM_ELEMENT': 
                                    $path_to = "custom_elements";
                                break;
                                default:
                                    $this->errors[] = "UNKNOWN ELEMENT!!!";
                                break;
                            }   
                        
				rename( GLOBALS_DIR . $app_name . DIR_SEP .'tpl' . DIR_SEP . $path_to . DIR_SEP . $_SESSION["OLD_TEMPLATE_NAME"] . '.tpl', 
					 GLOBALS_DIR . $app_name . DIR_SEP .'tpl' . DIR_SEP .$path_to . DIR_SEP . $this->TEMPLATE_NAME . '.tpl' ); 
				//header("Location:win_close.html");
			}
		}

		function beforeDeleteRec(){
                        $this->ID = $this->gfield_value;
                        $this->TEMPLATE_NAME  = _tbl("view_templates","TEMPLATE_NAME",$this->ID);
			$this->APP_NAME = _tbl("view_templates","APP_NAME",$this->ID);
		}
		
		function afterDeleteRec(){
                            switch(_tbl("phpapps.list_template_types","VALUE",$this->ELEMENT_TYPE_ID)){
                                case 'SCRIPT': 
                                    $path_to = "scripts";
                                break;
                                case 'FORM': 
                                    $path_to = "forms";
                                break;
                                case 'GRID': 
                                    $path_to = "grids";
                                break;
                                case 'MENU': 
                                    $path_to = "menus";
                                break;
                                case 'CUSTOM_ELEMENT': 
                                    $path_to = "custom_elements";
                                break;
                                default:
                                    $this->errors[] = "UNKNOWN ELEMENT!!!";
                                break;
                            }   
                    if(count($this->errors) == 0){
                        $file_del = GLOBALS_DIR . $this->APP_NAME . DIR_SEP .'tpl' . DIR_SEP . $path_to . DIR_SEP . $this->NAME . '.tpl';
                        unlink($file_del);
                    }
		}
		
                function afterPostActions(){
                }
                
		function beforeDisplay(){	
		}
		
		function afterDisplay(){	
		}
		
	};
	
	$phpapps_designer_templates_form_Impl = new phpapps_designer_templates_form_impl();
?>