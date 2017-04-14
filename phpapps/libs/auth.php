<?php

//Authentication
class auth{
    
    public $globals;
    public $public_script = false;
    
    function __construct($glb) {
        session_start();
        GLOBAL $globals;
        $this->globals = $glb;
    }    
        
    function authenticate(){
        if($this->public_script) {
            return;
        }else{
            
            if($_SESSION["_USER_ID"] == ""){
		if($_POST["user"] != "" && $_POST["pass"] != ""){
                    $this->login();
                }else{
                    $this->logout();
                }
            }else{
                $_USER_ID = $_SESSION["_USER_ID"]; 
            }
        
            $this->check_session();
        }
    }
    
    function login(){
        $sql = new DB_Query("SELECT ID, 
				USERNAME,
				SCRIPT_NAME
                            FROM 
				phpapps.view_users 
                            WHERE username = :USER AND 
				password = :PASS",
				array(":USER" => trim($_POST['user']),":PASS"=>trim($_POST['pass'])));
	
        if($this->globals->con->query($sql)==1){
            $res=$this->globals->con->fetch_array();
            $_SESSION["_USER_ID"] = $res["ID"];
            $_SESSION["_USER_NAME"] = $res["USERNAME"];
        }else{
            $this->globals->sm->assign("ERROR","USER si/sau PAROLA gresite!!!");
            $this->logout();
        }
    }
    
    function logout(){
        session_start();
        session_destroy();
        $this->globals->sm->display( PHPAPPS_TPL_DIR . 'login.tpl' );
        exit;
    }
    
    function check_session(){
        echo $_SESSION["_USER_ID"] .":" .  $_SESSION["_USER_NAME"] ."<br>";
    }
    
    public function public_script(){
        //echo "set public";
        $this->public_script = true;
    }
    
    public function private_script(){
        $this->public_script = false;
    }
}
?>