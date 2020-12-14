<?php
/**
* script template version 
*/
namespace wabdo;
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");
require_once (PHPAPPS_LIBS_DIR . "alerts.php");
class client_login_generated extends template{

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
    protected $_MODULE_ID = 31;
    
    /**
     * module name as db identifier
     *
     * @var int
     */
    protected $_MODULE_NAME = "eshop_public";
    
    /**
     * module long title
     *
     * @var string
     */
    protected $_MODULE_TITLE = "public";
    
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
    protected $_SCRIPT_NAME = "client_login";
    
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
    protected $_SCRIPT_LABEL = "client_login";
    
    protected $_SCRIPT_VERSION = "";
    
    
    
    protected $display_objects_type_id = 2;
    protected $display_objects_type = "SCRIPT";
    protected $display_objects_id = 364;
    
    protected $smary;
    protected $con;
    private $alerts;    
    function __construct() {
        parent::__construct();
        
        $this->tpl = "client_login.tpl";        
        $this->smarty = $globals->sm;
        $this->con = $globals->con;
        $this->alerts = new alerts();
        
            $client_email = $_POST["email"];
            $client_password = $_POST["password"];
            
           if(count($_POST) > 0 ){
               if($client_email != "" && $client_password != ""){
                   $sql = new DB_Query("SELECT ID, 
                                                   EMAIL,
                                                   PASSWORD
                                                   FROM 
                                                   eshop.clients 
                                                   WHERE EMAIL = :USER AND 
                                                   PASSWORD = :PASS",
                                                   array(":USER" => $client_email,":PASS"=>$client_password));
//echo $sql->prnt();
                if($this->globals->con->query($sql)==1){

                   $res=$this->globals->con->fetch_array();
                   
                   $_SESSION["_CLIENT_ID"] = $res["ID"];
                   $_SESSION["_CLIENT_EMAIL"] = $res["EMAIL"];
                   $_SESSION["_CLIENT_PASS"] = $res["PASSWORD"];

                   header("Location: products.php");
                }else{
                   $this->alerts->add_alert("danger", "Parola si/sau email gresite  !!!",0);
                   $this->alerts->get_no_errors();
                           
                   $this->globals->sm->assign("MESSAGE_BLOCK",$this->alerts->get_message_str());
               }
               }
           }   
        
        
        
     
        // phpapps_display_abs Load all elelments
        $this->load_elements(); // parent function
        $this->setup_display();
        $this->display_template(); // parent function

    }
    
    function setup_display() {
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "client_login: Youre code here."));
    }
    
}

new client_login_generated();
?>