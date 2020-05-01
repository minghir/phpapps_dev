<?php
require_once ("globals.php");
include ("gen_php/phpapps_designer_menus_form.php");
	class phpapps_designer_menus_form_impl  extends phpapps_designer_menus_form{
                public $script_id = 240;
                public $display_objects_type_id = '2';
                public $display_objects_type = 'SCRIPT';
                public $display_objects_id = 240;
                
		function __construct(){
			parent::__construct();
			$this->tpl = "phpapps_designer_menus_form_imp.tpl";
			$this->init();
                        
                        if($this->MENU_TYPE == 2){
                            $menu_items_grid = new DB_grid($this->globals->con, "table","phpapps.view_menu_items","phpapps_menu_items_grid");
                            $menu_items_grid->grid_title = "MENU ITEMS";
                            $menu_items_grid->cols = (array("LABEL","ACTION","PLABEL"));
                            $menu_items_grid->labels = (array("LABEL","ACTION","PARENT"));
                            $menu_items_grid->where_rules = array("MENU_ID = :menu_id");
                            $menu_items_grid->where_params = array(":menu_id" => $this->ID);
                            //$menu_items_grid->editable = true;
                            $menu_items_grid->paginable = true;
                            $menu_items_grid->filterable = false;
                            $menu_items_grid->exportable = false;
                            $menu_items_grid->rows_on_pg = 20;
                            $menu_items_grid->edit_form = "phpapps_designer_menu_items_form_imp.php?dobj_id=".$this->ID;
                            $this->globals->sm->assign("menu_items_grid",$menu_items_grid->get_grid_str());
                            //echo "<br>".$menu_items_grid->prnt();
                        }
                       
                        $this->loadElements();
			$this->display();
		}
		
		function beforeGetRec(){
		}
		
		function afterGetRec(){
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
		}
		
	};
	
	$phpapps_designer_menus_form_Impl = new phpapps_designer_menus_form_impl();
?>