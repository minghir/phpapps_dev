<?php
require_once ("globals.php");
include ("gen_php/phpapps_designer_templates_form.php");
	class phpapps_designer_templates_form_impl  extends phpapps_designer_templates_form{
            
             private $OLD_TEMPLATE_NAME;
             private $APP_NAME;
            
		function __construct(){
			parent::__construct();
                        //$this->layout = PHPAPPS_LAYOUTS_DIR . "default_form.tpl";
			$this->template = "phpapps_designer_templates_form_imp.tpl";
			$this->init();
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
                    if(count($this->errors) == 0){
                        
			$app_name = _tbl("applications","APP_NAME",$this->APP_ID);
                                
                        //echo PHPAPPS_LAYOUTS_DIR . 'default.tpl' ."<br>";
                        //echo GLOBALS_DIR . $app_name . DIR_SEP .'tpl' . DIR_SEP . 'layouts' . DIR_SEP . $this->NAME . '.tpl';
                                
                        switch(_tbl("phpapps.list_display_elements_types","VALUE",$this->ELEMENT_TYPE_ID)){
                            case 'MENU':
                                $path_to = 'menus';
                            break;
                            case 'GRID':
                                $path_to = 'grids';
                            break;
                        }
                         
                        copy( GLOBALS_DIR . 'phpapps' . DIR_SEP .'tpl' . DIR_SEP . $path_to . DIR_SEP . 'default.tpl', 
					 GLOBALS_DIR . $app_name . DIR_SEP .'tpl' . DIR_SEP . $path_to . DIR_SEP . $this->TEMPLATE_NAME . '.tpl' ); 
                        
			//header("Location:win_close.html");
                    }
		}
		
		function beforeSaveRec(){
		}
		
		function afterSaveRec(){
                     print_r($this->errors);
			if(count($this->errors) == 0){
                            $app_name = _tbl("applications","APP_NAME",$this->APP_ID);
                                
                            switch(_tbl("phpapps.list_display_elements_types","VALUE",$this->ELEMENT_TYPE_ID)){
                                case 'MENU':
                                    $path_to = 'menus';
                                break;
                                case 'GRID':
                                    $path_to = 'grids';
                                break;
                            }
                            rename( GLOBALS_DIR . $app_name . DIR_SEP .'tpl' . DIR_SEP . $path_to . DIR_SEP . $_SESSION["OLD_TEMPLATE_NAME"] . '.tpl', 
					 GLOBALS_DIR . $app_name . DIR_SEP .'tpl' . DIR_SEP . $path_to . DIR_SEP . $this->TEMPLATE_NAME . '.tpl' ); 
                        }
			//header("Location:win_close.html");
			//header("Location:win_close.html");
		}

		function beforeDeleteRec(){
                     $this->ID = $this->gfield_value;
                     $this->ELEMENT_TYPE = _tbl("view_templates","ELEMENT_TYPE",$this->ID);
                     $this->TEMPLATE_NAME = _tbl("view_templates","TEMPLATE_NAME",$this->ID);
                     $this->APP_NAME = _tbl("view_templates","APP_NAME",$this->ID);
                     
		}
		
		function afterDeleteRec(){
                    echo "<h1>".$this->ID."</h1><br>";
                    if(count($this->errors) == 0){
                        
                        switch($this->ELEMENT_TYPE){
                                case 'MENU':
                                    $path_to = 'menus';
                                break;
                                case 'GRID':
                                    $path_to = 'grids';
                                break;
                        }
                        echo "$<h1>$path_to </h1>";
                        $file_del = GLOBALS_DIR . $this->APP_NAME . DIR_SEP .'tpl' . DIR_SEP . $path_to . DIR_SEP . $this->TEMPLATE_NAME . '.tpl';
                        echo "<h1>$file_del</h1>";
                        unlink($file_del);
                    }
                   
		//	header("Location:win_close.html");
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