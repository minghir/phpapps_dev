<?php
/**
* script template version 
*/
namespace wabdo;
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");
require_once (PHPAPPS_LIBS_DIR . "alerts.php");

class send_order_generated extends template{

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
    protected $_SCRIPT_NAME = "send_order";
    
    /**
     * script long title
     *
     * @var string
     */
    protected $_SCRIPT_TITLE = "Send Order";
    
    /**
     * module label (short title)
     *
     * @var string
     */
    protected $_SCRIPT_LABEL = "send_order";
    
    protected $_SCRIPT_VERSION = "";
    
    
    
    protected $display_objects_type_id = 2;
    protected $display_objects_type = "SCRIPT";
    protected $display_objects_id = 374;
    
    protected $smary;
    protected $con;
    
    public $alerts;
    PRIVATE $ORDER_ID;
    
    public $NAME;
    public $EMAIL;
    public $PHONE;
    public $ADDRESS_DETAILS;
    public $CLIENT_ADDRESS;
    
    function __construct() {
        parent::__construct();
        
        $this->tpl = "send_order.tpl";        
        $this->smarty = $globals->sm;
        $this->con = $globals->con;
        $this->alerts = new alerts();
     
        // phpapps_display_abs Load all elelments
        session_start();
        $this->load_elements(); // parent function
        
        if($_POST["pact"] == "trimite comanda"){
                
            
            
                $client_id = isset($_SESSION["_CLIENT_ID"]) ? $_SESSION["_CLIENT_ID"] : 0;
                $session_id = session_id() . microtime(TRUE);
                
                $this->EMAIL = trim($_POST["EMAIL"]);
                $this->NAME = trim($_POST["NAME"]);
                $this->PHONE = trim($_POST["PHONE"]);
                $this->ADDRESS_DETAILS = trim($_POST["ADDRESS_DETAILS"]);
                
                 
                
                if(filter_var($this->EMAIL, FILTER_VALIDATE_EMAIL)===false){
                        $this->alerts->add_alert("danger","Adresa de email este invalida!");
                    
                }else{
                    
                }
                
                if($this->NAME == ""){
                    $this->alerts->add_alert("danger","Numele este obligatoriu!");
                    
                }else{
                    
                }
                
                if($this->PHONE == ""){
                    $this->alerts->add_alert("danger","Numarul de telefon este obligatoriu!");
                    
                }else{
                    
                }
                
                if($this->ADDRESS_DETAILS == ""){
                    $this->alerts->add_alert("danger","Adresa de livrare este obligatorie!");
                    
                }else{
                    
                }
                
                if(!is_array($_SESSION["_CLIENT_CART"])){
                    $this->alerts->add_alert("danger","Nu aveti produse in cos!!");
                    
                }else{
                    
                }
                
                
                
                if($this->alerts->get_no_errors() == 0){
                    
                    $this->CLIENT_ADDRESS = "<b>" . $this->NAME . "</b> (" . $this->EMAIL ." | "  . $this->PHONE .") <br> " . $this->ADDRESS_DETAILS;
                    
                    $this->query = new DB_query("INSERT INTO {$this->globals->CURRENT_APP_DB}.orders (CLIENT_ID, SESSION_ID,CLIENT_ADDRESS) "
                    . "    VALUES (:client_id,:session_id,:client_address)",
                            array(":client_id" => $client_id,":session_id" => $session_id,"client_address"=>$this->CLIENT_ADDRESS));
                   //echo $this->query->prnt() . "<br>";
                    
                       if( $this->globals->con->query($this->query) == -1){
                               $this->alerts->add_alert("danger",$this->globals->con->get_error());
                           }else{
                              $this->query = new DB_query("SELECT ID FROM {$this->globals->CURRENT_APP_DB}.orders"
                              . "   WHERE CLIENT_ID = :client_id AND SESSION_ID = :session_id"
                                      . " ORDER BY ORDER_DATE DESC",
                                      array(":client_id" => $client_id, ":session_id"=>$session_id));
                              
                      //echo $this->query->prnt() . "<br>";          
                               $this->globals->con->query($this->query,"ORDER_ID");
                               $res = $this->globals->con->fetch_array("ORDER_ID");
                               $this->ORDER_ID = $res["ID"];


                               foreach($_SESSION["_CLIENT_CART"] as $key=>$value){
                                   $this->query = new DB_query("INSERT INTO {$this->globals->CURRENT_APP_DB}.order_details "
                                   . "(ORDER_ID,PRODUCT_ID,AMOUNT) VALUES(:order_id,:product_id,:amount)",
                                           array(":order_id"=>$this->ORDER_ID,":product_id" => $key, ":amount"=>$value ));
                                   //echo $this->query->prnt() . "<br>";
                                    if( $this->globals->con->query($this->query) == -1){
                                        $this->alerts->add_alert("danger",$this->globals->con->get_error());
                                    }else{
                                       $no_error = true;
                                    }
                               }
                               
                              if($this->alerts->get_no_errors() == 0){
                                        $this->alerts->add_alert("success","Commanda salvata cu succes");
                                        //clear seesion
                                        unset($_SESSION["_CLIENT_CART"]);
                               }
                               
                           }
                }
                
                                    
        
        
        
                               }
        
        $this->setup_display();
        $this->display_template(); // parent function

    }
    
