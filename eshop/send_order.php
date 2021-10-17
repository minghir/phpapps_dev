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
              if(isset($_SESSION["_CLIENT_ID"])){
                 $this->query = new DB_query("INSERT INTO {$this->globals->CURRENT_APP_DB}.orders (CLIENT_ID) VALUES (:client_id)",array(":client_id" => $_SESSION["_CLIENT_ID"]));
                 
                    if( $this->globals->con->query($this->query) == -1){
                            $this->alerts->add_alert("danger",$this->globals->con->get_error());
                        }else{
                           $this->query = new DB_query("SELECT ID FROM {$this->globals->CURRENT_APP_DB}.orders"
                           . "   WHERE CLIENT_ID = :client_id "
                                   . "ORDER BY ORDER_DATE DESC",
                                   array(":client_id" => $_SESSION["_CLIENT_ID"]));
                            
                            $this->globals->con->query($this->query,"ORDER_ID");
                            $res = $this->globals->con->fetch_array("ORDER_ID");
                            $this->ORDER_ID = $res["ID"];
                            
                            $no_error = false;
                            
                            foreach($_SESSION["_CLIENT_CART"] as $key=>$value){
                                $this->query = new DB_query("INSERT INTO {$this->globals->CURRENT_APP_DB}.order_details "
                                . "(ORDER_ID,PRODUCT_ID,AMOUNT) VALUES(:order_id,:product_id,:amount)",
                                        array(":order_id"=>$this->ORDER_ID,":product_id" => $key, ":amount"=>$value ));
                                 if( $this->globals->con->query($this->query) == -1){
                                     $this->alerts->add_alert("danger",$this->globals->con->get_error());
                                 }else{
                                    $no_error = true;
                                 }
                            }
                            if($no_error){
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
        
        if(!isset($_SESSION["_CLIENT_ID"])){
            header("Location:client_login.php");
        }
        
        //print_r($_SESSION["_CLIENT_CART"]);
        
        
        $this->query = new DB_query( "SELECT 
					ID,
					NAME,
					COUNTY,
					CITY,
					POSTAL_CODE,
					ADDRESS_DETAILS,
					PHONE
				FROM {$this->globals->CURRENT_APP_DB}.view_clients 
				WHERE ID = :client_id ",
				array(":client_id" => $_SESSION["_CLIENT_ID"]));
                                
			$this->globals->con->query($this->query);
			$this->globals->con->next();
                        
                        $CLIENT_ID = stripslashes($this->globals->con->get_field("ID"));
                        $CLIENT_NAME = stripslashes($this->globals->con->get_field("NAME"));
                        $COUNTY = stripslashes($this->globals->con->get_field("COUNTY"));
                        $CITY = stripslashes($this->globals->con->get_field("CITY"));
                        $POSTAL_CODE = stripslashes($this->globals->con->get_field("POSTAL_CODE"));
                        $ADDRESS_DETAILS = stripslashes($this->globals->con->get_field("ADDRESS_DETAILS"));
                        $PHONE = stripslashes($this->globals->con->get_field("PHONE"));
                        
                        $this->globals->sm->assign(array("CLIENT_NAME" => $CLIENT_NAME,
                                                        "COUNTY" => $COUNTY,
                                                        "CITY" => $CITY,
                                                        "POSTAL_CODE" => $POSTAL_CODE,
                                                        "ADDRESS_DETAILS" => $ADDRESS_DETAILS,
                                                        "PHONE" => $PHONE
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
        
        
        
        $this->globals->sm->assign(array("message_block" => $this->alerts->get_message_str()));
    }
    
}

new send_order_generated();
?>