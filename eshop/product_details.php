<?php
/**
* script template version 
*/
namespace wabdo;
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class product_details_generated extends template{

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
    protected $_SCRIPT_NAME = "product_details";
    
    /**
     * script long title
     *
     * @var string
     */
    protected $_SCRIPT_TITLE = "Product Details";
    
    /**
     * module label (short title)
     *
     * @var string
     */
    protected $_SCRIPT_LABEL = "product_details";
    
    protected $_SCRIPT_VERSION = "";
    
    
    
    protected $display_objects_type_id = 2;
    protected $display_objects_type = "SCRIPT";
    protected $display_objects_id = 348;
    
    protected $smary;
    protected $con;
    
    protected $product_id;
        
    function __construct() {
        parent::__construct();
        
        $this->tpl = "eshop_product_details_template.tpl";
        $this->smarty = $globals->sm;
        $this->con = $globals->con;
        
        $this->product_id = $_GET["gfield_value"];
     
        // phpapps_display_abs Load all elelments
        $this->load_elements(); // parent function
        $this->setup_display();
        $this->display_template(); // parent function

    }
    
    function setup_display() {
        $prod_table = new DB_table("{$this->globals->CURRENT_APP_DB}.view_products");
        $img_table =  new DB_table("{$this->globals->CURRENT_APP_DB}.product_images");
        
        //print_r($img_table->getColumnArray("IMG_FILE_NAME","PRODUCT_ID",2));
        
        $this->globals->sm->assign(array(
                "PRODUCT_ARRAY" => $prod_table->getLineArray("ID",$this->product_id),
                "PRODUCT_IMAGES" => $img_table->getColumnArray("IMG_FILE_NAME","PRODUCT_ID",$this->product_id),
                ));
        
        }
    
}

new product_details_generated();
?>