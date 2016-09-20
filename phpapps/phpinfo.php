<?php
require_once ("globals.php");

global $GLOBALS_OBJ;
phpinfo();
$GLOBALS_OBJ->sm->assign(array("SCRIPT_CONTENT" => "Your code here.",
								"PHPAPPS_SMARTY_TPL_DIR" => PHPAPPS_SMARTY_TPL_DIR));
$GLOBALS_OBJ->sm->display("phpinfo.tpl");

?>