<?php
require_once ("globals.php");
include ("gen_php/phpapps_database_list_form.php");
	class phpapps_database_list_form_impl  extends phpapps_database_list_form{
		function __construct(){
			parent::__construct();
                        echo "COPIL";
			$this->template = "phpapps_database_list_form_imp.tpl";
                        $this->form_table = $_GET["list_name"];
                        echo "<h1>" .$this->table ."</h1><br>";
                        $sql = new DB_query("SELECT TABLE_SCHEMA FROM phpapps.view_tables"
                                . " WHERE TABLE_NAME = :tbl_name AND ORIGIN_ID = '0'", array(":tbl_name"=>$this->table));
                        print_r($sql);
                        $this->globals->con->query($sql);	
                        $this->globals->con->next();
                        $this->schema = $this->globals->con->get_field("TABLE_SCHEMA");
                        //echo "AICI:" . $this->schema;
			$this->init();
			$this->display();
		}
		
		function beforeGetRec(){
		}
		
		function afterGetRec(){
		}
	
		function beforeAddRec(){
		}
		
		function afterAddRec(){
                        print_r($this->errors);
			//header("Location:win_close.html");
		}
		
		function beforeSaveRec(){
		}
		
		function afterSaveRec(){
                        
			header("Location:win_close.html");
		}

		function beforeDeleteRec(){
		}
		
		function afterDeleteRec(){
			header("Location:win_close.html");
		}
		
		function beforeDisplay(){	
		}
		
		function afterDisplay(){	
		}
		
	};
	
	$phpapps_database_list_form_Impl = new phpapps_database_list_form_impl();
?>