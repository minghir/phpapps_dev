<?php
/**
* script template version 
*/
//namespace wabdo;

require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "alerts.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class admin_login_generated extends wabdo\template{

    /**
     * application database id
     *
     * @var int
     */
    protected $_APP_ID = 7;
    
    /**
     * application name as unique identifier
     *
     * @var string
     */
    protected $_APP_NAME = "eshop";
    
    /**
     * application long title
     *
     * @var string
     */
    protected $_APP_TITLE = "E-Shop";
    
    /**
     * application label (short title)
     *
     * @var string
     */
    protected $_APP_LABEL = "";
    
    /**
     * module id
     *
     * @var int
     */
    protected $_MODULE_ID = 10;
    
    /**
     * module name as db identifier
     *
     * @var int
     */
    protected $_MODULE_NAME = "eshop_admin";
    
    /**
     * module long title
     *
     * @var string
     */
    protected $_MODULE_TITLE = "admin";
    
    /**
     * module label (short title)
     *
     * @var string
     */
    protected $_MODULE_LABEL = "";
    
    /**
     * script name as db identifier
     *
     * @var string
     */
    protected $_SCRIPT_NAME = "admin_login";
    
    /**
     * script long title
     *
     * @var string
     */
    protected $_SCRIPT_TITLE = "Login";
    
    /**
     * module label (short title)
     *
     * @var string
     */
    protected $_SCRIPT_LABEL = "Login";
    
    protected $_SCRIPT_VERSION = "";
    
    
    
    protected $display_objects_type_id = 2;
    protected $display_objects_type = "SCRIPT";
    protected $display_objects_id = 371;
    
    protected $smary;
    protected $con;
        
    function __construct() {
        parent::__construct();
        
        $this->tpl = "admin_login.tpl";        
        $this->smarty = $globals->sm;
        $this->con = $globals->con;
        $this->alerts = new wabdo\alerts();
     
        // phpapps_display_abs Load all elelments
        $this->load_elements(); // parent function
        
            $test_user = $_POST["user"];
            $test_pass = $_POST["pass"];
  
           if(count($_POST) > 0 ){

               if($test_user != "" && $test_pass != ""){
                   $sql = new wabdo\DB_Query("SELECT ID, 
                                                   USERNAME,
                                                   PASSWORD,
                                                   SCRIPT_NAME
                                                   FROM 
                                                   {$this->globals->PHPAPPS_DB}.view_users 
                                                   WHERE username = :USER AND 
                                                   PASSWORD = :PASS",
                                                   array(":USER" => $test_user,":PASS"=>$test_pass));
//echo "AICI:". $sql->prnt();
//exit();
                if($this->globals->con->query($sql)==1){

                   $res=$this->globals->con->fetch_array();
                   
                   $_SESSION["_USER_ID"] = $res["ID"];
                   $_SESSION["_USER_NAME"] = $res["USERNAME"];
                   $_SESSION["_USER_PASS"] = $res["PASSWORD"];

                   header("Location:admin.php");

               }else{
                   $this->alerts->add_alert("danger", "Wrong USER or PASSWORD !!!",0);
                   $this->alerts->get_no_errors();
                           
                   $this->globals->sm->assign("MESSAGE_BLOCK",$this->alerts->get_message_str());
               }
           }
       }else{
       }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        $this->setup_display();
        $this->display_template(); // parent function

    }
    
    function setup_display() {
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "admin_login: Youre code here."));
    }
    
}

new admin_login_generated();
?>