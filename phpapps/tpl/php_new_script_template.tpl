<?php
/**
* script template version {$SCRIPT_VERSION}
*/
namespace wabdo;
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class {$CLASS_NAME}_generated extends template{ldelim}

    /**
     * application database id
     *
     * @var int
     */
    protected $_APP_ID = {$APP_ID};
    
    /**
     * application name as unique identifier
     *
     * @var string
     */
    protected $_APP_NAME = "{$APP_NAME}";
    
    /**
     * application long title
     *
     * @var string
     */
    protected $_APP_TITLE = "{$APP_TITLE}";
    
    /**
     * application label (short title)
     *
     * @var string
     */
    protected $_APP_LABEL = "{$APP_LABEL}";
    
    /**
     * module id
     *
     * @var int
     */
    protected $_MODULE_ID = {$MODULE_ID};
    
    /**
     * module name as db identifier
     *
     * @var int
     */
    protected $_MODULE_NAME = "{$MODULE_NAME}";
    
    /**
     * module long title
     *
     * @var string
     */
    protected $_MODULE_TITLE = "{$MODULE_TITLE}";
    
    /**
     * module label (short title)
     *
     * @var string
     */
    protected $_MODULE_LABEL = "{$MODULE_LABEL}";
    
    /**
     * script name as db identifier
     *
     * @var string
     */
    protected $_SCRIPT_NAME = "{$SCRIPT_NAME}";
    
    /**
     * script long title
     *
     * @var string
     */
    protected $_SCRIPT_TITLE = "{$SCRIPT_TITLE}";
    
    /**
     * module label (short title)
     *
     * @var string
     */
    protected $_SCRIPT_LABEL = "{$SCRIPT_LABEL}";
    
    protected $_SCRIPT_VERSION = "{$SCRIPT_VERSION}";
    
    
    
    protected $display_objects_type_id = 2;
    protected $display_objects_type = "SCRIPT";
    protected $display_objects_id = {$SCRIPT_ID};
    
    protected $smary;
    protected $con;
        
    function __construct() {ldelim}
        parent::__construct();
        
        $this->tpl = "{$CLASS_NAME}.tpl";        
        $this->smarty = $globals->sm;
        $this->con = $globals->con;
     
        // phpapps_display_abs Load all elelments
        $this->load_elements(); // parent function
        $this->setup_display();
        $this->display_template(); // parent function

    {rdelim}
    
    function setup_display() {ldelim}
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "{$CLASS_NAME}: Youre code here."));
    {rdelim}
    
{rdelim}

new {$CLASS_NAME}();
?>