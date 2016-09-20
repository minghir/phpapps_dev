<?php
require_once ("globals.php");
//include ("phpapps_admin_list_form_imp.php");

$globals =  new Globals();

$globals->con->select_db("phpapps");
$sql = new DB_query("SELECT t.ID, CONCAT(d.VALUE,'.',t.TABLE_NAME) AS TABLE_NAME  
				FROM tables t, view_modules m, list_databases d 
				WHERE t.ID = :ID AND t.MODULE_ID = :MODULE_ID and t.MODULE_ID = m.ID and  m.MODULE_SCHEMA = d.ID",
				array(":ID" => $_GET["gfield_value"],
						":MODULE_ID" => $_GET["module_id"]
				));
$globals->con->query($sql);	
$globals->con->next();

$phpapps_admin_browse_lists =  new DB_grid($globals->con, "table",$globals->con->get_field("TABLE_NAME"),"phpapps_list_grid");
$phpapps_admin_browse_lists->cols = (array("VALUE","DESCRIPTION"));
$phpapps_admin_browse_lists->paginable = true;
$phpapps_admin_browse_lists->rows_on_pg = 20;
$phpapps_admin_browse_lists->edit_form = "phpapps_admin_list_form_imp.php";

echo $phpapps_admin_browse_lists->get_grid_str();
?>