<?php
namespace wabdo;
include("config.php");

//function logaction($text, $userid = $_SESSION["_USER_ID"]){
function logaction($text){
    global $con, $_SESSION;
    
    //session_start();
    $userid = $_SESSION["_USER_ID"];
    $sql = "INSERT INTO actions (uid,logdate, description) VALUES('$userid','".date("Y-m-d H:i:s")."','$text')";
    $con->exec($sql);
}

function array_sums($vector){
  if ( count($vector) > 0 ){
    return array_sum($vector);
  }else{
    return 0;
  }

}

?>