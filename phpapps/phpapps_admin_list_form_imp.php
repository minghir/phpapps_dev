<?php
require_once ("globals.php");
include ("gen_php/phpapps_admin_list_form.php");
	class phpapps_admin_list_form_impl  extends phpapps_admin_list_form{
		function phpapps_admin_list_form_impl(){
			global $GLOBALS_OBJ;
			$this->globals = $GLOBALS_OBJ;
				
			$sql = new DB_query("SELECT t.ID, d.VALUE AS TABLE_SCHEMA, TABLE_NAME  
				FROM tables t, view_modules m, list_databases d 
				WHERE t.TABLE_NAME = :TABLE_NAME and t.MODULE_ID = m.ID and  m.MODULE_SCHEMA = d.ID",
				array(":TABLE_NAME" => $_GET["list_name"]));
		
			$this->globals->con->query($sql);	
			$this->globals->con->next();
			$this->schema = $this->globals->con->get_field("TABLE_SCHEMA");
			$this->table = $this->globals->con->get_field("TABLE_NAME");
			$this->template = "phpapps_admin_list_form_imp.tpl";
			
			$this->init();
			$this->display();
		}
	};
	
	$phpapps_admin_list_form_Impl = new phpapps_admin_list_form_impl();
?>