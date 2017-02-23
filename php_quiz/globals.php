<?php
/*
if (!defined('CURRENT_APP')) {
	define('CURRENT_APP', GLOBALS_DIR . 'php_quiz' . DIR_SEP);
}
 * */
 
if(!defined('CURRENT_APP')) {
	define('CURRENT_APP', 'php_quiz');
}

require_once("../phpapps/globals.php");
global $GLOBALS_OBJ;
$GLOBALS_OBJ = new Globals("php_quiz");
?>