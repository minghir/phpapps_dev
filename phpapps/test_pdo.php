<?php
require_once ("globals.php");

global $GLOBALS_OBJ;
$GLOBALS_OBJ->sm->assign(array("SCRIPT_CONTENT" => "Your code here."));
$GLOBALS_OBJ->sm->display("test_pdo.tpl");


try{
	$db = new PDO("mysql:host=localhost;dbname=phpapps;charset=utf8","root","");
$mysecuredata=14;
$db->query("Select * from users");
}catch(PDOException  $e ){
echo "Error: ".$e;
}

?>