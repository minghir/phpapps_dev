<?php
require_once ("globals.php");

global $GLOBALS_OBJ;

use database-master\Capsule\Manager as Capsule;

$capsule = new Capsule;

$capsule->addConnection([
    'driver'    => 'mysql',
    'host'      => 'localhost',
    'database'  => 'database',
    'username'  => 'root',
    'password'  => 'password',
    'charset'   => 'utf8',
    'collation' => 'utf8_unicode_ci',
    'prefix'    => '',
]);



$GLOBALS_OBJ->sm->assign(array("SCRIPT_CONTENT" => "Your code here.",
								"PHPAPPS_SMARTY_TPL_DIR" => PHPAPPS_SMARTY_TPL_DIR));
$GLOBALS_OBJ->sm->display("test_laravel.tpl");

?>