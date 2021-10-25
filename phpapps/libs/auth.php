<?php
namespace wabdo;
//Authentication
class auth{
    
    public $globals;
    public $public_script = false;
    public $script_name;
    public $script_id;
    
    function __construct($glb) {
        //session_start();
        GLOBAL $globals;
        $this->globals = $glb;
        $this->script_name =  basename($_SERVER["SCRIPT_FILENAME"],".php");
        $tst = new DB_table("scripts");
        $tst->globals = $this->globals;
        if( $tst->getValueByField("SCRIPT_TYPE_ID","SCRIPT_NAME",$this->script_name) == 2 ){
            $this->public_script = true;
        }else{
          //  echo "AICICCCCCCCCC";exit;
            $this->public_script = false;
        }
        
        $this->script_id = $tst->getValueByField("ID","SCRIPT_NAME",$this->script_name);
        //echo $tst->prnt();
        //exit;
    }    
        
    function authenticate(){
        if($this->public_script) {
            return true;
        }else{

                if(isset($_SESSION["_USER_ID"])){
                    
                    $sql = new DB_Query("SELECT ID, 
                                                   USERNAME,
                                                   PASSWORD,
                                                   SCRIPT_NAME
                                                   FROM 
                                                   {$this->globals->PHPAPPS_DB}.view_users 
                                                   WHERE username = :USER AND 
                                                   PASSWORD = :PASS",
                                                   array(":USER" => trim($_SESSION['_USER_NAME']),":PASS"=>trim($_SESSION['_USER_PASS'])));
//echo $sql->prnt();
                if($this->globals->con->query($sql)==1){
                    $this->globals->USER_ID = $_SESSION["_USER_ID"];
                    return true;
                }else{
                    $this->logout();
                }
            }else{
                    $this->logout();
            }

    }
    }
    /*
    function login(){
        if(isset($_POST)){
            $sql = new DB_Query("SELECT ID, 
				USERNAME,
                                PASSWORD,
				SCRIPT_NAME,
                                PROFILE_ID
                            FROM 
				{$this->globals->PHPAPPS_DB}.view_users 
                            WHERE username = :USER AND 
				PASSWORD = :PASS",
				array(":USER" => trim($_POST['user']),":PASS"=>trim($_POST['pass'])));
            if($this->globals->con->query($sql)==1){
                $res=$this->globals->con->fetch_array();
                $_SESSION["_USER_ID"] = $res["ID"];
                $_SESSION["_USER_NAME"] = $res["USERNAME"];
                $_SESSION["_USER_PROFILE_ID"] = $res["PROFILE_ID"];
                $_SESSION["_USER_PASS"] = $res["PASSWORD"];
                
                $this->authenticate();
            }else{
                $this->globals->sm->assign("ERROR","USER si/sau PAROLA gresite!!!");
                $this->logout();
            }
        }
    }
    */
    function logout(){
        session_destroy();
        //$this->globals->sm->display( PHPAPPS_TPL_DIR . 'login.tpl' );
        header("Location:login.php");
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