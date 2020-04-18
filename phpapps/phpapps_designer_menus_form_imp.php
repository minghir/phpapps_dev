<?php
require_once ("globals.php");
include ("gen_php/phpapps_designer_menus_form.php");
	class phpapps_designer_menus_form_impl  extends phpapps_designer_menus_form{
		function __construct(){
			parent::__construct();
			$this->template = "phpapps_designer_menus_form_imp.tpl";
			$this->init();
                        if($this->MENU_TYPE == 2){
                            $menu_items_grid = new DB_grid($this->globals->con, "table","phpapps.menu_items","phpapps_menu_items_grid");
                            $menu_items_grid->grid_title = "MENU ITEMS";
                            $menu_items_grid->cols = (array("LABEL","ACTION"));
                            $menu_items_grid->labels = (array("LABEL","ACTION"));
                            $menu_items_grid->where_rules = array("QUERY_ID = :query_id");
                            $menu_items_grid->where_params = array(":query_id" => $this->ID);
                            $menu_items_grid->paginable = true;
                            $menu_items_grid->filterable = false;
                            $menu_items_grid->exportable = false;
                            $menu_items_grid->rows_on_pg = 20;
                            $menu_items_grid->edit_form = "phpapps_database_query_parameters_form_imp.php?query_id=".$this->ID;
                            $this->globals->sm->assign("menu_items_grid",$menu_items_grid->get_grid_str());
                            echo "<br>".$menu_items_grid->prnt();
                        }
                        
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