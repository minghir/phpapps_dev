<?php
require_once ("globals.php");

global $GLOBALS_OBJ;
$GLOBALS_OBJ->sm->assign(array("SCRIPT_CONTENT" => "Your code here."));
$GLOBALS_OBJ->sm->display("phpapps_users_generate_permissions.tpl");

?>