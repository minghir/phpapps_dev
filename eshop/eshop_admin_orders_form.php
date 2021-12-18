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
                        private $orders_table;
                
		function __construct(){
			parent::__construct();
                        
                        
                        $this->tpl = "eshop_admin_orders_form.tpl";
                        //$this->display_objects_id = $this->script_id;
                        
                        
                        $this->orders_table = new DB_table("{$this->globals->CURRENT_APP_DB}.view_orders");
                        
                        $this->load_elements(); // parent function: class template
                        $this->init(); // parent function: class eshop_admin_orders_form 
			$this->display();// parent function: class eshop_admin_orders_form 
                        
		}
		
		function before_get_rec(){
                    /*
                    $query = new DB_query("SELECT * FROM view_orders WHERE ID = :id",array(":id"=>$this->ID));
                     if($this->globals->con->query($query) == 1){
                            
                        }
                     *
                     */
                    
                    
                     
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
                   // echo "AICI:" . $this->ID;
                     $order_details = new DB_table("{$this->globals->CURRENT_APP_DB}.view_order_details");
                    //print_r($order_details->getFieldsArrays(array("PRODUCT_TITLE","PRICE"),"ORDER_ID",$this->ID));
                    $this->smarty->assign(array("CLIENT_ADDRESS"=>$this->orders_table->getValue("CLIENT", $this->ID),
                                                "ORDER_TOTAL"=>$this->orders_table->getValue("TOTAL", $this->ID),
                                                "ORDER_DATE"=>$this->orders_table->getValue("DATA", $this->ID),
                                                "ORDER_ID"=>$this->ID,
                                                "products"=>$order_details->getFieldsArrays(array("PRODUCT_TITLE","AMOUNT","PRICE"),"ORDER_ID",$this->ID)));
		}
		
		function after_display(){	
		}
		
	};
	
	$eshop_admin_orders_form_Impl = new eshop_admin_orders_form();
?>