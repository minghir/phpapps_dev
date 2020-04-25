<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class login extends phpapps_display_abs{
    public $globals;
    public function __construct(){
               parent::__construct();
                global $GLOBALS_OBJ;
            $this->globals = &$GLOBALS_OBJ;
            
           if(count($_POST) > 0 ){
               if($_POST["user"] != "" && $_POST["pass"] != ""){
                   $sql = new DB_Query("SELECT ID, 
                                                   USERNAME,
                                                   PASSWORD,
                                                   SCRIPT_NAME
                                                   FROM 
                                                   phpapps.view_users 
                                                   WHERE username = :USER AND 
                                                   PASSWORD = :PASS",
                                                   array(":USER" => trim($_POST['user']),":PASS"=>trim($_POST['pass'])));
//echo $sql->prnt();
                if($this->globals->con->query($sql)==1){

                   $res=$this->globals->con->fetch_array();
                   session_start();
                   $_SESSION["_USER_ID"] = $res["ID"];
                   $_SESSION["_USER_NAME"] = $res["USERNAME"];
                   $_SESSION["_USER_PASS"] = $res["PASSWORD"];

                   header("Location:". WEB_APP_DIR . $res["SCRIPT_NAME"].".php");

               }else{
                       $this->globals->sm->assign("ERROR","Wrong USER or/and PASSWORD !!!");
               }
           }
       }else{
       }
       //$con->print_log();
       $this->tpl = "phpapps_login.tpl";
       $this->setLayoutFile("phpapps_login");
       $this->displayTpl();
       //$globals->sm->display('login.tpl');
    }
}
new login();
?>