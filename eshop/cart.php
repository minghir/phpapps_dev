<?php
/**
* script template version 
*/
namespace wabdo;
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");


class cart_element{
    public $product_id;
    public $amount;
    
    
    function __construct($prod_id,$amnt) {
        $this->product_id = $prod_id;
        $this->amount = $amnt;
    }
    
}


class cart{
    public $cart_array = array();
    
    function __construct($cart_element) {
        $this->cart_array[] = $cart_element;
    }
}


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
            case "view":
            break;
        }
        
        
       
        
        
        //print_r($_SESSION);
        print_r($_SESSION["_CLIENT_CART"]);
       // print_r($cart_products);
        $this->setup_display();
        $this->display_template(); // parent function

    }
    
    function setup_display() {
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "cart: Youre code here."));
    }
    
}

new cart_generated();
?>