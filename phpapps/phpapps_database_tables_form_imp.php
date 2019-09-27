<?php
require_once ("globals.php");
include ("gen_php/phpapps_database_tables_form.php");
	class phpapps_database_tables_form_impl  extends phpapps_database_tables_form{
	
		public $table_definition;
		public $MODULE_ID;
		public $SCHEMA_NAME;
		public $TABLE_ID;
                public $TABLE_NAME;
	
		function __construct(){
                    parent::__construct();
			$this->template = "phpapps_database_tables_form_imp.tpl";
			$this->MODULE_ID = $_GET["module_id"];
                        $this->TABLE_TYPE = (new DB_list("list_table_types"))->getID("values_table");
			$this->init();
			$this->display();
		}
		
		
		function beforeGetRec(){
		}
		
		function afterGetRec(){
		}
	
		function beforeAddRec(){
                    echo "beforeAddRec<br>";
			$sql = new DB_query("SELECT SCHEMA_NAME, MODULE_SCHEMA FROM view_modules WHERE ID = :module_id",array(":module_id"=>$this->MODULE_ID));
                        print_r($sql);
			if( $this->globals->con->query($sql) == -1 ){
                           // echo "AICI EROARE 1";
				$this->errors[] = "SQL error: (".$sql->sql().")" . $this->globals->con->get_error();	
			}else{
				$this->globals->con->next();
				$this->SCHEMA_ID = $this->globals->con->get_field("MODULE_SCHEMA");
				$this->SCHEMA_NAME = $this->globals->con->get_field("SCHEMA_NAME");
			}
			
                        $this->globals->con->begin();
			$this->table_definition = new DB_table_def($this->SCHEMA_NAME,$this->TABLE_NAME);
                        if(!$this->table_definition->createIDTable()){
                            $this->errors[] = "SQL error: (".$sql->sql().")" . $this->table_definition->getErrors();
                            echo "AICI EROARE 2" . "SQL error: (".$sql->sql().")" . $this->table_definition->getErrors() ."<br>";
                        }
                        
                        if(count($this->errors) > 0){
                            $this->table_definition->dropTable();
                        }
			
		}
		
		function afterAddRec(){
                    echo "AICI 4";
                    print_r($this->errors);
                    echo "AICI GATA 4";
                    if(count($this->errors) > 0){
                        $this->table_definition->dropTable();
                        $this->globals->con->rollback();
                    }else{
                        $sql = new DB_query("SELECT ID FROM phpapps.tables 
									WHERE MODULE_ID = :module_id AND
									SCHEMA_ID = :schema_id AND
									TABLE_NAME = :table_name",array(
										":module_id" => $this->MODULE_ID,
										":schema_id" => $this->SCHEMA_ID,
										":table_name" => $this->TABLE_NAME
									)); 
				if( $this->globals->con->query($sql) == -1 ){
					$this->errors[] = "SQL error: (".$sql->sql().")" . $this->globals->con->get_error();	
				}else{
					$this->globals->con->next();
					$this->TABLE_ID = $this->globals->con->get_field("ID");
					
					echo "<h1> AICI:".$this->TABLE_ID."</h1>";
					
					$sql = new DB_query("INSERT INTO phpapps.table_details(
						TABLE_ID,
						COLUMN_NAME,
						COLUMN_TYPE_ID,
						COLUMN_SIZE
						) VALUES(
							:TABLE_ID,
							:COLUMN_NAME,
							:COLUMN_TYPE_ID,
							:COLUMN_SIZE
						)",array(
							":TABLE_ID"=>$this->TABLE_ID,
							":COLUMN_NAME"=>"ID",
							":COLUMN_TYPE_ID"=>(new DB_list("list_mysql_column_types"))->getID("BIGINT"),
							":COLUMN_SIZE"=>"20"
						));
                                                
						print_r($sql);
					if( $this->globals->con->query($sql) == -1 ){
						$this->errors[] = "SQL error: (".$sql->sql().")" . $this->globals->con->get_error();	
                                                echo "AICI EROARE 3" ."<br>";
                                                $this->globals->con->rollback();
					}else{
						//header("Location:phpapps_admin_tables_form_imp.php?module_id=".$this->MODULE_ID."&gact=editRec&gfield=ID&gfield_value=".$this->TABLE_ID);
                                            $this->globals->con->commit();
					}
				}
                             
			}
                        
