<?php
require_once ("globals.php");
include ("gen_php/phpapps_database_table_indexes_DDL_form.php");
	class phpapps_database_table_indexes_DDL_form_impl  extends phpapps_database_table_indexes_DDL_form{
            
                private $get_table_id;
            
                public $SCHEMA_NAME;
                public $TABLE_NAME;
                public $MODULE_ID;
                private $table_definition;
            
		function __construct(){
			parent::__construct();
			$this->template = "phpapps_database_table_indexes_DDL_form_imp.tpl";
                        
                        $this->get_table_id = $_GET["table_id"];
                        $this->TABLE_ID = $this->get_table_id;
                        $this->MODULE_ID = _tbl("phpapps.tables","MODULE_ID",$this->get_table_id);
                        $this->TABLE_NAME =_tbl("phpapps.tables","TABLE_NAME",$this->get_table_id);
                        $this->SCHEMA_NAME =_tbl("phpapps.tables","TABLE_SCHEMA",$this->get_table_id);
                        
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
                                        implode("_",$this->INDEX_COLUMNS) ."_IDX";
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