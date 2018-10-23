<?php
require_once ("globals.php");
include ("gen_php/phpapps_database_table_details_form.php");
	class phpapps_database_table_details_form_impl  extends phpapps_database_table_details_form{
		function __construct(){
			parent::__construct();
			$this->template = "phpapps_database_table_details_form_imp.tpl";
			$this->init();
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
                    $this->ACCEPT_NULL_sel->set_empty_option(FALSE);
                    $this->AUTOINCREMENT_sel->set_empty_option(FALSE);
                    $this->UNSIGN_sel->set_empty_option(FALSE);
                    $sql = new DB_query ("SELECT ID AS value, CONCAT(TABLE_SCHEMA,'.',TABLE_NAME) AS label 
			FROM phpapps.view_tables 
                        WHERE TABLE_TYPE = :tbl_type 
                        ORDER BY TABLE_SCHEMA, TABLE_NAME",array(":tbl_type" => _lst("list_table_types","values_table")));
                    // AND MODULE = curent_module ?
                    //$this->TABLE_ID_sel->set_empty_option(FALSE);
                    $this->TABLE_ID_sel->set_query($sql);
		}
		
		function afterDisplay(){	
		}
		
	};
	
	$phpapps_database_table_details_form_Impl = new phpapps_database_table_details_form_impl();
?>