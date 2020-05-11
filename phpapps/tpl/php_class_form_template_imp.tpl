<?php
/**
* script template version {$SCRIPT_VERSION}
*/
namespace wabdo;
require_once ("globals.php");
include ("generated_php/{$form_name}_generated.php");
	class {$form_name}  extends {$form_name}_generated{ldelim}
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
                    protected $_SCRIPT_NAME = "{$form_name}";

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
        
        
                        //public $script_id = {$script_id};
                        public $display_objects_type_id = '2';
                        public $display_objects_type = 'SCRIPT';
                        public $display_objects_id = {$script_id};
                        
                        protected $smary;
                        protected $con;
                
		function __construct(){ldelim}
			parent::__construct();
                        
                        
                        $this->tpl = "{$form_name}.tpl";
                        $this->display_objects_id = $this->script_id;
                        
                        $this->load_elements(); // parent function: class template
                        $this->init(); // parent function: class {$form_name} 
			$this->display();// parent function: class {$form_name} 
                        
		{rdelim}
		
		function before_get_rec(){ldelim}
		{rdelim}
		
		function after_get_rec(){ldelim}
		{rdelim}
                
                function before_post_actions(){ldelim}
                {rdelim}
	
		function before_add_rec(){ldelim}
		{rdelim}
		
		function after_add_rec(){ldelim}
			//header("Location:win_close.html");
		{rdelim}
		
		function before_save_rec(){ldelim}
		{rdelim}
		
		function after_save_rec(){ldelim}
			//header("Location:win_close.html");
		{rdelim}

		function before_delete_rec(){ldelim}
		{rdelim}
		
		function after_delete_rec(){ldelim}
		//	header("Location:win_close.html");
		{rdelim}
		
                function after_post_actions(){ldelim}
                {rdelim}
                
		function before_display(){ldelim}	
		{rdelim}
		
		function after_display(){ldelim}	
		{rdelim}
		
	{rdelim};
	
	${$form_name}_Impl = new {$form_name}();
?>