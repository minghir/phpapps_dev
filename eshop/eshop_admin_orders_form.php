<?php
/**
* script template version 
*/
namespace wabdo;
require_once ("globals.php");
include ("generated_php/eshop_admin_orders_form_generated.php");
	class eshop_admin_orders_form  extends eshop_admin_orders_form_generated{
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
                    protected $_MODULE_ID = 10;

                    /**
                     * module name as db identifier
                     *
                     * @var int
                     */
                    protected $_MODULE_NAME = "eshop_admin";

                    /**
                     * module long title
                     *
                     * @var string
                     */
                    protected $_MODULE_TITLE = "admin";

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
                    protected $_SCRIPT_NAME = "eshop_admin_orders_form";

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
        
        
                        //public $script_id = 376;
                        public $display_objects_type_id = '2';
                        public $display_objects_type = 'SCRIPT';
                        public $display_objects_id = 376;
                        
                        protected $smary;
                        protected $con;
                
		function __construct(){
			parent::__construct();
                        
                        
                        $this->tpl = "eshop_admin_orders_form.tpl";
                        //$this->display_objects_id = $this->script_id;
                        
                        $this->load_elements(); // parent function: class template
                        $this->init(); // parent function: class eshop_admin_orders_form 
			$this->display();// parent function: class eshop_admin_orders_form 
                        
		}
		
		function before_get_rec(){
		}
		
		function after_get_rec(){
		}
                
                function before_post_actions(){
                }
	
		function before_add_rec(){
		}
		
		function after_add_rec(){
			//header("Location:win_close.html");
		}
		
		function before_save_rec(){
		}
		
		function after_save_rec(){
			//header("Location:win_close.html");
		}

		function before_delete_rec(){
		}
		
		function after_delete_rec(){
		//	header("Location:win_close.html");
		}
		
                function after_post_actions(){
                }
                
		function before_display(){	
		}
		
		function after_display(){	
		}
		
	};
	
	$eshop_admin_orders_form_Impl = new eshop_admin_orders_form();
?>