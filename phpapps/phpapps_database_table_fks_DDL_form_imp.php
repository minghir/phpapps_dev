<?php
require_once ("globals.php");
include ("gen_php/phpapps_database_table_fks_DDL_form.php");
	class phpapps_database_table_fks_DDL_form_impl  extends phpapps_database_table_fks_DDL_form{
                private $get_table_id;
                private $get_module_id;
                private $get_fk_id;
            
                public $SCHEMA_NAME;
                public $TABLE_NAME;
                public $TABLE_ID;
                public $COLUMN_NAME;
                public $MODULE_ID;
                public $FK_SCHEMA_NAME;
                public $FK_TABLE_NAME;
                public $FK_COLUMN_NAME = "ID";
                
                public $FK_ID;
                
                private $table_definition;
                
                
		function __construct(){
                    
			parent::__construct();
			$this->template = "phpapps_database_table_fks_DDL_form_imp.tpl";
                        
                        $this->get_table_id = $_GET["table_id"];
                        $this->get_module_id = $_GET["module_id"];
                        $this->get_fk_id = $_GET["gfield_value"];
                        
                        $this->MODULE_ID = $this->get_module_id;
                        $this->TABLE_ID = $this->get_table_id;
                        $this->FK_ID = $this->get_fk_id;
                        
			$this->init();
			$this->display();
		}
		
		function beforeGetRec(){
		}
		
		function afterGetRec(){
		}
	
		function beforeAddRec(){
                    $tbl = new DB_table("phpapps.view_table_details");
                    $arr = $tbl->getFieldsArray(array("TABLE_SCHEMA","TABLE_NAME","COLUMN_NAME"),"ID",$this->COLUMN_ID);
                    
                    $this->SCHEMA_NAME = $arr["TABLE_SCHEMA"];
                    $this->TABLE_NAME = $arr["TABLE_NAME"];
                    $this->COLUMN_NAME = $arr["COLUMN_NAME"];
                    //FK name 
                    $this->FK_NAME = $arr["TABLE_SCHEMA"] . 
                                    "-" . $arr["TABLE_NAME"] . 
                                    "-" . $arr["COLUMN_NAME"] .
                                    "-FK";
                    
                                     if(count($this->errors) == 0){
                                                $tbl = new DB_table("phpapps.view_tables");
                                                $arr = $tbl->getFieldsArray(array("TABLE_SCHEMA","TABLE_NAME"),"ID",$this->FK_TABLE_ID);
                                                $this->FK_SCHEMA_NAME = $arr["TABLE_SCHEMA"];
                                                $this->FK_TABLE_NAME = $arr["TABLE_NAME"];
                                                $this->FK_COLUMN_NAME = "ID";
                        
                                                $this->table_definition = new DB_table_def($this->SCHEMA_NAME,$this->TABLE_NAME);
                                                
			if(!$this->table_definition->alterTblAddFK( $this->COLUMN_NAME,
                                                                $this->FK_SCHEMA_NAME,
                                                                $this->FK_TABLE_NAME,"ID")){
                                                                            $this->errors[] = "SQL error: " . implode("<br>",$this->table_definition->getErrors());
                        // ADAUGA INDEX                                                    
                                                       }
                                    }
                    
                    
		}
		
		function afterAddRec(){
                    
		}
		
		function beforeSaveRec(){
		}
		
		function afterSaveRec(){
			//header("Location:win_close.html");
		}

		function beforeDeleteRec(){
                    $tbl = new DB_table("phpapps.view_table_fks");
                    $arr = $tbl->getFieldsArray(array("TABLE_SCHEMA","TABLE_NAME","COLUMN_NAME","FK_NAME"),"ID",$this->FK_ID);
                    $this->table_definition = new DB_table_def($arr["TABLE_SCHEMA"],$arr["TABLE_NAME"]);
                    if(!$this->table_definition->alterTblDropFK($arr["FK_NAME"])){
                        $this->errors[] = "SQL error: " . implode("<br>",$this->table_definition->getErrors());
                    }
                    // DROP INDEX
                    //print_r($arr);
                    //exit;
		}
		
		function afterDeleteRec(){
		//	header("Location:win_close.html");
		}
		
		function beforeDisplay(){	
                    $this->TABLE_ID = $this->get_table_id;
                    $this->COLUMN_ID_sel->set_query( new DB_query(
                            "SELECT ID,"
                            . "COLUMN_NAME AS VALUE "
                            . "FROM phpapps.view_table_details "
                            . "WHERE TABLE_ID = :table_id ORDER BY ORD",
                    array(":table_id"=>$this->TABLE_ID)));
                    $this->COLUMN_ID_sel->set_empty_option(FALSE);
                    
                    $this->FK_TABLE_ID_sel->set_query( new DB_query(
                            "SELECT ID AS ID,"
                            . "CONCAT(TABLE_SCHEMA,'.',TABLE_NAME) AS VALUE "
                            . "FROM phpapps.view_tables "
                            . "WHERE MODULE_ID = :module_id ORDER BY TABLE_TYPE,TABLE_NAME",
                    array(":module_id"=>$this->MODULE_ID)));
                   // print_r($this->FK_TABLE_ID_sel->db_query);
                    $this->FK_TABLE_ID_sel->set_empty_option(FALSE);
                    
                    $this->FK_COLUMN_ID_sel;
		}
		
		function afterDisplay(){	
		}
		
	};
	
	$phpapps_database_table_fks_DDL_form_Impl = new phpapps_database_table_fks_DDL_form_impl();
?>