    function setup_display() {
        
        if(isset($_SESSION["_CLIENT_ID"])){
           // $_SESSION["_CLIENT_ID"] = 0;
            //header("Location:client_login.php");
        
        
        //print_r($_SESSION["_CLIENT_CART"]);
        
        
        $this->query = new DB_query( "SELECT 
					ID,
					NAME,
					ADDRESS_DETAILS,
					PHONE,
                                        EMAIL
				FROM {$this->globals->CURRENT_APP_DB}.view_clients 
				WHERE ID = :client_id ",
				array(":client_id" => $_SESSION["_CLIENT_ID"]));
                                
			$this->globals->con->query($this->query);
			$this->globals->con->next();
                        
                        $this->CLIENT_ID = stripslashes($this->globals->con->get_field("ID"));
                        $this->NAME = stripslashes($this->globals->con->get_field("NAME"));
                        $this->ADDRESS_DETAILS = stripslashes($this->globals->con->get_field("ADDRESS_DETAILS"));
                        $this->PHONE = stripslashes($this->globals->con->get_field("PHONE"));
                        $this->EMAIL = stripslashes($this->globals->con->get_field("EMAIL"));
        }          
        
        
                        $this->globals->sm->assign(array("NAME" => $this->NAME,
                                                        "ADDRESS_DETAILS" => $this->ADDRESS_DETAILS,
                                                        "PHONE" => $this->PHONE,
                                                        "EMAIL" => $this->EMAIL,
                            ));
        
        
        
         if(is_array($_SESSION["_CLIENT_CART"]) > 0){
            $query  = new DB_query("SELECT ID, PRODUCT_TITLE, CURRENCY, DESCRIPTION, PRICE, IMG FROM {$this->globals->CURRENT_APP_DB}.view_products WHERE ID IN (" .implode(",",array_keys($_SESSION["_CLIENT_CART"])) .")");
            $this->globals->con->query($query,"cart_disp");
            while($res = $this->globals->con->fetch_array("cart_disp")){
                $CART_PRODUCT_NAME[$res["ID"]] = $res["PRODUCT_TITLE"];
                $IMGS[$res["ID"]] = $res["IMG"];
                $CART_PRICE_NAME[$res["ID"]] = $res["PRICE"];
                $CURRENCY = $res["CURRENCY"];
                $CART_PRODUCT_VALUES[$res["ID"]] = $res["PRICE"] * $_SESSION["_CLIENT_CART"][$res["ID"]];
            }
        }
       
       
          $this->globals->sm->assign(array("CART_ITEMS" => $_SESSION["_CLIENT_CART"],
                                          "CART_PRODUCT_NAME" => $CART_PRODUCT_NAME,
                                          "CART_PRICE_NAME" => $CART_PRICE_NAME,
                                          "IMGS" => $IMGS,
                                          "CURRENCY" => $CURRENCY,
                                          "TOTAL_CART_VALUE" => is_array($CART_PRODUCT_VALUES) ? array_sum($CART_PRODUCT_VALUES) : 0,
                                        ));
        
        
       // print_r($this->alerts);
        $this->globals->sm->assign(array("message_block" => $this->alerts->get_message_str()));
    }
    
}

new send_order_generated();
?>