<?php
session_start();
/*
if( $_SERVER["SCRIPT_NAME"] != "/phpapps/login.php"){
	if($_SESSION["_USER_ID"] == ""){
		header("Location:logout.php");
	}else{
           $_USER_ID = $_SESSION["_USER_ID"]; 
        }
}
 * 
 */
 $_USER_ID = $_SESSION["_USER_ID"]; 
?>