<?php
namespace wabdo;

if(!defined('CURRENT_APP')) {
	define('CURRENT_APP', 'phpapps');
}

require_once("../phpapps/libs/globals_obj.php");
global $GLOBALS_OBJ;
$GLOBALS_OBJ = new Globals_obj("phpapps","phpapps");
?>