print_r($this->errors);
                }
                    
		

		
		function beforeSaveRec(){	
                    $this->globals->con->begin();
                    if($this->ORIGIN_ID != 0){
                        $this->TABLE_NAME = (new DB_table("tables"))->getValue("TABLE_NAME",$this->ID);
                        $this->TABLE_TYPE = (new DB_table("tables"))->getValue("TABLE_TYPE",$this->ID);
                        $this->errors[] = "NOT THE OWNER MODULE!!!";
                    }else{
                        
                        $this->table_definition = new DB_table_def((new DB_table("view_tables"))->getValue("TABLE_SCHEMA",$this->ID),(new DB_table("tables"))->getValue("TABLE_NAME",$this->ID));
                        if(!$this->table_definition->alterTblRenameTbl($this->TABLE_NAME)){
                            $this->errors[] = "SQL error: (".$sql->sql().")" . $this->table_definition->getErrors();
                        }
                    }
		}
		
		function afterSaveRec(){
                    if(count($this->errors) == 0){
                        $this->globals->con->commit();
                    }else{
                        $this->globals->con->rollback();
                    }
			//header("Location:win_close.html");
		}

		function beforeDeleteRec(){
                    $this->getRec();
                    $this->SCHEMA_NAME = (new DB_table("view_tables"))->getValue("TABLE_SCHEMA", $this->ID);
                    if($this->ORIGIN_ID === 0){
                        echo "zero";
                    }else{
                        echo "null";
                    }
                    echo "ID - " . $this->ID ."ORIGIN-" . $this->ORIGIN_ID ."<br>";
                    //exit;
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
			//header("Location:win_close.html");
		}
		
		function beforeDisplay(){	
                    $this->TABLE_NAME = (new DB_table("tables"))->getValue("TABLE_NAME",$this->ID);
                    echo "TABLE NAME:" . $this->TABLE_NAME . "<br>";
			if($this->gact == "editRec"){
                            
				$table_details_grid =  new DB_grid($this->globals->con, "table","phpapps.view_table_details","phpapps_table_details_DDL_grid");
                                $table_details_grid->editable = $this->ORIGIN_ID == 0 ? TRUE : FALSE;
				$table_details_grid->grid_title = "COLUMNS";
				$table_details_grid->paginable = false;
				$table_details_grid->filterable = false;
				$table_details_grid->exportable = false;
				$table_details_grid->cols = array(
						"COLUMN_NAME",
						"COLUMN_TYPE_LABEl",
						"COLUMN_SIZE",
						"COLUMN_DEFAULT_VALUE",
						"DESCRIPTION");
				$table_details_grid->labels = array(
						"NAME",
						"TYPE",
						"SIZE",
						"DEFAULT VALUE",
						"DESCRIPTION");
                                $table_details_grid->current_order_field = "ORD";
                                $table_details_grid->current_order_rule = "ASC";
                                $table_details_grid->sortable = FALSE;
				$table_details_grid->where_rules = array("TABLE_ID = :table_id");
                                $table_id = $this->ORIGIN_ID == 0 ? $this->ID : $this->ORIGIN_ID;
				$table_details_grid->where_params = array(":table_id" => $table_id);
				$table_details_grid->edit_form = "phpapps_database_table_details_DDL_form_imp.php?table_id=".$this->ID;
                                $this->globals->sm->assign("table_details_grid",$table_details_grid->get_grid_str());
                                
                                /*
                                $table_details_grid =  new DB_grid($this->globals->con, "table","INFORMATION_SCHEMA.COLUMNS","phpapps_table_details_DDL_grid");
                                $table_details_grid->editable = $this->ORIGIN_ID == 0 ? TRUE : FALSE;
				$table_details_grid->grid_title = "COLUMNS";
				$table_details_grid->paginable = false;
				$table_details_grid->filterable = false;
				$table_details_grid->exportable = false;
				$table_details_grid->cols = array(
						"COLUMN_NAME",
						"DATA_TYPE",
						"CHARACTER_MAXIMUM_LENGTH",
						"COLUMN_DEFAULT",
						"COLUMN_COMMENT");
				$table_details_grid->labels = array(
						"NAME",
						"TYPE",
						"SIZE",
						"DEFAULT VALUE",
						"DESCRIPTION");
                                $table_details_grid->current_order_field = "ORD";
                                $table_details_grid->current_order_rule = "ASC";
                                $table_details_grid->sortable = FALSE;
				$table_details_grid->where_rules = array("TABLE_NAME = :table_name");
                                $table_id = $this->ORIGIN_ID == 0 ? $this->ID : $this->ORIGIN_ID;
                         echo "AICI:" . $this->TABLE_NAME ."<br>";       
				$table_details_grid->where_params = array(":table_name" => $this->TABLE_NAME);
				$table_details_grid->edit_form = "phpapps_database_table_details_DDL_form_imp.php?table_id=".$this->ID;
                                
				$this->globals->sm->assign("table_details_grid",$table_details_grid->get_grid_str());
                                
                        echo "AICIC:" . $table_details_grid->query->query_str ."<br>";
                                */
                                $columns_fk_grid = new DB_grid($this->globals->con, "table","phpapps.view_table_fks","phpapps_view_table_fks_DDL_grid");
                                $columns_fk_grid->grid_title = "FOREIGN KEYS";
				$columns_fk_grid->paginable = false;
				$columns_fk_grid->filterable = false;
				$columns_fk_grid->exportable = false;
                                $columns_fk_grid->sortable = FALSE;
                                
                                $columns_fk_grid->cols = array(
						"COLUMN_NAME",
						"FK_NAME",
						"FK_TABLE_NAME",
						"FK_COLUMN_NAME",
                                                "ON_UPDATE",
                                                "ON_DELETE",
						"DESCRIPTION");
				$columns_fk_grid->labels = array(
						"COLUMN_NAME",
						"FK_NAME",
						"FK_TABLE_NAME",
						"FK_COLUMN_NAME",
                                                "ON_UPDATE",
                                                "ON_DELETE",
						"DESCRIPTION");
                                
                                $columns_fk_grid->where_params = array(":table_id" => $table_id);
                                $columns_fk_grid->where_rules = array("TABLE_ID = :table_id");
				$columns_fk_grid->editable = FALSE;
				
                                $lfk = new HrefActions();
                                $lfk->act_script = "phpapps_database_table_fks_DDL_form_imp.php?gact=deleteRec&table_id=".$this->ID."&module_id=".$this->MODULE_ID;
                                $lfk->confirm_msg = "Sigur stergeti inregistrarea?";
                                $lfk->popup = true;
                                $lfk->label = "delete";
                                $lfk->action = "deleteRec";
                                $lfk->fields = array("ID");
                                $columns_fk_grid->add_row_acction($lfk);
                                
                                $lfka = new HrefActions();
                                $lfka->act_script = "phpapps_database_table_fks_DDL_form_imp.php?gact=newRec&table_id=".$this->ID."&module_id=".$this->MODULE_ID;
                                $lfka->popup = true;
                                $lfka->label = "new";
                                $lfka->action = "newRec";
                                $columns_fk_grid->add_grid_acction($lfka);
                                
                                $this->globals->sm->assign("columns_fk_grid",$columns_fk_grid->get_grid_str());
                                
                                $table_idx_grid = new DB_grid($this->globals->con, "table","phpapps.view_table_indexes","phpapps_view_table_indexes_DDL_grid");
                                $table_idx_grid->grid_title = "INDEX";
                                $table_idx_grid->cols = array(
						"INDEX_NAME",
						"INDEX_TYPE",
						"INDEX_COLUMNS",
                                                "INDEX_COLUMNS_LABELS",
						"DESCRIPTION");
				$table_idx_grid->labels = array(
						"INDEX_NAME",
						"INDEX_TYPE",
						"INDEX_COLUMNS",
                                                "INDEX_COLUMNS_LABELS",
						"DESCRIPTION");
                                $table_idx_grid->where_params = array(":table_id" => $table_id);
                                $table_idx_grid->where_rules = array("TABLE_ID = :table_id");
				$table_idx_grid->paginable = false;
				$table_idx_grid->filterable = false;
				$table_idx_grid->exportable = false;
                                $table_idx_grid->sortable = FALSE;
                                $table_idx_grid->editable = FALSE;
                                
                                $la = new HrefActions();
                                $la->act_script = "phpapps_database_table_indexes_DDL_form_imp.php?gact=deleteRec&table_id=".$this->ID."&module_id=".$this->MODULE_ID;
                                $la->confirm_msg = "Sigur stergeti inregistrarea?";
                                $la->popup = true;
                                $la->label = "delete";
                                $la->action = "deleteRec";
                                $la->fields = array("ID");
                                $table_idx_grid->add_row_acction($la);
                                
                                $lad = new HrefActions();
                                $lad->act_script = "phpapps_database_table_indexes_DDL_form_imp.php?gact=newRec&table_id=".$this->ID."&module_id=".$this->MODULE_ID;
                                $lad->popup = true;
                                $lad->label = "new";
                                $lad->action = "newRec";
                                $table_idx_grid->add_grid_acction($lad);
                                
                                $this->globals->sm->assign("table_idx_grid",$table_idx_grid->get_grid_str());
                                //$this->table_definition = new DB_table_def($this->SCHEMA_NAME,$this->TABLE_NAME);
                                $this->SCHEMA_NAME = (new DB_table("view_tables"))->getValue("TABLE_SCHEMA", $this->ID);
                                $sql = new DB_query("SHOW CREATE TABLE " . $this->SCHEMA_NAME . "." . $this->TABLE_NAME);
                                print_r($sql);
                                $this->globals->con->query($sql);
                                $this->globals->con->next();
                                $show_create_table = str_replace("`","", $this->globals->con->get_field("Create Table") );
                                
                                $this->globals->sm->assign("show_create_table",$show_create_table);
                                
			}
		}
		
		function afterDisplay(){	
		}
		
	}
	
	$phpapps_database_tables_form_Impl = new phpapps_database_tables_form_impl();
?>