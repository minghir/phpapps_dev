<?php

namespace wabdo;

require_once ("globals.php");
//include ("libs/code_editor.php");
include ("gen_php/phpapps_admin_scripts_form.php");
	class phpapps_admin_scripts_form_impl  extends phpapps_admin_scripts_form{
		public $app_name;
                public $app_id;
                public $module_id;
                public $old_script_name;
                public $script_id = 60;
                public $display_objects_id = 60;
                public $display_objects_type_id = '2';
	
		function __construct(){
                    parent::__construct();
			global $GLOBALS_OBJ;
			$this->globals = $GLOBALS_OBJ;
			
                    //$this->script_id = 60;
                    $this->display_objects_type_id = '2';
                    $this->display_objects_type = 'SCRIPT';
                    $this->display_objects_id = $this->script_id;
                        
			
			$this->MODULE_ID = $_GET["module_id"];
			
			
			
			
			$sql = new DB_query("SELECT 
                                                ID,
                                                APP_ID,
						APP_NAME
						FROM phpapps.view_modules 
						WHERE ID = :module_id", array(":module_id" => $this->MODULE_ID));
                        //echo $sql->prnt();
			$this->globals->con->query($sql);
			$this->globals->con->next();
			$this->app_name = $this->globals->con->get_field("APP_NAME");
                        $this->app_id = $this->globals->con->get_field("APP_ID");
                        $this->module_id = $this->globals->con->get_field("MODULE_ID");
                       
                        
			$this->tpl = "phpapps_admin_scripts_form_imp.tpl";
                        $this->layout = PHPAPPS_LAYOUTS_DIR . "phpapps.tpl";
                        
			$this->init();
                        
                        $display_object_elements_grid = new DB_grid($this->globals->con, "table","phpapps.view_display_object_elements","display_object_elements_grid");
                        $display_object_elements_grid->grid_title = "SCRIPT TEMPLATE ELEMENTS";
                            
                        //$display_object_elements_grid->cols = (array("DISPLAY_OBJECT_NAME","DISPLAY_OBJECT_TYPE","ELEMENT_NAME","ELEMENT_TYPE","TEMPLATE_VARIABLE_NAME"));
                        //$display_object_elements_grid->labels = (array("DISPLAY_OBJECT_NAME","DISPLAY_OBJECT_TYPE","ELEMENT_NAME","ELEMENT_TYPE","TEMPLATE_VARIABLE_NAME"));
                        $display_object_elements_grid->cols = (array("ELEMENT_NAME","ELEMENT_TYPE","TEMPLATE_VARIABLE_NAME"));
                        $display_object_elements_grid->labels = (array("ELEMENT NAME","ELEMENT TYPE","TEMPLATE VARIABLE"));
                        
                        $display_object_elements_grid->where_rules = array("DISPLAY_OBJECT_ID = :script_id","DISPLAY_OBJECT_TYPE_ID = :obj_type_id");
                        $display_object_elements_grid->where_params = array(":script_id" => $this->ID,":obj_type_id" => '2');
                        $display_object_elements_grid->paginable = true;
                        $display_object_elements_grid->filterable = false;
                        $display_object_elements_grid->exportable = false;
                        $display_object_elements_grid->rows_on_pg = 20;
                        $display_object_elements_grid->edit_form = "phpapps_designer_display_object_elements_form_imp.php?obj_id=".$this->ID."&obj_type=2";
                        $this->globals->sm->assign("display_object_elements_grid",$display_object_elements_grid->get_grid_str());
                                    
                        $this->load_elements(); // parent function
			$this->display();
                 
		}
		
		function afterAddRec(){
                    print_r($this->errors);
                        if(count($this->errors) == 0){
                            $sql = new DB_query("SELECT 
                                                    ID,
                                                    APP_ID,
                                                    APP_NAME,
                                                    APP_TITLE,
                                                    APP_LABEL,
                                                    MODULE_ID,
                                                    MODULE_NAME,
                                                    MODULE_TITLE,
                                                    MODULE_LABEL,
                                                    SCRIPT_NAME,
                                                    SCRIPT_TITLE,
                                                    SCRIPT_LABEL
                                                 FROM phpapps.view_scripts
                                                WHERE MODULE_ID = :module_id AND SCRIPT_NAME = :script_name", 
                                            array(":module_id" => $this->MODULE_ID,
                                                  ":script_name" => $this->SCRIPT_NAME));
                           
                            $this->globals->con->query($sql);
                            $this->globals->con->next();

                            $this->script_id = $this->globals->con->get_field("ID");

                            $this->globals->sm->assign(array(
                                    "CLASS_NAME"    => $this->SCRIPT_NAME,
                                    "APP_ID"        => $this->app_id,
                                    "APP_NAME"      => $this->globals->con->get_field("APP_NAME"),
                                    "APP_TITLE"     => $this->globals->con->get_field("APP_TITLE"),
                                    "APP_LABEL"     => $this->globals->con->get_field("APP_LABEL"),
                                    "MODULE_ID"     => $this->MODULE_ID,
                                    "MODULE_NAME"   => $this->globals->con->get_field("MODULE_NAME"),
                                    "MODULE_TITLE"  => $this->globals->con->get_field("MODULE_TITLE"),
                                    "MODULE_LABEL"  => $this->globals->con->get_field("MODULE_LABEL"),
                                    "SCRIPT_ID"     => $this->script_id,
                                    "SCRIPT_NAME"   => $this->globals->con->get_field("SCRIPT_NAME"),
                                    "SCRIPT_TITLE"  => $this->globals->con->get_field("SCRIPT_TITLE"),
                                    "SCRIPT_LABEL"  => $this->globals->con->get_field("SCRIPT_LABEL"),
                            ));

                            $php_content = $this->globals->sm->fetch('php_new_script_template.tpl');
                            $php_file_name = $this->SCRIPT_NAME . ".php";
                            $php_file_path = GLOBALS_DIR . $this->app_name . DIR_SEP . $php_file_name;
                            if(!file_exists($php_file_path)){
                                    $fp = fopen($php_file_path, 'w');
                                    fwrite($fp, $php_content);
                                    fclose($fp);
                            }else{
                                    $this->errors[] = "PHP SCRIPT FILE EXISTS!:$php_file_path ";
                            }

                            $tpl_content = $this->globals->sm->fetch('tpl_new_script_template.tpl');
                            $tpl_file_name = $this->SCRIPT_NAME . ".tpl";
                            $tpl_file_path = GLOBALS_DIR . $this->app_name . DIR_SEP . "tpl" . DIR_SEP . $tpl_file_name;
                            if(!file_exists($tpl_file_path)){
                                    $ft = fopen($tpl_file_path, 'w');
                                    fwrite($ft, $tpl_content);
                                    fclose($ft);
                            }else{
                                    $this->errors[] = "TPL SCRIPT FILE EXISTS!:$tpl_file_path";
                            }
                        }else{
                            print_r($this->errors);
                        }
                         print_r($this->errors);
		}
                
                function beforeSaveRec(){
                    $sql = new DB_query("SELECT SCRIPT_NAME FROM SCRIPTS WHERE ID = :script_id",array(":script_id"=>$this->ID));
                    $this->globals->con->query($sql);
                    $this->globals->con->next();
                    $this->old_script_name = $this->globals->con->get_field("SCRIPT_NAME");
                    
                }
                
                function afterSaveRec(){
                    if(count($this->errors) == 0 ){
                        $old_tpl_file_name_tpl = $this->old_script_name . ".tpl";
			$old_tpl_file_path_tpl = GLOBALS_DIR . $this->app_name . DIR_SEP . "tpl" . DIR_SEP . $old_tpl_file_name_tpl;
                        
                        $new_tpl_file_name_tpl = $this->SCRIPT_NAME . ".tpl";
			$new_tpl_file_path_tpl = GLOBALS_DIR . $this->app_name . DIR_SEP . "tpl" . DIR_SEP . $new_tpl_file_name_tpl;
                        
                        
                        $old_tpl_file_name_php = $this->old_script_name . ".php";
			$old_tpl_file_path_php = GLOBALS_DIR . $this->app_name .  DIR_SEP . $old_tpl_file_name_php;
                        
                        $new_tpl_file_name_php = $this->SCRIPT_NAME . ".php";
			$new_tpl_file_path_php = GLOBALS_DIR . $this->app_name  . DIR_SEP . $new_tpl_file_name_php;
                      
                        echo "<br>RENAME:$old_tpl_file_path_tpl - IN $new_tpl_file_path_tpl<br><br>" ;
                        echo "<br>RENAME:$old_tpl_file_path_php - IN $new_tpl_file_path_php<br><br>" ;
                        
                        if( !rename($old_tpl_file_path_tpl, $new_tpl_file_path_tpl) ){
                            $this->errors[] = "FILES TPL RENAME FAILD !!!!";
                             print_r($this->errors);
                        }
                        
                        if( !rename($old_tpl_file_path_php, $new_tpl_file_path_php) ){
                            $this->errors[] = "FILES PHP RENAME FAILD !!!!";
                          print_r($this->errors);
                        }
                    }else{
                        print_r($this->errors);
                    }
                }
                
		
		function beforeDeleteRec(){
                        $this->getRec();
		}
                
                function afterDeleteRec() {
                    
                    $php_file_name = $this->SCRIPT_NAME . ".php";
                    $php_file_path = GLOBALS_DIR . $this->app_name . DIR_SEP . $php_file_name;
                    
                    $tpl_file_name = $this->SCRIPT_NAME . ".tpl";
                    $tpl_file_path = GLOBALS_DIR . $this->app_name . DIR_SEP . "tpl" . DIR_SEP . $tpl_file_name;
                    
                    if( !( unlink($php_file_path) ) ){
                        $this->errors[] = "FILES UNLINK FAILD !!!!";
                    }
                    
                    if( !( unlink($tpl_file_path) ) ){
                        $this->errors[] = "FILES UNLINK FAILD !!!!";
                    }
                    
                     echo $this->query->prnt();
                     print_r($this->errors);
                }
                
                function beforeDisplay() {
                        $this->TEMPLATE_ID_sel->set_empty_option_value(0);
                        $this->TEMPLATE_ID_sel->setup_select_options();
                   
                }
	}
	$phpapps_admin_scripts_form_Impl = new phpapps_admin_scripts_form_impl();
?>