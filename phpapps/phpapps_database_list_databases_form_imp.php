<?php
require_once ("globals.php");
include ("gen_php/phpapps_database_list_databases_form.php");
	class phpapps_database_list_databases_form_impl  extends phpapps_database_list_databases_form{
                        public $script_id = 289;
                        public $display_objects_type_id = '2';
                        public $display_objects_type = 'SCRIPT';
                        public $display_objects_id = 289;
                
		function __construct(){
			parent::__construct();
                        
                        
                        $this->tpl = "phpapps_database_list_databases_form_imp.tpl";
                        $this->display_objects_id = $this->script_id;
                        
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
                    $sql = new DB_query("CREATE DATABASE ".$this->VALUE);
                    echo "AICI:" . $sql->prnt();
                    if($this->globals->con->query($sql) == -1){
                        echo $this->globals->con->get_error();
                        $this->errors[] = "CREATE DATABASE FAILD!!!";
                    }
		}
		
                function addRec() {
                    if(count($this->errors)==0){
                        parent::addRec();
                    }
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
                    print_r($this->errors);
		}
		
	};
	
	$phpapps_database_list_databases_form_Impl = new phpapps_database_list_databases_form_impl();
?>