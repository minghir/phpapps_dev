<?php
namespace wabdo;
require_once ("globals.php");
include ("gen_php/phpapps_database_list_form.php");
	class phpapps_database_list_form_impl  extends phpapps_database_list_form{
                        public $script_id = 294;
                        public $display_objects_type_id = '2';
                        public $display_objects_type = 'SCRIPT';
                        public $display_objects_id = 294;
                
		function __construct(){
			parent::__construct();
                        
                        
                        $this->tpl = "phpapps_database_list_form_imp.tpl";
                        $this->display_objects_id = $this->script_id;
            
                        $this->form_table = $_GET["list_name"];
                        echo "<h1>" .$this->table ."</h1><br>";
                        $sql = new DB_query("SELECT TABLE_SCHEMA FROM {$this->globals->PHPAPPS_DB}.view_tables"
                                . " WHERE TABLE_NAME = :tbl_name AND ORIGIN_ID = '0'", array(":tbl_name"=>$this->form_table));
                        echo $sql->prnt();
                        $this->globals->con->query($sql);	
                        $this->globals->con->next();
                        $this->schema = $this->globals->con->get_field("TABLE_SCHEMA");
                        $this->form_schema = $this->globals->con->get_field("TABLE_SCHEMA");
                        //echo "AICI:" . $this->schema;            
						
                        $this->init();
                        $this->load_elements(); // parent function
			$this->display();
                        
		}
		
		function beforeGetRec(){
		}
		
		function afterGetRec(){
		}
                
                function beforePostActions(){
                }
	
		function beforeAddRec(){
		}
		
		function afterAddRec(){
			//header("Location:win_close.html");
		}
		
		function beforeSaveRec(){
		}
		
		function afterSaveRec(){
			//header("Location:win_close.html");
		}

		function beforeDeleteRec(){
		}
		
		function afterDeleteRec(){
		//	header("Location:win_close.html");
		}
		
                function afterPostActions(){
                }
                
		function beforeDisplay(){	
		}
		
		function afterDisplay(){	
		}
		
	};
	
	$phpapps_database_list_form_Impl = new phpapps_database_list_form_impl();
?>