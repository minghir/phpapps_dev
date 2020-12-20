<?php
/**
* script template version 
*/
namespace wabdo;
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");


class cart_generated extends template{

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
    protected $_SCRIPT_NAME = "cart";
    
    /**
     * script long title
     *
     * @var string
     */
    protected $_SCRIPT_TITLE = "Shop cart";
    
    /**
     * module label (short title)
     *
     * @var string
     */
    protected $_SCRIPT_LABEL = "shop_cart";
    
    protected $_SCRIPT_VERSION = "";
    
    
    
    protected $display_objects_type_id = 2;
    protected $display_objects_type = "SCRIPT";
    protected $display_objects_id = 361;
    
    protected $smary;
    protected $con;
    protected $cart_array = array();
        
    function __construct() {
        parent::__construct();
        
        //session_start();
        
        $this->tpl = "cart.tpl";        
        $this->smarty = $globals->sm;
        $this->con = $globals->con;
     
        // phpapps_display_abs Load all elelments
        $this->load_elements(); // parent function
        
        switch($_GET["gact"]){
            case "add":
                session_start();
                echo "AICIIIII<br><br>";
                if(!is_array($_SESSION["_CLIENT_CART"])){
                   $_SESSION["_CLIENT_CART"] = array();
                }

                //$tmp_cart_element =serialize( new cart_element($_GET["gfield_value"],1) );
               if(!array_key_exists( $_GET["gfield_value"], $_SESSION["_CLIENT_CART"])){
                    $_SESSION["_CLIENT_CART"][$_GET["gfield_value"]] = 1;
               }else{
               }

            break;
            case "del":
                unset( $_SESSION["_CLIENT_CART"][$_GET["gfield_del_value"]]);
            break;
        }
        
        switch($_POST["pact"]){
            case "actualizeaza cos":
               $_SESSION["_CLIENT_CART"] = $_POST["cart_items"];
            break;
            case "goleste cos":
                unset( $_SESSION["_CLIENT_CART"]);
            break;
        }
        
         //print_r($_POST["cart_items"]);

        
        
        //print_r($_SESSION);
        if(is_array($_SESSION["_CLIENT_CART"]) > 0){
            $query  = new DB_query("SELECT ID, PRODUCT_TITLE, CURRENCY, DESCRIPTION, PRICE FROM {$this->globals->CURRENT_APP_DB}.view_products WHERE ID IN (" .implode(",",array_keys($_SESSION["_CLIENT_CART"])) .")");
            $this->globals->con->query($query,"cart_disp");
            while($res = $this->globals->con->fetch_array("cart_disp")){
                $CART_PRODUCT_NAME[$res["ID"]] = $res["PRODUCT_TITLE"];
                $CART_PRICE_NAME[$res["ID"]] = $res["PRICE"];
                $CURRENCY = $res["CURRENCY"];
                $CART_PRODUCT_VALUES[$res["ID"]] = $res["PRICE"] * $_SESSION["_CLIENT_CART"][$res["ID"]];
            }
        }
       
       
          $this->globals->sm->assign(array("CART_ITEMS" => $_SESSION["_CLIENT_CART"],
                                          "CART_PRODUCT_NAME" => $CART_PRODUCT_NAME,
                                          "CART_PRICE_NAME" => $CART_PRICE_NAME,
                                          "CURRENCY" => $CURRENCY,
                                          "TOTAL_CART_VALUE" => is_array($CART_PRODUCT_VALUES) ? array_sum($CART_PRODUCT_VALUES) : 0,
                                        ));
       
        print_r($CART_PRODUCT_NAME);
       
        $this->setup_display();
        $this->display_template(); // parent function

    }
    
    function setup_display() {
     
    }
    
}

new cart_generated();
?>