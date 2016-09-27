<?php
require_once ("globals.php");
include ("gen_php/phpapps_admin_add_table_form.php");
	class phpapps_admin_add_table_form_impl  extends phpapps_admin_add_table_form{
		function phpapps_admin_add_table_form_impl(){
			global $GLOBALS_OBJ;
			$this->globals = $GLOBALS_OBJ;
			
			$this->MODULE_ID = $_GET["module_id"];
                        $this->TABLE_TYPE = $_GET["table_type"];
                        
			$this->template = "phpapps_admin_add_table_form_imp.tpl";
			$this->init();
			$this->display();
		}
	
		function beforeDisplay(){
				$this->TABLE_NAME_sel->query = "SELECT 
								ID AS VALUE, 
								CONCAT('(',APP_NAME,'/', MODULE_NAME,') ',TABLE_NAME) AS LABEL 
								FROM phpapps.view_tables
								WHERE MODULE_ID <> :MODULE_ID AND TABLE_TYPE = :TABLE_TYPE 
                                                                GROUP BY CONCAT(TABLE_SCHEMA,'.',TABLE_NAME)
								ORDER BY APP_NAME,MODULE_NAME,TABLE_NAME";
				$this->TABLE_NAME_sel->query_params = array(":MODULE_ID" => $this->MODULE_ID,":TABLE_TYPE" => $this->TABLE_TYPE);
				$this->TABLE_NAME_sel->selected_val = $this->TABLE_NAME;
				$this->TABLE_NAME_sel->setup_select_options();
				$this->globals->sm->assign("TABLE_NAME_sel",$this->TABLE_NAME_sel->get_select_str());
		}
		
		function beforeAddRec(){
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
		}
	};	
	$phpapps_admin_add_table_form_Impl = new phpapps_admin_add_table_form_impl();
?>