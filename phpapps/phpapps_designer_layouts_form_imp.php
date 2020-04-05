<?php
require_once ("globals.php");
include ("gen_php/phpapps_designer_layouts_form.php");
	class phpapps_designer_layouts_form_impl  extends phpapps_designer_layouts_form{
            
                private $OLD_LAYOUT_NAME;
            
		function __construct(){
			parent::__construct();
			$this->template = "phpapps_designer_layouts_form_imp.tpl";
			$this->init();
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
				rename( GLOBALS_DIR . $app_name . DIR_SEP .'tpl' . DIR_SEP . 'layouts' . DIR_SEP . $_SESSION["OLD_LAYOUT_NAME"] . '.tpl', 
					 GLOBALS_DIR . $app_name . DIR_SEP .'tpl' . DIR_SEP . 'layouts' . DIR_SEP . $this->NAME . '.tpl' ); 
				//header("Location:win_close.html");
			}
			//header("Location:win_close.html");
                  
		}

		function beforeDeleteRec(){
			if(count($this->errors) == 0){
                                $layout_name = _tbl("view_layouts","NAME",$this->gfield_value);
				$app_name = _tbl("view_layouts","APP_NAME",$this->gfield_value);
                                $file_del = GLOBALS_DIR . $app_name . DIR_SEP .'tpl' . DIR_SEP . 'layouts' . DIR_SEP . $layout_name . '.tpl';
                                unlink($file_del);
			}
		}
		
		function afterDeleteRec(){
			
		//	header("Location:win_close.html");
		}
		
		function beforeDisplay(){	
		}
		
		function afterDisplay(){	
		}
		
	};
	
	$phpapps_designer_layouts_form_Impl = new phpapps_designer_layouts_form_impl();
?>