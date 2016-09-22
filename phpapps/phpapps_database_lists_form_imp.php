<?php
require_once ("globals.php");
include ("gen_php/phpapps_database_lists_form.php");
	class phpapps_database_lists_form_imp  extends phpapps_database_lists_form{
                
                public $MODULE_ID;
		public $SCHEMA_NAME;
		public $TABLE_ID;
                private $table_definition;
                
		function __construct(){
			parent::__construct();
			$this->template = "phpapps_database_lists_form_imp.tpl";
                        
                        $this->MODULE_ID = $_GET["module_id"];
                        
                        $this->TABLE_TYPE = (new DB_list("list_table_types"))->getID("list_table");
                        
			$this->init();
                        
                        if($this->gact == "dropList"){
				$this->dropList();
			}
                        
			$this->display();
		}
		
                function dropList(){
                        $sql = new DB_query( "SELECT TABLE_NAME, TABLE_SCHEMA
			FROM phpapps.view_tables 
			WHERE ".$this->gfield." = :".$this->gfield, 
			array(":".$this->gfield => $this->gfield_value));
                        $res_rows = $this->globals->con->query( $sql );

                        if( $res_rows == -1 ){
                            $this->errors[] = "ERROR:" . $this->globals->con->get_error();
                        }else{
                            $this->globals->con->next();
                            $this->SCHEMA_NAME = $this->globals->con->get_field("TABLE_SCHEMA");
                            $this->TABLE_NAME = $this->globals->con->get_field("TABLE_NAME");
                            
                            $sql = new DB_query( "SELECT TABLE_NAME, TABLE_SCHEMA, MODULE_NAME
                            FROM phpapps.view_tables 
                            WHERE TABLE_NAME = :tbl AND TABLE_SCHEMA = :scm",
                            array(":tbl" => $this->TABLE_NAME,
                                ":scm" => $this->SCHEMA_NAME));
                            
                            $res_rows = $this->globals->con->query( $sql );
                            if( $res_rows > 1){
                                $this->errors[] = "ERROR: LISTA FOLSITA IN ALTE MODULE";
                            }
                        }
                        
			$sql = new DB_query( "DROP TABLE ". $this->TABLE_SCHEMA . "." . $this->TABLE_NAME);
			if(count($this->errors) == 0){
                            if( $this->globals->con->query($sql) == -1 ){
                            	$this->errors[] = "SQL error: (".$sql->sql().")" . $this->globals->con->get_error();	
                            }else{
				$this->deleteRec();
                            }
                        }
                }
                
		function beforeGetRec(){
		}
		
		function afterGetRec(){
		}
	
		function beforeAddRec(){
                       $sql = new DB_query("SELECT SCHEMA_NAME, MODULE_SCHEMA FROM view_modules WHERE ID = :module_id",array(":module_id"=>$this->MODULE_ID));
			if( $this->globals->con->query($sql) == -1 ){
				$this->errors[] = "SQL error: (".$sql->sql().")" . $this->globals->con->get_error();	
			}else{
				$this->globals->con->next();
				$this->SCHEMA_ID = $this->globals->con->get_field("MODULE_SCHEMA");
				$this->SCHEMA_NAME = $this->globals->con->get_field("SCHEMA_NAME");
			}
			$this->table_definition = new DB_table_def($this->SCHEMA_NAME,$this->TABLE_NAME);
			$this->table_definition->add_column_def(
				"ID",
				(new DB_list("list_mysql_column_types"))->getID("BIGINT"),
				"20",
				"",
				"",
				(new DB_list("list_index_types"))->getID("PRIMARY")
				);
                        
                        $this->table_definition->add_column_def(
				"VALUE",
				(new DB_list("list_mysql_column_types"))->getID("VARCHAR"),
				"255",
				"",
				"",
				""
				);
                        
                        $this->table_definition->add_column_def(
				"DESCRIPTION",
				(new DB_list("list_mysql_column_types"))->getID("TEXT"),
				"",
				"",
				"",
				(new DB_list("list_index_types"))->getID("NONE")
				);
                        
                        $this->table_definition->auditable = false;
			 $sql = new DB_query($this->table_definition->get_create_str());
			 if( $this->globals->con->query($sql) == -1 ){
				$this->errors[] = "SQL error: (".$sql->sql().")" . $this->globals->con->get_error();
			 }
		}
		
		function afterAddRec(){
                        print_r($this->errors);
                        exit();
			//header("Location:win_close.html");
		}
		
		function beforeSaveRec(){
		}
		
		function afterSaveRec(){
			//header("Location:win_close.html");
		}

		function beforeDeleteRec(){
                    $sql = new DB_query( "SELECT TABLE_NAME, TABLE_SCHEMA, MODULE_NAME
                            FROM phpapps.view_tables 
                            WHERE TABLE_NAME = :tbl AND TABLE_SCHEMA = :scm",
                            array(":tbl" => $this->TABLE_NAME,
                                ":scm" => $this->SCHEMA_NAME));
print_r($sql);                            
                    $res_rows = $this->globals->con->query( $sql );
                    if( $res_rows == 1){
                        $this->dropList();
                    }
		}
		
		function afterDeleteRec(){
                    

                    //header("Location:win_close.html");
		}
		
		function beforeDisplay(){	
		}
		
		function afterDisplay(){	
		}
		
	};
	
	$phpapps_database_lists_form_Imp = new phpapps_database_lists_form_imp();
?>