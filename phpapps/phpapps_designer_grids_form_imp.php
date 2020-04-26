<?php
require_once ("globals.php");
include ("gen_php/phpapps_designer_grids_form.php");
	class phpapps_designer_grids_form_impl  extends phpapps_designer_grids_form{
                
                        public $display_objects_type_id = '2';
                        public $display_objects_type = 'SCRIPT';
                        public $display_objects_id = 256;
                        public $script_id = 256;
		function __construct(){
			parent::__construct();
                        //$this->layout_file = PHPAPPS_LAYOUTS_DIR . "phpapps_form.tpl";
			$this->tpl = "phpapps_designer_grids_form_imp.tpl";
			$this->init();
                        //{$grid_grid_columns}
                        
                        $grid_grid_columns = new DB_grid($this->globals->con, "table","phpapps.view_grid_columns","grid_columns_grid");
                        $grid_grid_columns->grid_title = "GRID COLUMNS";
                            
                        //$display_object_elements_grid->cols = (array("DISPLAY_OBJECT_NAME","DISPLAY_OBJECT_TYPE","ELEMENT_NAME","ELEMENT_TYPE","TEMPLATE_VARIABLE_NAME"));
                        //$display_object_elements_grid->labels = (array("DISPLAY_OBJECT_NAME","DISPLAY_OBJECT_TYPE","ELEMENT_NAME","ELEMENT_TYPE","TEMPLATE_VARIABLE_NAME"));
                        $grid_grid_columns->cols = (array("COLUMN_NAME","ALT_COLUMN_TEXT","LABEL","ACTION"));
                        $grid_grid_columns->labels = (array("NAME","ALT TEXT","LABEL","COLUMN ACTION"));
                        
                        $grid_grid_columns->where_rules = array("GRID_ID = :grid_id");///,"TABLE_ID = :table_id");
                        $grid_grid_columns->where_params = array(":grid_id" => $this->ID);//,":table_id" => $this->TABLE_ID);
                        $grid_grid_columns->paginable = true;
                        $grid_grid_columns->filterable = false;
                        $grid_grid_columns->exportable = false;
                        $grid_grid_columns->rows_on_pg = 20;
                        $grid_grid_columns->edit_form = "phpapps_designer_grid_columns_form_imp.php?grid_id=".$this->ID."&table_id=$this->TABLE_ID";
                        $this->globals->sm->assign("grid_grid_columns",$grid_grid_columns->get_grid_str());
                        
                        $this->loadElements();
                        /*
                        $this->display_elements_loader->display_elements['grids']["PHPAPPS_DESIGNER_GRID_ACTIONS"]->grid_obj->where_rules = array("GRID_ID = :grid_id");
                        $this->display_elements_loader->display_elements['grids']["PHPAPPS_DESIGNER_GRID_ACTIONS"]->grid_obj->where_params = array(":grid_id" => $this->ID);
                        $this->display_elements_loader->display_elements['grids']["PHPAPPS_DESIGNER_GRID_ACTIONS"]->grid_obj->edit_form = "phpapps_designer_grid_actions_form_imp.php?grid_id=".$this->ID;
                        //echo "<h1>AICIL:" . $this->display_elements_loader->display_elements['grids']["PHPAPPS_DESIGNER_GRID_ACTIONS"]->grid_obj->edit_form . "</a>";
                        */
			$this->display();
		}
		
		function beforeGetRec(){
		}
		
		function afterGetRec(){
		}
                
                function beforePostActions() {
                    $this->QUERY_ID = $this->QUERY_ID == '' ? 0 : $this->QUERY_ID;
                    $this->TABLE_ID = $this->TABLE_ID == '' ? 0 : $this->TABLE_ID;
                    $this->EDIT_FORM_ID = $this->EDIT_FORM_ID == '' ? 0 : $this->EDIT_FORM_ID;
                    $this->ELEMENT_TEMPLATE_ID = $this->ELEMENT_TEMPLATE_ID == '' ? 0 : $this->ELEMENT_TEMPLATE_ID;
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
		
		function beforeDisplay(){	
		}
		
		function afterDisplay(){
                    if(count($this->errors)>0){
                        print_r($this->errors);
                    }
                }
		
	};
	
	$phpapps_designer_grids_form_Impl = new phpapps_designer_grids_form_impl();
?>