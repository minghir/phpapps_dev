<?php
namespace wabdo;

require_once ("globals.php");
include ("gen_php/phpapps_database_queries_form.php");
	class phpapps_database_queries_form_impl  extends phpapps_database_queries_form{
		function __construct(){
			parent::__construct();
			$this->template = "phpapps_database_queries_form_imp.tpl";
                        $this->MODULE_ID = $_GET["module_id"];
			$this->init();
                        
                        $parameters_grid = new DB_grid($this->globals->con, "table","{$this->globals->PHPAPPS_DB}.query_parameters","phpapps_query_parameters_grid");
                        $parameters_grid->grid_title = "QUERY PARAMETERS";
                        $parameters_grid->cols = (array("PARAMETER_NAME","PARAMETER_VALUE"));
                        $parameters_grid->labels = (array("PARAMETER_NAME","PARAMETER_VALUE"));
                        $parameters_grid->where_rules = array("QUERY_ID = :query_id");
                        $parameters_grid->where_params = array(":query_id" => $this->ID);
                        $parameters_grid->paginable = true;
                        $parameters_grid->filterable = false;
                        $parameters_grid->exportable = false;
                        $parameters_grid->rows_on_pg = 20;
                        $parameters_grid->edit_form = "phpapps_database_query_parameters_form_imp.php?query_id=".$this->ID;
                        $this->globals->sm->assign("parameters_grid",$parameters_grid->get_grid_str());
                        //echo "<br>".$parameters_grid->prnt();
                        
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
	
	$phpapps_database_queries_form_Impl = new phpapps_database_queries_form_impl();
?>