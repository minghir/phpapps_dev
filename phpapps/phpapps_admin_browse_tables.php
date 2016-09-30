<?php
require_once ("globals.php");


$sql = new DB_query("SELECT 
				ID, 
				APP_NAME,
				TABLE_NAME,
				TABLE_SCHEMA 
		FROM phpapps.view_tables
		WHERE 	ID = :id AND 
				MODULE_ID = :module_id ",
		array(":id"=>$_GET["gfield_value"],":module_id"=>$_GET["module_id"]));
		
$GLOBALS_OBJ->con->query($sql);	
$GLOBALS_OBJ->con->next();
$phpapps_admin_tables_form_grid =  new DB_grid($GLOBALS_OBJ->con, "table",$GLOBALS_OBJ->con->get_field("TABLE_SCHEMA") . "." . $GLOBALS_OBJ->con->get_field("TABLE_NAME"),"phpapps_".$GLOBALS_OBJ->con->get_field("SHORT_TABLE_NAME")."_grid");
$phpapps_admin_tables_form_grid->paginable = true;
$phpapps_admin_tables_form_grid->rows_on_pg = 20;
					
$sql = new DB_query("SELECT FORM_PHP_DIR, FORM_NAME , APP_NAME
					FROM phpapps.view_forms f
					WHERE f.TABLE_NAME = :table_name 
					AND f.MODULE_ID = :module_id ORDER BY f.ID ASC",
					array(":table_name" => $GLOBALS_OBJ->con->get_field("TABLE_NAME"),":module_id"=>$_GET["module_id"]));
//echo $sql->sql();					
//echo "<br>" . 
$GLOBALS_OBJ->con->query($sql);	
$GLOBALS_OBJ->con->next();

if(file_exists(GLOBALS_DIR . $GLOBALS_OBJ->con->get_field("APP_NAME") .DIR_SEP. $GLOBALS_OBJ->con->get_field("FORM_NAME") . "_imp.php")){// && 
	$phpapps_admin_tables_form_grid->edit_form = WEB_BASE_DIR . $GLOBALS_OBJ->con->get_field("APP_NAME") ."/".$GLOBALS_OBJ->con->get_field("FORM_NAME") . "_imp.php";
}else{
	$phpapps_admin_tables_form_grid->editable = false;	
}

if(file_exists(GLOBALS_DIR . $this->globals->con->get_field("APP_NAME") .DIR_SEP. $this->globals->con->get_field("FORM_NAME") . "_imp.php")){// && 
	$phpapps_admin_tables_form_grid->edit_form = WEB_BASE_DIR . $this->globals->con->get_field("APP_NAME") ."/".$this->globals->con->get_field("FORM_NAME") . "_imp.php";
}else{
	$phpapps_admin_tables_form_grid->editable = false;	
}

echo $phpapps_admin_tables_form_grid->get_grid_str();
?>