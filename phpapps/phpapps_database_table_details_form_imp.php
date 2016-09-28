<?php
require_once ("globals.php");
include ("gen_php/phpapps_database_table_details_form.php");
	class phpapps_database_table_details_form_impl  extends phpapps_database_table_details_form{
            
                public $SCHEMA_NAME;
                public $TABLE_NAME;
                
                private $table_definition;
                private $get_table_id;
                
		function __construct(){
			parent::__construct();
			$this->template = "phpapps_database_table_details_form_imp.tpl";
                        
                        print_r($_GET);
                        $this->get_table_id = $_GET["table_id"];
                        
			$this->init();
			$this->display();
		}
		
		function beforeGetRec(){
		}
		
		function afterGetRec(){
		}
	
		function beforeAddRec(){
                    $this->SCHEMA_NAME = _tbl("phpapps.view_tables","TABLE_SCHEMA",$this->get_table_id);
                    $this->TABLE_NAME = _tbl("phpapps.view_tables","TABLE_NAME",$this->get_table_id);
                    $this->TABLE_ID = $this->get_table_id;
                        echo "<h1>"."(".$this->TABLE_ID.")".$this->SCHEMA_NAME.".".$this->TABLE_NAME."</h1>";
//                  ($vname,$vtype,$vsize,$vnull,$vdefault="",$vautoincr=FALSE){                            
                    $this->table_definition = new DB_table_def($this->SCHEMA_NAME,$this->TABLE_NAME);
                    if(!$this->table_definition->alterTblAddCol(
                                                                $this->COLUMN_NAME,
                                                                $this->COLUMN_TYPE_ID,
                                                                $this->COLUMN_SIZE,
                                                                FALSE,
                                                                $this->COLUMN_DEFAULT_VALUE,
                                                                FALSE,
                                                                "ID")){
                        $this->errors[] = "SQL error: " . implode("<br>",$this->table_definition->getErrors());
                    }
		}
		
		function afterAddRec(){
                        print_r($this->errors);
			//header("Location:win_close.html");
		}
		
		function beforeSaveRec(){
		}
		
		function afterSaveRec(){
			//header("Location:win_close.html");
		}

		function beforeDeleteRec(){
                     $this->SCHEMA_NAME = _tbl("phpapps.view_tables","TABLE_SCHEMA",$this->get_table_id);
                    $this->TABLE_NAME = _tbl("phpapps.view_tables","TABLE_NAME",$this->get_table_id);
                    $this->TABLE_ID = $this->get_table_id;
                        echo "<h1>"."(".$this->TABLE_ID.")".$this->SCHEMA_NAME.".".$this->TABLE_NAME."</h1>";
//                  ($vname,$vtype,$vsize,$vnull,$vdefault="",$vautoincr=FALSE){                            
                    $this->table_definition = new DB_table_def($this->SCHEMA_NAME,$this->TABLE_NAME);
                    if(!$this->table_definition->alterTblDropCol($this->COLUMN_NAME)){
                        $this->errors[] = "SQL error: " . implode("<br>",$this->table_definition->getErrors());
		}
		
		function afterDeleteRec(){
		//	header("Location:win_close.html");
                        print_r($this->errors);
                }
		}
		
		function beforeDisplay(){
                        $this->TABLE_ID = $this->get_table_id;
                    	$AFTER_COL_SEL = new DB_select("AFTER_COL","view_table_details");
			$AFTER_COL_SEL->query = "SELECT COLUMN_NAME,COLUMN_NAME FROM phpapps.view_table_details WHERE TABLE_ID = :table_id";
			$AFTER_COL_SEL->query_params[":table_id"] = $this->TABLE_ID;
			$AFTER_COL_SEL->empty_option = false;
			$AFTER_COL_SEL->setup_select_options();
			$str = "<tr><td align='right'>AFTER:</td><td>".$AFTER_COL_SEL->get_select_str()."</td></tr>";
			//$this->COLUMN_INDEX_TYPE_ID_sel->empty_option = false;
			//$this->COLUMN_INDEX_TYPE_ID_sel->setup_select_options();
			
			$this->globals->sm->assign(array(
					"FROM_IMP_CLASS" => $str,
			//		"COLUMN_INDEX_TYPE_ID_sel" => $this->COLUMN_INDEX_TYPE_ID_sel->get_select_str(),
					));
		}
		
		function afterDisplay(){	
		}
		
	};
	
	$phpapps_database_table_details_form_Impl = new phpapps_database_table_details_form_impl();
?>