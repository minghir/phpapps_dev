<?php
require_once ("globals.php");
//include ("eshop_admin_categories_form_imp.php");

$globals =  new Globals();
$eshop_admin_categories_form_grid =  new DB_grid($globals->con, "table","eshop.categories","eshop_categories_grid");
$eshop_admin_categories_form_grid->paginable = true;
$eshop_admin_categories_form_grid->rows_on_pg = 5;
$eshop_admin_categories_form_grid->edit_form = "eshop_admin_categories_form_imp.php";

echo $eshop_admin_categories_form_grid->get_grid_str();
?>