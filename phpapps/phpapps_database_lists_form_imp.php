<?php
namespace wabdo;
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
			$this->display();
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
                                $this->ORIGIN_ID = "0";
			
                        }
                        
                        
                        if( count($this->errors) == 0 ){
                            $this->table_definition = new DB_table_def($this->SCHEMA_NAME,$this->TABLE_NAME);
                            if(!$this->table_definition->createIDTable()){
                                $this->errors[] = "SQL error: (".$sql->sql().")" . $this->table_definition->getErrors();
                            }elseif(!$this->table_definition->alterTblAddCol("VALUE",(new DB_list("list_mysql_column_types"))->getID("VARCHAR"),"255",FALSE)){
                                $this->errors[] = "SQL error: (".$sql->sql().")" . $this->table_definition->getErrors();
                            }elseif(!$this->table_definition->alterTblAddCol("DESCRIPTION",(new DB_list("list_mysql_column_types"))->getID("TEXT"),"0",TRUE)){
                                $this->errors[] = "SQL error: (".$sql->sql().")" . $this->table_definition->getErrors();
                            }
                        }
                        if(count($this->errors) > 0){
                            $this->table_definition->dropTable();
                        }
                    }
		
		function afterAddRec(){
                    if(count($this->errors) > 0){
                           $this->table_definition->dropTable();
                    }
                    
                    print_r($this->errors);
		//	header("Location:win_close.html");
		}
		
		function beforeSaveRec(){
		}
		
		function afterSaveRec(){
			//header("Location:win_close.html");
		}

		function beforeDeleteRec(){
                    $this->parseGetVars();
                    $this->getRec();
                    
                    $this->SCHEMA_NAME = (new DB_table("view_tables"))->getValue("TABLE_SCHEMA", $this->ID);
                    echo "-" . $this->ORIGIN_ID ."<br>";
                    
		}
		
		function afterDeleteRec(){
                    if(count($this->errors) == 0){
                        if($this->ORIGIN_ID == 0){
                            $this->table_definition = new DB_table_def($this->SCHEMA_NAME,$this->TABLE_NAME);
                            if(!$this->table_definition->dropTable()){
                                $this->errors[] = "SQL error: " . implode("<br>",$this->table_definition->getErrors());
                            }
                        }
                    }
                    print_r($this->errors);
                    //header("Location:win_close.html");
		}
		
		function beforeDisplay(){	
		}
		
		function afterDisplay(){	
		}
		
	};
	
	$phpapps_database_lists_form_Imp = new phpapps_database_lists_form_imp();
?>