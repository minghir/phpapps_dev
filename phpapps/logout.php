<?php
//include ("./libs/functions.php");
session_start();
//logaction("Logout:" . $_SESSION["_USER_NAME"]);
session_destroy();
header("Location:login.php");
?>