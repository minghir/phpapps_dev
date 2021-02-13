<?php
namespace wabdo;
use smarty;

require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");
require_once (PHPAPPS_LIBS_DIR . "alerts.php");

class login extends template{
    public $globals;
    private $alerts;
    protected $display_objects_id = 161;
    protected $display_objects_type_id = '2';
    protected $display_objects_type = 'SCRIPT';
    
    public function __construct(){
            parent::__construct();
            global $GLOBALS_OBJ;
            $this->globals = &$GLOBALS_OBJ;
            $this->alerts = new alerts();
            
            $this->load_elements();
            
            $test_user = $_POST["user"];
            $test_pass = $_POST["pass"];
  //echo "AICI1:"          ;
           if(count($_POST) > 0 ){
               if($test_user != "" && $test_pass != ""){
                   $sql = new DB_Query("SELECT ID, 
                                                   USERNAME,
                                                   PASSWORD,
                                                   SCRIPT_NAME
                                                   FROM 
                                                   {$this->globals->PHPAPPS_DB}.view_users 
                                                   WHERE username = :USER AND 
                                                   PASSWORD = :PASS",
                                                   array(":USER" => $test_user,":PASS"=>$test_pass));
echo "AICI:". $sql->prnt();
                if($this->globals->con->query($sql)==1){

                   $res=$this->globals->con->fetch_array();
                   
                   $_SESSION["_USER_ID"] = $res["ID"];
                   $_SESSION["_USER_NAME"] = $res["USERNAME"];
                   $_SESSION["_USER_PASS"] = $res["PASSWORD"];

                   header("Location:". WEB_APP_DIR . $res["SCRIPT_NAME"].".php");

               }else{
                   $this->alerts->add_alert("danger", "Wrong USER or PASSWORD !!!",0);
                   $this->alerts->get_no_errors();
                           
                   $this->globals->sm->assign("MESSAGE_BLOCK",$this->alerts->get_message_str());
               }
           }
       }else{
       }
       
       $this->tpl = "phpapps_login.tpl";
       $this->display_template();
    }
}
new login();
?>