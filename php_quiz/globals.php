<?php

if (!defined('CURRENT_APP_DIR')) {
	define('CURRENT_APP_DIR', GLOBALS_DIR . 'php_quiz' . DIR_SEP);
}
require_once("../phpapps/globals.php");
global $GLOBALS_OBJ;
$GLOBALS_OBJ = new Globals("php_quiz");
?>