<?php

//Authentication
class auth{
    
    public $globals;
    public $public_script = false;
    public $script_name;
    
    
    function __construct($glb) {
        session_start();
        GLOBAL $globals;
        $this->globals = $glb;
        
        $this->script_name =  basename($_SERVER["SCRIPT_FILENAME"],".php");
        
        //echo $this->script_name . "<br>";
        
        $tst = new DB_table("scripts");
        $tst->globals = $this->globals;
       // echo $tst->getValueByField("SCRIPT_TYPE","SCRIPT_NAME",$this->script_name);
        if( $tst->getValueByField("SCRIPT_TYPE","SCRIPT_NAME",$this->script_name) == 2 ){
            $this->public_script = true;
        }else{
            $this->public_script = false;
        }
    }    
        
    function authenticate(){
        
        if($this->public_script) {
            return true;
        }else{
            if($this->check_session()){
                if(!isset($_SESSION["_USER_ID"])){
                   // if($_POST["user"] != "" && $_POST["pass"] != ""){
                        $this->login();
                    //}else{
                    //    $this->logout();
                    //}
                }else{
                    $_USER_ID = $_SESSION["_USER_ID"]; 
                }
        
                $this->check_session();
            }else{
                $this->logout();
            }
        }
    }
    
    function login(){
        if(isset($_POST)){
            $sql = new DB_Query("SELECT ID, 
				USERNAME,
				SCRIPT_NAME
                            FROM 
				phpapps.view_users 
                            WHERE username = :USER AND 
				password = :PASS",
				array(":USER" => trim($_POST['user']),":PASS"=>trim($_POST['pass'])));
	print_r($sql);
            if($this->globals->con->query($sql)==1){
                $res=$this->globals->con->fetch_array();
                $_SESSION["_USER_ID"] = $res["ID"];
                $_SESSION["_USER_NAME"] = $res["USERNAME"];
            }else{
                $this->globals->sm->assign("ERROR","USER si/sau PAROLA gresite!!!");
                $this->logout();
            }
        }
    }
    
    function logout(){
        //session_start();
        session_destroy();
        $this->globals->sm->display( PHPAPPS_TPL_DIR . 'login.tpl' );
        exit;
    }
    
    function check_session(){
        if (session_status() == PHP_SESSION_NONE){
            return FALSE;
        }else{
            return TRUE;
        }
        //echo $_SESSION["_USER_ID"] .":" .  $_SESSION["_USER_NAME"] ."<br>";
    }
    
    function public_script(){
        //echo "set public";
        $this->public_script = true;
    }
    
    function private_script(){
        $this->public_script = false;
    }
}
?>