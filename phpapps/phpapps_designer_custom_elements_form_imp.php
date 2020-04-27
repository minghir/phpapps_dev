<?php
require_once ("globals.php");
include ("gen_php/phpapps_designer_custom_elements_form.php");
	class phpapps_designer_custom_elements_form_impl  extends phpapps_designer_custom_elements_form{
            public $script_id = 263;   
            public $old_custom_element_name;
            public $file_to_delete_php;
            private $file_to_delete_tpl;
            private $APP_NAME;
            
		function __construct(){
			parent::__construct();
                        //$this->layout = PHPAPPS_LAYOUTS_DIR . "default_form.tpl";
			$this->tpl = "phpapps_designer_custom_elements_form_imp.tpl";
			$this->init();
                        
                        $display_object_elements_grid = new DB_grid($this->globals->con, "table","phpapps.view_display_object_elements","display_object_elements_grid");
                        $display_object_elements_grid->grid_title = "OBJECT ELEMENTS";
                            
                        //$display_object_elements_grid->cols = (array("DISPLAY_OBJECT_NAME","DISPLAY_OBJECT_TYPE","ELEMENT_NAME","ELEMENT_TYPE","TEMPLATE_VARIABLE_NAME"));
                        //$display_object_elements_grid->labels = (array("DISPLAY_OBJECT_NAME","DISPLAY_OBJECT_TYPE","ELEMENT_NAME","ELEMENT_TYPE","TEMPLATE_VARIABLE_NAME"));
                        $display_object_elements_grid->cols = (array("ELEMENT_NAME","ELEMENT_TYPE","TEMPLATE_VARIABLE_NAME"));
                        $display_object_elements_grid->labels = (array("ELEMENT NAME","ELEMENT TYPE","TEMPLATE VARIABLE"));
                        
                        $display_object_elements_grid->where_rules = array("DISPLAY_OBJECT_ID = :script_id","DISPLAY_OBJECT_TYPE_ID = :obj_type_id");
                        $display_object_elements_grid->where_params = array(":script_id" => $this->ID,":obj_type_id" => '4');
                        $display_object_elements_grid->paginable = true;
                        $display_object_elements_grid->filterable = false;
                        $display_object_elements_grid->exportable = false;
                        $display_object_elements_grid->rows_on_pg = 20;
                        $display_object_elements_grid->edit_form = "phpapps_designer_display_object_elements_form_imp.php?obj_id=".$this->ID."&obj_type=4";
                        $this->globals->sm->assign("display_object_elements_grid",$display_object_elements_grid->get_grid_str());
                        
                        
                        
			$this->LoadElements();
			$this->display();
		}
		
		function beforeGetRec(){
		}
		
		function afterGetRec(){
		}
                
                function beforePostActions(){
                }
	
		function beforeAddRec(){
                    //$this->NAME = strtolower($this->NAME);
		}
		
		function afterAddRec(){
			//header("Location:win_close.html");
                    echo "AIIIIIIIIIIIIIICIIIIIIIIIIIIIIII";
                    
                    if(count($this->errors) == 0){
                            $sql = new DB_query("SELECT 
                                                    ID,
                                                    APP_ID,
                                                    (SELECT APP_NAME FROM phpapps.applications WHERE phpapps.applications.ID = phpapps.custom_elements.APP_ID) AS APP_NAME
                                                    FROM phpapps.custom_elements
                                                    WHERE APP_ID = :app_id AND NAME = :element_name", 
                                            array(":app_id" => $this->APP_ID,
                                                  ":element_name" => $this->NAME));
                            echo $sql->prnt();
                           
                            $this->globals->con->query($sql);
                            $this->globals->con->next();

                            $this->ID = $this->globals->con->get_field("ID");
                            $this->APP_NAME = $this->globals->con->get_field("APP_NAME");
                            $this->APP_ID = $this->globals->con->get_field("APP_ID");
                            // GENERATING PHP CLASS FILE
                            $this->globals->sm->assign(array(
                                    "CLASS_NAME" => strtolower($this->NAME),
                                    "APP_ID" => $this->APP_ID,
                                    "APP_NAME" => $this->APP_NAME,
                                    "CUSTOM_ELEMENT_ID" => $this->ID,
                            ));

                            $php_content = $this->globals->sm->fetch('php_class_custom_element_template.tpl');
                            $php_file_name = strtolower($this->NAME) . ".php";
                            $php_file_path = GLOBALS_DIR . $this->APP_NAME . DIR_SEP ."custom_elements" . DIR_SEP. $php_file_name;
                            if(!file_exists($php_file_path)){
                                    $fp = fopen($php_file_path, 'w');
                                    fwrite($fp, $php_content);
                                    fclose($fp);
                            }else{
                                    $this->errors[] = "PHP SCRIPT FILE EXISTS!:$php_file_path ";
                            }
                            
                            $tpl_content = $this->globals->sm->fetch('tpl_new_custom_element_template.tpl');
                            $tpl_file_name = strtolower($this->NAME) . ".tpl";
                            $tpl_file_path = GLOBALS_DIR . $this->APP_NAME . DIR_SEP . "tpl" . DIR_SEP ."custom_elements" .DIR_SEP . $tpl_file_name;
                            if(!file_exists($tpl_file_path)){
                                    $ft = fopen($tpl_file_path, 'w');
                                    fwrite($ft, $tpl_content);
                                    fclose($ft);
                            }else{
                                    $this->errors[] = "TPL SCRIPT FILE EXISTS!:$tpl_file_path";
                            }
                            
                    }
                    print_r($this->errors);
		}
		
		function beforeSaveRec(){
                    $sql = new DB_query("SELECT NAME,"
                            . "(SELECT APP_NAME FROM phpapps.applications WHERE phpapps.applications.ID = phpapps.custom_elements.APP_ID) AS APP_NAME "
                            . "FROM phpapps.custom_elements WHERE ID = :script_id",array(":script_id"=>$this->ID));
                    $this->globals->con->query($sql);
                    $this->globals->con->next();
                    $this->old_custom_element_name = strtolower($this->globals->con->get_field("NAME"));
                    $this->APP_NAME = $this->globals->con->get_field("APP_NAME");
                    //$this->NAME = strtolower($this->NAME);
		}
		
		function afterSaveRec(){
                    if(count($this->errors) == 0 ){
                        $old_tpl_file_name_tpl = $this->old_custom_element_name . ".tpl";
			$old_tpl_file_path_tpl = GLOBALS_DIR . $this->APP_NAME . DIR_SEP . "tpl" . DIR_SEP . "custom_elements" . DIR_SEP . $old_tpl_file_name_tpl;
                        
                        $new_tpl_file_name_tpl = strtolower($this->NAME) . ".tpl";
			$new_tpl_file_path_tpl = GLOBALS_DIR . $this->APP_NAME . DIR_SEP . "tpl" . DIR_SEP . "custom_elements" . DIR_SEP . $new_tpl_file_name_tpl;
                        
                        
                        $old_tpl_file_name_php = $this->old_custom_element_name . ".php";
			$old_tpl_file_path_php = GLOBALS_DIR . $this->APP_NAME .  DIR_SEP . "custom_elements" . DIR_SEP . $old_tpl_file_name_php;
                        
                        $new_tpl_file_name_php = strtolower($this->NAME) . ".php";
			$new_tpl_file_path_php = GLOBALS_DIR . $this->APP_NAME  . DIR_SEP . "custom_elements" . DIR_SEP .$new_tpl_file_name_php;
                      
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
                    $sql = new DB_query("SELECT NAME,"
                            . "(SELECT APP_NAME FROM phpapps.applications WHERE phpapps.applications.ID = phpapps.custom_elements.APP_ID) AS APP_NAME "
                            . "FROM phpapps.custom_elements WHERE ID = :script_id",array(":script_id"=>$this->ID));
                    $this->globals->con->query($sql);
                    $this->globals->con->next();
                    $this->old_custom_element_name = $this->globals->con->get_field("NAME");
                    $this->APP_NAME = $this->globals->con->get_field("APP_NAME");
                    
                    //$this->APP_NAME = 
                    $this->file_to_delete_php = GLOBALS_DIR . $this->APP_NAME  . DIR_SEP . "custom_elements" . DIR_SEP . $this->NAME . ".php";
                    $this->file_to_delete_tpl = GLOBALS_DIR . $this->APP_NAME . DIR_SEP . "tpl" . DIR_SEP . "custom_elements" . DIR_SEP . $this->NAME . ".tpl";
		}
		
		function afterDeleteRec(){
                    if(count($this->errors) == 0 ){
                        if( !( unlink($this->file_to_delete_php) && unlink($this->file_to_delete_tpl) ) ){
                            $this->errors[] = "FILES UNLINK FAILD !!!!";
                        }
                    }else{
                        print_r($this->errors);
                    }
                }
		
                function afterPostActions(){
                }
                
		function beforeDisplay(){	
		}
		
		function afterDisplay(){	
		}
		
	};
	
	$phpapps_designer_custom_elements_form_Impl = new phpapps_designer_custom_elements_form_impl();
?>