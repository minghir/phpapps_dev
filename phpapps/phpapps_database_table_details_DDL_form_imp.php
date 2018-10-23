<?php
require_once ("globals.php");
include ("gen_php/phpapps_database_table_details_DDL_form.php");
	class phpapps_database_table_details_DDL_form_impl  extends phpapps_database_table_details_DDL_form{
		private $get_table_id;
            
                public $SCHEMA_NAME;
                public $TABLE_NAME;
                public $MODULE_ID;
               
                
                private $AFTER_COL;
                private $table_definition;
                
		function __construct(){
			parent::__construct();
			$this->template = "phpapps_database_table_details_DDL_form_imp.tpl";
////                        
                        print_r($_GET);
                        $this->get_table_id = $_GET["table_id"];
                        $this->AFTER_COL = $_POST["AFTER_COL"];
////                    
                        // validate input
                        
                        $this->MODULE_ID = _tbl("phpapps.tables","MODULE_ID",$this->get_table_id);
                        
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
                                                                ($this->COLUMN_DEFAULT_VALUE == '' ? TRUE : FALSE),//is_null daca defaul = ''
                                                                $this->COLUMN_DEFAULT_VALUE,
                                                                FALSE,
                                                                $this->AFTER_COL)){
                        $this->errors[] = "SQL error: " . implode("<br>",$this->table_definition->getErrors());
                    }
		}
		
		function afterAddRec(){
                        if(count($this->errors) == 0){
                            $after_ord = _tbl("phpapps.table_details", "ORD", $this->AFTER_COL, "COLUMN_NAME");
                            $current_ord = $after_ord;
                            $sql = new DB_query("UPDATE phpapps.table_details SET ORD = ORD + 1 WHERE ORD > $after_ord AND TABLE_ID = :table_id",array(":table_id"=>$this->TABLE_ID));
                            if( $this->globals->con->query($sql) == -1 ){
                                $this->errors = "UPDATE ESUAT!";
                            }else{
                                $sql = new DB_query("UPDATE phpapps.table_details SET ORD = $after_ord + 1 WHERE COLUMN_NAME = :col_name AND TABLE_ID = :table_id",array(
                                            ":col_name" => $this->COLUMN_NAME,
                                            ":table_id"=>$this->TABLE_ID));
                                if( $this->globals->con->query($sql) == -1 ){
                                   $this->errors[] = "UPDATE ESUAT!" . $sql->sql();
                                }
                            }
                        }
                        print_r($this->errors);
			//header("Location:win_close.html");
		}
		
		function beforeSaveRec(){
                    echo "EDITEZ:".$this->ID ."<br>";
                    $tbl = new DB_table("phpapps.view_table_details");
                    $tmp_arr = $tbl->getFieldsArray(array("TABLE_SCHEMA","TABLE_NAME","COLUMN_NAME","COLUMN_TYPE_ID","COLUMN_SIZE","COLUMN_DEFAULT_VALUE"),"ID",$this->ID);
                     
                    $this->SCHEMA_NAME = $tmp_arr["TABLE_SCHEMA"];
                    $this->TABLE_NAME = $tmp_arr["TABLE_NAME"];
echo "_____<br>";
                    print_r($tmp_arr);
echo "_____<br>";
                    
                    $this->table_definition = new DB_table_def($this->SCHEMA_NAME,$this->TABLE_NAME);
                     
                     if(($this->COLUMN_NAME != $tmp_arr["COLUMN_NAME"]) || 
                        ($this->COLUMN_TYPE_ID != $tmp_arr["COLUMN_TYPE_ID"]) ||
                        ($this->COLUMN_SIZE != $tmp_arr["COLUMN_SIZE"]) || 
                        ($this->COLUMN_DEFAULT_VALUE != $tmp_arr["COLUMN_DEFAULT_VALUE"]) ){
                         
                            if(!$this->table_definition->alterTblChangeCol($tmp_arr["COLUMN_NAME"],
                                                                $this->COLUMN_NAME,
                                                                $this->COLUMN_TYPE_ID,
                                                                $this->COLUMN_SIZE,
                                                                ($this->COLUMN_DEFAULT_VALUE == '' ? TRUE : FALSE),//is_null daca defaul = ''
                                                                $this->COLUMN_DEFAULT_VALUE,
                                                                FALSE)){
                                $this->errors[] = "SQL error: " . implode("<br>",$this->table_definition->getErrors());
                            }
                            
                     }
                     }
                     
                     //FOREIGN_KEY_TABLE_ID
                     //exit;
		
		
		function afterSaveRec(){
                    print_r($this->errors);
			//header("Location:win_close.html");
		}

		function beforeDeleteRec(){
                    $this->getRec();
   
                    $this->SCHEMA_NAME = _tbl("phpapps.view_tables","TABLE_SCHEMA",$this->get_table_id);
                    $this->TABLE_NAME = _tbl("phpapps.view_tables","TABLE_NAME",$this->get_table_id);
                    $this->TABLE_ID = $this->get_table_id;

                    $this->table_definition = new DB_table_def($this->SCHEMA_NAME,$this->TABLE_NAME);
                    if(!$this->table_definition->alterTblDropFK($this->COLUMN_NAME)){
                        $this->errors[] = "SQL error: " . implode("<br>",$this->table_definition->getErrors());
                    }
                    if(!$this->table_definition->alterTblDropCol($this->COLUMN_NAME)){
                        $this->errors[] = "SQL error: " . implode("<br>",$this->table_definition->getErrors());
                    }
                }
                
		function afterDeleteRec(){
		//	header("Location:win_close.html");
                        print_r($this->errors);
                }
		
		
		function beforeDisplay(){
                    
echo "AICIIIII";
         $this->TABLE_ID = $this->get_table_id;
         $AFTER_COL_SEL = new DB_select("AFTER_COL","view_table_details");
			$AFTER_COL_SEL->set_query( new DB_query("SELECT COLUMN_NAME AS ID,COLUMN_NAME AS VALUE FROM phpapps.view_table_details WHERE TABLE_ID = :table_id ORDER BY ORD",
								array(":table_id"=>$this->TABLE_ID)));
			print_r($AFTER_COL_SEL->db_query);					
			//$AFTER_COL_SEL->query_params[":table_id"] = $this->TABLE_ID;
			$AFTER_COL_SEL->empty_option = false;
			$AFTER_COL_SEL->setup_select_options();
                        
			$str = "<tr><td align='right'>AFTER:</td><td>".$AFTER_COL_SEL->get_select_str()."</td></tr>";
          /*              
                        $this->FOREIGN_KEY_TABLE_ID_sel->query = "SELECT ID AS VALUE, CONCAT(TABLE_SCHEMA,'.',TABLE_NAME) AS LABEL "
                                . "                                   FROM phpapps.view_tables "
                                . "                                   WHERE MODULE_ID = :module_id  "
                                . "                                   ORDER BY TABLE_SCHEMA,TABLE_NAME";
                        $this->FOREIGN_KEY_TABLE_ID_sel->query_params[":module_id"] = $this->MODULE_ID;
                        $this->FOREIGN_KEY_TABLE_ID_sel->setup_select_options();
			*/
			$this->globals->sm->assign(array(
					"FROM_IMP_CLASS" => $str,
           //                             "FOREIGN_KEY_TABLE_ID_sel" => $this->FOREIGN_KEY_TABLE_ID_sel->get_select_str(),
			));
			$this->ACCEPT_NULL_sel->set_empty_option(FALSE);
         $this->AUTOINCREMENT_sel->set_empty_option(FALSE);
         $this->UNSIGN_sel->set_empty_option(FALSE);
    /*     
         $sql = new DB_query ("SELECT ID AS value, CONCAT(TABLE_SCHEMA,'.',TABLE_NAME) AS label 
			FROM phpapps.view_tables 
                        WHERE TABLE_TYPE = :tbl_type 
                        ORDER BY TABLE_SCHEMA, TABLE_NAME",array(":tbl_type" => _lst("list_table_types","values_table")));
                    // AND MODULE = curent_module ?
                    //$this->TABLE_ID_sel->set_empty_option(FALSE);
         $this->TABLE_ID_sel->set_query($sql);
    */                    
                        //$this->FOREIGN_KEY_TABLE_ID_sel->query = "SELECT ID AS VALUE, CONCAT(TABLE_SCHEMA,'.',TABLE_NAME) AS LABEL FROM phpapps.view_tables ORDER BY TABLE_SCHEMA,TABLE_NAME";
                        //$this->FOREIGN_KEY_TABLE_ID_sel->setup_select_options();
		}
		
		function afterDisplay(){	
		}
	};
	
	$phpapps_database_table_details_DDL_form_Impl = new phpapps_database_table_details_DDL_form_impl();
?>