<?php
/**
* script template version 
*/
namespace wabdo;
require_once ("globals.php");
include ("generated_php/phpapps_designer_menu_items_form_generated.php");
	class phpapps_designer_menu_items_form  extends phpapps_designer_menu_items_form_generated{
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
                    protected $_MODULE_ID = 21;

                    /**
                     * module name as db identifier
                     *
                     * @var int
                     */
                    protected $_MODULE_NAME = "phpapps_designer";

                    /**
                     * module long title
                     *
                     * @var string
                     */
                    protected $_MODULE_TITLE = "designer";

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
                    protected $_SCRIPT_NAME = "phpapps_designer_menu_items_form";

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
        
        
                        //public $script_id = 351;
                        public $display_objects_type_id = '2';
                        public $display_objects_type = 'SCRIPT';
                        public $display_objects_id = 351;
                        
                        protected $smary;
                        protected $con;
                
		function __construct(){
			parent::__construct();
                        
                        
                        $this->tpl = "phpapps_designer_menu_items_form.tpl";
                        $this->display_objects_id = $this->script_id;
                        
                        $this->MENU_ID = $_GET["menu_id"];
                        
                        $this->load_elements(); // parent function: class template
                        $this->init(); // parent function: class phpapps_designer_menu_items_form 
			$this->display();// parent function: class phpapps_designer_menu_items_form 
                        
		}
		
		function before_get_rec(){
		}
		
		function after_get_rec(){
		}
                
                function before_post_actions(){
                }
	
		function before_add_rec(){
                    if($this->PID == ''){
                        $this->PID = '0';
                    }
		}
		
		function after_add_rec(){
			//header("Location:win_close.html");
		}
		
		function before_save_rec(){
                    if($this->PID == ''){
                        $this->PID = '0';
                    }
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
                    $this->PID_sel->db_query = new DB_query("SELECT ID AS VALUE, LABEL FROM phpapps.menu_items WHERE MENU_ID = :menu_id ORDER BY ID",array(":menu_id"=>$this->MENU_ID));
                    $this->PID_sel->setup_select_options();
		}
		
		function after_display(){	
		}
		
	};
	
	$phpapps_designer_menu_items_form_Impl = new phpapps_designer_menu_items_form();
?>