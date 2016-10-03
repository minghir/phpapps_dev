<?php
require_once ("globals.php");
include ("gen_php/phpapps_database_table_indexes_DDL_form.php");
	class phpapps_database_table_indexes_DDL_form_impl  extends phpapps_database_table_indexes_DDL_form{
            
                private $get_table_id;
            
                public $SCHEMA_NAME;
                public $TABLE_NAME;
                public $MODULE_ID;
                public $INDEX_COLUMNS_LABELS = array();
                private $table_definition;
            
		function __construct(){
			parent::__construct();
			$this->template = "phpapps_database_table_indexes_DDL_form_imp.tpl";
                        
                        $this->get_table_id = $_GET["table_id"];
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
                    
                 echo "AICI<h1>" .$this->SCHEMA_NAME."</h1>";
                    $sql = new DB_query("SELECT COLUMN_NAME "
                                        . "FROM phpapps.table_details "
                                        . "WHERE ID IN (".implode(",",$this->INDEX_COLUMNS).")"
                                        );
                    print_r($sql);
                    if( $this->globals->con->query($sql, $this->table_name) != -1 ){
		
			while($res=$this->globals->con->fetch_array($this->table_name)){
				$this->INDEX_COLUMNS_LABELS[] = $res["COLUMN_NAME"];
			}
                    }
                    print_r($this->INDEX_COLUMNS_LABELS);
                    $this->INDEX_NAME = $this->SCHEMA_NAME ."_".
                                        $this->TABLE_NAME ."_".
                                        implode("_",$this->INDEX_COLUMNS_LABELS) ."_IDX";
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