<?php
require_once ("globals.php");
$globals = new Globals("phpapps");

if(count($_POST) > 0 ){
	
   if($_POST["user"] != "" && $_POST["pass"] != ""){
     $sql = new DB_Query("SELECT ID, 
					USERNAME,
					SCRIPT_NAME
					FROM 
					phpapps.view_users 
					WHERE username = :USER AND 
					password = :PASS",
					array(":USER" => trim($_POST['user']),":PASS"=>trim($_POST['pass'])));
		$con = $globals->con;
     if($globals->con->query($sql)==1){
	 
        $res=$globals->con->fetch_array();
        session_start();
        $_SESSION["_USER_ID"] = $res["ID"];
        $_SESSION["_USER_NAME"] = $res["USERNAME"];
			
        header("Location:".$res["SCRIPT_NAME"].".php");
         
    }else{
            $globals->sm->assign("ERROR","USER si/sau PAROLA gresite!!!");
    }
//	$globals->sm->assign("ERROR","USER si/sau PAROLA gresite!!!");
  }

}else{
    //$globals->sm->assign("ERROR","Introduceti USER si PAROLA!!!");
}

//$con->print_log();
$globals->sm->display('login.tpl');

?>