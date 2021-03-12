<?php
/**
* script template version 
*/
namespace wabdo;
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class test_f_el_generated extends template{

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
    protected $_APP_NAME = "phpapps";
    
    /**
     * application long title
     *
     * @var string
     */
    protected $_APP_TITLE = "PHP Applications";
    
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
    protected $_MODULE_ID = 27;
    
    /**
     * module name as db identifier
     *
     * @var int
     */
    protected $_MODULE_NAME = "test_app";
    
    /**
     * module long title
     *
     * @var string
     */
    protected $_MODULE_TITLE = "tests";
    
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
    protected $_SCRIPT_NAME = "test_f_el";
    
    /**
     * script long title
     *
     * @var string
     */
    protected $_SCRIPT_TITLE = "aa";
    
    /**
     * module label (short title)
     *
     * @var string
     */
    protected $_SCRIPT_LABEL = "aa";
    
    protected $_SCRIPT_VERSION = "";
    
    
    
    protected $display_objects_type_id = 2;
    protected $display_objects_type = "SCRIPT";
    protected $display_objects_id = 375;
    
    protected $smary;
    protected $con;
        
    function __construct() {
        parent::__construct();
        
        $this->tpl = "test_f_el.tpl";        
        $this->smarty = $globals->sm;
        $this->con = $globals->con;
     
        // phpapps_display_abs Load all elelments
        $this->load_elements(); // parent function
        $this->setup_display();
        $this->display_template(); // parent function

    }
    
    function setup_display() {
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "test_f_el: Youre code here."));
    }
    
}

new test_f_el_generated();
?>