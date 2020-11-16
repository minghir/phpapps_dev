<?php
/**
* script template version 
*/
namespace wabdo;
require_once ("globals.php");
include ("generated_php/phpapps_designer_layouts_form_generated.php");
	class phpapps_designer_layouts_form  extends phpapps_designer_layouts_form_generated{
                    /**
                     * application database id
                     *
                     * @var int
                     */
                    protected $_APP_ID = 1;
                    /**
                     * application name as unique identifier
                     *
                     * @var string
                     */
                    protected $_APP_NAME = "phpapps";

                    /**
                     * application long title
                     *
                     * @var string
                     */
                    protected $_APP_TITLE = "PHP Applications";

                    /**
                     * application label (short title)
                     *
                     * @var string
                     */
                    protected $_APP_LABEL = "";

                    /**
                     * module id
                     *
                     * @var int
                     */
                    protected $_MODULE_ID = 21;

                    /**
                     * module name as db identifier
                     *
                     * @var int
                     */
                    protected $_MODULE_NAME = "phpapps_designer";

                    /**
                     * module long title
                     *
                     * @var string
                     */
                    protected $_MODULE_TITLE = "designer";

                    /**
                     * module label (short title)
                     *
                     * @var string
                     */
                    protected $_MODULE_LABEL = "";

                    /**
                     * script name as db identifier
                     *
                     * @var string
                     */
                    protected $_SCRIPT_NAME = "phpapps_designer_layouts_form";

                    /**
                     * script long title
                     *
                     * @var string
                     */
                    protected $_SCRIPT_TITLE = "";

                    /**
                     * module label (short title)
                     *
                     * @var string
                     */
                    protected $_SCRIPT_LABEL = "";

                    protected $_SCRIPT_VERSION = "";    
        
        
                        //public $script_id = 359;
                        public $display_objects_type_id = '2';
                        public $display_objects_type = 'SCRIPT';
                        public $display_objects_id = 359;
                        
                        protected $smary;
                        protected $con;
                
		function __construct(){
			parent::__construct();
                        
                        
                        $this->tpl = "phpapps_designer_layouts_form.tpl";
                        //$this->display_objects_id = $this->script_id;
                        
                        $this->load_elements(); // parent function: class template
                        $this->init();
                         
                         $display_object_elements_grid = new DB_grid($this->globals->con, "table","phpapps.view_display_object_elements","display_object_elements_grid");
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
                        $app_id = _tbl("layouts","APP_ID",$this->ID);
                        
                        $this->APP_ID_sel->set_empty_option(false);
                        $this->THEME_ID_sel->set_empty_option(false);
                        $this->THEME_ID_sel->where_rules = array("APP_ID = :app_id");
                        $this->THEME_ID_sel->where_params = array(":app_id"=>$app_id);

                        /*
                        if($this->gact == "editRec"){
                            $file_to_edit = GLOBALS_DIR . $app_name . DIR_SEP .'tpl' . DIR_SEP . 'layouts' . DIR_SEP . $this->NAME . '.tpl';
                            echo "AICIIIII:<br><br>" . $file_to_edit."<br><br><br>";
                            $this->template_elements['custom_elements']["LAYOUT_TEMPLATE_EDITOR"]->file_to_edit = $file_to_edit;
                        }
                         * 
                         */
                        
                        // parent function: class phpapps_designer_layouts_form 
			$this->display();// parent function: class phpapps_designer_layouts_form 
                        
		}
		
		function before_get_rec(){
		}
		
		function after_get_rec(){
                    $_SESSION["OLD_LAYOUT_NAME"] = $this->NAME;
		}
                
                function before_post_actions(){
                }
	
		function before_add_rec(){
		}
		
		function after_add_rec(){
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
		
		function before_save_rec(){
		}
		
		function after_save_rec(){
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

		function before_delete_rec(){
                    $this->ID = $this->gfield_value;
                        $this->NAME  = _tbl("view_layouts","NAME",$this->ID);
			$this->APP_NAME = _tbl("view_layouts","APP_NAME",$this->ID);
		}
		
		function after_delete_rec(){
                     if(count($this->errors) == 0){
                        $file_del = GLOBALS_DIR . $this->APP_NAME . DIR_SEP .'tpl' . DIR_SEP . 'layouts' . DIR_SEP . $this->NAME . '.tpl';
                        unlink($file_del);
                     }
		//	header("Location:win_close.html");
		}
		
                function after_post_actions(){
                }
                
		function before_display(){	
                        
		}
		
		function after_display(){	
		}
		
	};
	
	$phpapps_designer_layouts_form_Impl = new phpapps_designer_layouts_form();
?>