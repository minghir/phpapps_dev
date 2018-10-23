<?php
require_once ("globals.php");
include ("gen_php/phpapps_database_table_indexes_DDL_form.php");
	class phpapps_database_table_indexes_DDL_form_impl  extends phpapps_database_table_indexes_DDL_form{
            
                private $get_table_id;
                private $get_index_id;
            
                public $SCHEMA_NAME;
                public $TABLE_NAME;
                public $MODULE_ID;
                public $INDEX_COLUMNS_LABELS = array();
                
                private $table_definition;
            
		function __construct(){
			parent::__construct();
			$this->template = "phpapps_database_table_indexes_DDL_form_imp.tpl";
                        
                        $this->get_table_id = $_GET["table_id"];
                        $this->get_index_id = $_GET["gfield_value"];
                        $this->ID = $this->get_index_id;
                        $this->TABLE_ID = $this->get_table_id;
                        $this->MODULE_ID = _tbl("phpapps.view_tables","MODULE_ID",$this->get_table_id);
                        $this->TABLE_NAME =_tbl("phpapps.tables","TABLE_NAME",$this->get_table_id);
                        $this->SCHEMA_NAME =_tbl("phpapps.view_tables","TABLE_SCHEMA",$this->get_table_id);
                        
			$this->init();
			$this->display();
		}
		
		function beforeGetRec(){
		}
		
		function afterGetRec(){
		}
	
		function beforeAddRec(){
                    $this->INDEX_NAME = $this->SCHEMA_NAME ."_".
                                        $this->TABLE_NAME ."_".
                                        _lst("phpapps.list_index_types",$this->INDEX_TYPE_ID) .
                                        implode("_",$this->INDEX_COLUMNS    ) ."_IDX";
                    
                    $this->table_definition = new DB_table_def($this->SCHEMA_NAME,$this->TABLE_NAME);
                    $idx_def = new DB_index_def($this->SCHEMA_NAME,$this->TABLE_NAME);
                    $idx_def->INDEX_NAME = $this->INDEX_NAME;
                    $idx_def->INDEX_TYPE = _lst("phpapps.list_index_types",intval($this->INDEX_TYPE_ID));
                    
                    $sql = new DB_query("SELECT ID, COLUMN_NAME "
                                        . "FROM phpapps.table_details "
                                        . "WHERE ID IN (".implode(",",$this->INDEX_COLUMNS).")"
                                        );
                    
                    if( $this->globals->con->query($sql) != -1 ){
                        while($res=$this->globals->con->fetch_array()){
                            $idx_def->addColumn($res["COLUMN_NAME"]);
			}
                        
                        if(!$this->table_definition->alterTblAddIdx($idx_def)){
                            $this->errors[] = "SQL error: " . implode("<br>",$this->table_definition->getErrors());
                        }
                    }else{
                        $this->errors[] = "EROARE SELECT DIN table_details " . $this->globals->con->get_error();
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
                    $this->table_definition = new DB_table_def($this->SCHEMA_NAME,$this->TABLE_NAME);   
                    $this->INDEX_NAME = _tbl("phpapps.table_indexes","INDEX_NAME",$this->ID);
                    //echo "STERG ".$this->INDEX_NAME . "din: ". $this->SCHEMA_NAME.".".$this->TABLE_NAME;
                    if(!$this->table_definition->alterTblDropIdx($this->INDEX_NAME)){
                        $this->errors[] = "SQL error: " . implode("<br>",$this->table_definition->getErrors());
                    }
                    
		}
		
		function afterDeleteRec(){
		//	header("Location:win_close.html");
		}
		
		function beforeDisplay(){	
                    $this->INDEX_COLUMNS_sel->set_empty_option(FALSE);
                    $this->INDEX_COLUMNS_sel->set_query(new DB_query("SELECT ID, COLUMN_NAME AS VALUE FROM"
                            . " phpapps.table_details WHERE TABLE_ID = :table_id ORDER BY ORD",
                            array(":table_id" => $this->TABLE_ID)));
		}
		
		function afterDisplay(){	
		}
		
	};
	
	$phpapps_database_table_indexes_DDL_form_Impl = new phpapps_database_table_indexes_DDL_form_impl();
?>