<?php
/**
* script template version 
*/
namespace wabdo;
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class export_database_generated extends template{

    /**
     * application database id
     *
     * @var int
     */
    protected $_APP_ID = 1;
    
    /**
     * application name as unique identifier
     *
     * @var string
     */
    protected $_APP_NAME = "";
    
    /**
     * application long title
     *
     * @var string
     */
    protected $_APP_TITLE = "";
    
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
    protected $_MODULE_ID = 18;
    
    /**
     * module name as db identifier
     *
     * @var int
     */
    protected $_MODULE_NAME = "";
    
    /**
     * module long title
     *
     * @var string
     */
    protected $_MODULE_TITLE = "";
    
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
    protected $_SCRIPT_NAME = "";
    
    /**
     * script long title
     *
     * @var string
     */
    protected $_SCRIPT_TITLE = "";
    
    /**
     * module label (short title)
     *
     * @var string
     */
    protected $_SCRIPT_LABEL = "";
    
    protected $_SCRIPT_VERSION = "";
    
    
    
    protected $display_objects_type_id = 2;
    protected $display_objects_type = "SCRIPT";
    //protected $display_objects_id = ;
    
    protected $smary;
    protected $con;
        
    function __construct() {
        parent::__construct();
        
        $this->tpl = "export_database.tpl";        
        $this->smarty = $globals->sm;
        $this->con = $globals->con;
     
        // phpapps_display_abs Load all elelments
        $this->load_elements(); // parent function
        $this->setup_display();
        $this->display_template(); // parent function

    }
    
    function setup_display() {
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "export_database: Youre code here."));
    }
    
}

new export_database_generated();
?>