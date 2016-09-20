<?php
require_once ("globals.php");
//include ("{$form_name}_imp.php");

$globals =  new Globals();
${$form_name}_grid =  new DB_grid($globals->con, "table","{$schema}.{$table}","{$schema}_{$table}_grid");
${$form_name}_grid->paginable = true;
${$form_name}_grid->rows_on_pg = 5;
${$form_name}_grid->edit_form = "{$form_name}_imp.php";

echo ${$form_name}_grid->get_grid_str();
?>