<?php
use wabdo\Globals_obj;



if(!defined('CURRENT_APP')) {
	define('CURRENT_APP', 'eshop');
}

require_once("../phpapps/libs/globals_obj.php");




global $GLOBALS_OBJ;
$GLOBALS_OBJ = new Globals_obj("eshop","eshop");
?>
