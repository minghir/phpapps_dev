<?php
require_once ("globals.php");
include ("gen_php/phpapps_database_tables_form.php");
	class phpapps_database_tables_form_impl  extends phpapps_database_tables_form{
	
		public $table_definition;
		public $MODULE_ID;
		public $SCHEMA_NAME;
		public $TABLE_ID;
	
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
			$sql = new DB_query("SELECT SCHEMA_NAME, MODULE_SCHEMA FROM view_modules WHERE ID = :module_id",array(":module_id"=>$this->MODULE_ID));
			if( $this->globals->con->query($sql) == -1 ){
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
                        }
                        
                        if(count($this->errors) > 0){
                            $this->table_definition->dropTable();
                        }
			
		}
		
		function afterAddRec(){
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
			if($this->gact == "editRec"){
				$table_details_grid =  new DB_grid($this->globals->con, "table","phpapps.view_table_details","phpapps_table_details_grid");
                                
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
						"CONCAT(FOREIGN_KEY_SCHEMA_LABEL,'.',FOREIGN_KEY_TABLE_LABEL)",
						"DESCRIPTION");
				$table_details_grid->labels = array(
						"NAME",
						"TYPE",
						"SIZE",
						"DEFAULT VALUE",
						"FK TABLE",
						"DESCRIPTION");
                                $table_details_grid->current_order_field = "ORD";
	                        $table_details_grid->current_order_rule = "ASC";
                                $table_details_grid->sortable = FALSE;
				$table_details_grid->where_rules = array("TABLE_ID = :table_id");
                                $table_id = $this->ORIGIN_ID == 0 ? $this->ID : $this->ORIGIN_ID;
				$table_details_grid->where_params = array(":table_id" => $table_id);
				$table_details_grid->rows_on_pg = 20;
				$table_details_grid->edit_form = "phpapps_database_table_details_form_imp.php?table_id=".$this->ID;
				$this->globals->sm->assign("table_details_grid",$table_details_grid->get_grid_str());
			}
		}
		
		function afterDisplay(){	
		}
		
	}
	
	$phpapps_database_tables_form_Impl = new phpapps_database_tables_form_impl();
?>