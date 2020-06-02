<?php
namespace wabdo;
require_once ("globals.php");
include ("gen_php/phpapps_database_add_table_form.php");
	class phpapps_database_add_table_form_impl  extends phpapps_database_add_table_form{
		function __construct(){
			parent::__construct();
			$this->template = "phpapps_database_add_table_form_imp.tpl";
                        
                        $this->MODULE_ID = $_GET["module_id"];
                        $this->TABLE_TYPE = $_GET["table_type"];
                        echo "AIIIICIII1";
			$this->init();
			$this->display();
		}
		
		function beforeGetRec(){
		}
		
		function afterGetRec(){
		}
	
		function beforeAddRec(){
                    
                    echo "AIIIICIII2";
                    $this->ORIGIN_ID = $this->TABLE_NAME;
				$sql = new DB_query("SELECT 
									TABLE_NAME, 
									TABLE_SCHEMA, 
									TABLE_SCHEMA_ID,
                                                                        TABLE_TYPE
								FROM view_tables 
								WHERE ID = :ID",array(":ID"=>$this->TABLE_NAME));
                    $this->globals->con->query($sql);
                    $this->globals->con->next();
                    $this->TABLE_NAME = $this->globals->con->get_field("TABLE_NAME");
                    $this->TABLE_TYPE = $this->globals->con->get_field("TABLE_TYPE");
                    $this->SCHEMA_ID = $this->globals->con->get_field("TABLE_SCHEMA_ID");
                    echo $sql->prnt();
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
                    $sql_txt = new DB_query("SELECT 
								ID AS VALUE, 
								CONCAT('(',APP_NAME,'/', MODULE_NAME,') ',TABLE_NAME) AS LABEL 
								FROM phpapps.view_tables
								WHERE MODULE_ID <> :MODULE_ID AND TABLE_TYPE = :TABLE_TYPE 
                                                                GROUP BY ID,CONCAT(TABLE_SCHEMA,'.',TABLE_NAME)
								ORDER BY APP_NAME,MODULE_NAME,TABLE_NAME",
                    array(":MODULE_ID" => $this->MODULE_ID,":TABLE_TYPE" => $this->TABLE_TYPE));
                    
                    //echo $sql_txt->prnt();
                    
                    $this->TABLE_NAME_sel->set_query($sql_txt);
                    $this->TABLE_NAME_sel->selected_val = $this->TABLE_NAME;
                    $this->TABLE_NAME_sel->setup_select_options();
                    $this->globals->sm->assign("TABLE_NAME_sel",$this->TABLE_NAME_sel->get_select_str());
		
		}
		
		function afterDisplay(){	
		}
		
	};
	
	$phpapps_database_add_table_form_Impl = new phpapps_database_add_table_form_impl();
?>