<?php
namespace wabdo;
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class test_script extends template{

    /**
     * application database id
     *
     * @var int
     */
    protected $APP_ID = 1;
    
    /**
     * application name as unique identifier
     *
     * @var string
     */
    public $APP_NAME = "phpapps";
    
    /**
     * application long title
     *
     * @var string
     */
    public $APP_TITLE = "Builder for PHP Applications";
    
    /**
     * application label (short title)
     *
     * @var string
     */
    public $APP_LABEL = "builder";
    
    /**
     * module id
     *
     * @var int
     */
    protected $MODULE_ID = 14;
    
    /**
     * module name as db identifier
     *
     * @var int
     */
    public $MODULE_NAME = "phpapps_database";
    
    /**
     * module long title
     *
     * @var string
     */
    public $MODULE_TITLE = "database";
    
    /**
     * module label (short title)
     *
     * @var string
     */
    public $MODULE_LABEL = "DBS";
    
    /**
     * script name as db identifier
     *
     * @var string
     */
    protected $SCRIPT_NAME = "test_script";
    
    /**
     * script long title
     *
     * @var string
     */
    protected $SCRIPT_TITLE = "";
    
    /**
     * module label (short title)
     *
     * @var string
     */
    protected $SCRIPT_LABEL = "";
    
    
    protected $display_objects_type_id = 2;
    protected $display_objects_type = "SCRIPT";
    protected $display_objects_id = 315;
    protected $smary;
    protected $con;
        
    function __construct() {
        parent::__construct();
        
        $this->tpl = "test_script.tpl";        
        $this->smarty = $globals->sm;
        $this->con = $globals->con;
     
        // phpapps_display_abs Load all elelments
        $this->load_elements(); // parent function
        $this->setup_display();
        $this->display_template(); // parent function

    }
    
    function setup_display() {
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "test_script: Youre code here."));
    }
    
}

new test_script();
?>