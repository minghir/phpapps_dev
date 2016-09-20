<?php
require_once ("globals.php");
//include ("phpapps_admin_list_form_imp.php");

global $GLOBALS_OBJ;
$globals = $GLOBALS_OBJ;

$globals->con->select_db("phpapps");
$sql = new DB_query("SELECT 
			t.ID, 
			CONCAT(d.VALUE,'.',t.TABLE_NAME) AS TABLE_NAME,
			t.TABLE_NAME AS SHORT_TABLE_NAME	
		FROM phpapps.tables t, phpapps.view_modules m, phpapps.list_databases d 
		WHERE t.ID = :ID AND 
		t.MODULE_ID = :MODULE_ID AND 
		t.MODULE_ID = m.ID AND m.MODULE_SCHEMA = d.ID",
		array(":ID" => $_GET["gfield_value"],
				":MODULE_ID" => $_GET["module_id"]));
//echo $sql->sql();
$globals->con->query($sql);	
$globals->con->next();

$phpapps_admin_browse_lists =  new DB_grid($globals->con, "table",$globals->con->get_field("TABLE_NAME"),"phpapps_list_grid");
$phpapps_admin_browse_lists->cols = (array("VALUE","DESCRIPTION"));
$phpapps_admin_browse_lists->paginable = true;
$phpapps_admin_browse_lists->rows_on_pg = 20;
$phpapps_admin_browse_lists->edit_form = "phpapps_admin_list_form_imp.php?list_name=".$globals->con->get_field("SHORT_TABLE_NAME");

echo $phpapps_admin_browse_lists->get_grid_str();
?>