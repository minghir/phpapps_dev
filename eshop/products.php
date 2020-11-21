<?php
/**
* script template version 
*/
//namespace wabdo;
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");
require_once (DB_LIBS_DIR . "DB_table.php");

class products_generated extends wabdo\template{

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
    protected $_SCRIPT_NAME = "products";
    
    /**
     * script long title
     *
     * @var string
     */
    protected $_SCRIPT_TITLE = "Products";
    
    /**
     * module label (short title)
     *
     * @var string
     */
    protected $_SCRIPT_LABEL = "products";
    
    protected $_SCRIPT_VERSION = "";
    
    
    
    protected $display_objects_type_id = 2;
    protected $display_objects_type = "SCRIPT";
    protected $display_objects_id = 346;
    
    protected $smary;
    protected $con;
    
    public $category_id;
        
    function __construct() {
        parent::__construct();
        
        $this->tpl = "products.tpl";        
        $this->smarty = $globals->sm;
        $this->con = $globals->con;
     
        $this->category_id = $_GET["cat_id"] != "" ? $_GET["cat_id"] : -1;
        
        // phpapps_display_abs Load all elelments
        $this->load_elements(); // parent function
        
        
        $this->template_elements["grids"]["ESHOP_PRODUCTS_GRID"]->grid_title = wabdo\_tbl("eshop.categories","NAME",$this->category_id,"ID");
        $this->template_elements["grids"]["ESHOP_PRODUCTS_GRID"]->editable=false;
        $this->template_elements["grids"]["ESHOP_PRODUCTS_GRID"]->rows_on_pg=12;
        $this->template_elements["grids"]["ESHOP_PRODUCTS_GRID"]->table="eshop.view_products";
        
        
        if($this->category_id != -1  ){
            
            $this->template_elements["grids"]["ESHOP_PRODUCTS_GRID"]->where_rules = array(" CATEGORY_ID = :category_id ");
            $this->template_elements["grids"]["ESHOP_PRODUCTS_GRID"]->where_params = array(":category_id" => $this->category_id);
        }else{
            $this->template_elements["grids"]["ESHOP_PRODUCTS_GRID"]->grid_title = "PRODUSE";
            $this->template_elements["grids"]["ESHOP_PRODUCTS_GRID"]->where_rules = array();
            $this->template_elements["grids"]["ESHOP_PRODUCTS_GRID"]->where_params = array();
        }
        
        //echo "<br><BR><BR>ABC QUERY:" .  $this->template_elements["grids"]["ESHOP_PRODUCTS_GRID"]->prnt() ."<br><br>";
        
        $this->setup_display();
        $this->display_template(); // parent function

    }
    
    function setup_display() {
        
        //$this->globals->sm->assign(array("SCRIPT_CONTENT" => "products: Youre code here."));
    }
    
}

new products_generated();
?>