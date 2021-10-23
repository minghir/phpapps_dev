<?php
/**
* script template version 
*/
namespace wabdo;
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class products_search_generated extends template{

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
    protected $_SCRIPT_NAME = "products_search";
    
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
    protected $display_objects_id = 357;
    
    protected $smary;
    protected $con;
    
    public $eshop_search;
        
    function __construct() {
        parent::__construct();
        session_start();
        $this->tpl = "products_search.tpl";        
        $this->smarty = $globals->sm;
        $this->con = $globals->con;
        
        if(isset($_POST["eshop_search"])){
            
            $this->eshop_search = htmlspecialchars(addslashes(trim($_POST["eshop_search"])));
            
        }else{
            $this->eshop_search = "";
            
           // $this->eshop_search = $_SESSION["_eshop_search"];
        }
        //$_SESSION["_eshop_search"] = $this->eshop_search;
        
         $this->load_elements(); // parent function
     
        if ($this->eshop_search == "" ){
            $this->template_elements["grids"]["ESHOP_SEARCH_PRODUCTS_GRID"]->mode_search = true; 
            $this->template_elements["grids"]["ESHOP_SEARCH_PRODUCTS_GRID"]->grid_title = "Am gasit 0 ";
            $this->template_elements["grids"]["ESHOP_SEARCH_PRODUCTS_GRID"]->table="DUAL";
        }else{
            $this->template_elements["grids"]["ESHOP_SEARCH_PRODUCTS_GRID"]->mode_search = true; 
            $this->template_elements["grids"]["ESHOP_SEARCH_PRODUCTS_GRID"]->grid_title = "Am gasit ";
            $this->template_elements["grids"]["ESHOP_SEARCH_PRODUCTS_GRID"]->table="{$this->globals->CURRENT_APP_DB}.view_products";
        }
        
         $this->template_elements["grids"]["ESHOP_SEARCH_PRODUCTS_GRID"]->editable=false;
         $this->template_elements["grids"]["ESHOP_SEARCH_PRODUCTS_GRID"]->rows_on_pg=10;
         $this->template_elements["grids"]["ESHOP_SEARCH_PRODUCTS_GRID"]->where_rules = array(" PRODUCT_TITLE like :search ");
         $this->template_elements["grids"]["ESHOP_SEARCH_PRODUCTS_GRID"]->where_params = array(":search" => '%'.$this->eshop_search.'%');
        
        
        
        // phpapps_display_abs Load all elelments
       
        $this->setup_display();
        
        $this->display_template(); // parent function
       // $this->template_elements["grids"]["ESHOP_SEARCH_PRODUCTS_GRID"]->reset_session_vars(); 
    }
    
    function setup_display() {
        $this->globals->sm->assign(array("eshop_search" => $this->eshop_search));
    }
    
}

new products_search_generated();
?>