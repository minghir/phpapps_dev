<?php
require_once ("globals.php");
include ("gen_php/phpapps_admin_tables_form.php");
	class phpapps_admin_tables_form_impl  extends phpapps_admin_tables_form{
	
		public $table_definition;
		public $MODULE_ID;
		public $SCHEMA_NAME;
		public $TABLE_ID;
	
		function __construct(){
			$this->template = "phpapps_admin_tables_form_imp.tpl";
			$this->MODULE_ID = $_GET["module_id"];
			$this->init();

			if($this->gact == "dropTable"){
				$this->dropTable();
			}
			$this->display();
		}
		
		function dropTable(){
			$sql = new DB_query( "SELECT TABLE_NAME, TABLE_SCHEMA
			FROM phpapps.view_tables 
			WHERE ".$this->gfield." = :".$this->gfield." AND MODULE_ID = :module_id",
			array(":".$this->gfield => $this->gfield_value,":module_id"=>$this->MODULE_ID));

			$this->globals->con->query( $sql );
			$this->globals->con->next();
			$this->TABLE_SCHEMA = $this->globals->con->get_field("TABLE_SCHEMA");
			$this->TABLE_NAME = $this->globals->con->get_field("TABLE_NAME");
			
			$sql = new DB_query( "DROP TABLE ". $this->TABLE_SCHEMA . "." . $this->TABLE_NAME);
			
			if( $this->globals->con->query($sql) == -1 ){
				$this->errors[] = "SQL error: (".$sql->sql().")" . $this->globals->con->get_error();	
			}else{
				$this->deleteRec();
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
			 $sql = new DB_query($this->table_definition->get_create_str());
			 if( $this->globals->con->query($sql) == -1 ){
				$this->errors[] = "SQL error: (".$sql->sql().")" . $this->globals->con->get_error();
			 }
		}
		
		function afterAddRec(){
		
			if(count($this->errors) == 0) {	
				
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
						COLUMN_SIZE,
						COLUMN_INDEX_TYPE_ID
						) VALUES(
							:TABLE_ID,
							:COLUMN_NAME,
							:COLUMN_TYPE_ID,
							:COLUMN_SIZE,
							:COLUMN_INDEX_TYPE_ID
						)",array(
							":TABLE_ID"=>$this->TABLE_ID,
							":COLUMN_NAME"=>"ID",
							":COLUMN_TYPE_ID"=>(new DB_list("list_mysql_column_types"))->getID("BIGINT"),
							":COLUMN_SIZE"=>"20",
							":COLUMN_INDEX_TYPE_ID"=>(new DB_list("list_index_types"))->getID("PRIMARY")
						));
						print_r($sql);
					if( $this->globals->con->query($sql) == -1 ){
						$this->errors[] = "SQL error: (".$sql->sql().")" . $this->globals->con->get_error();	
					}else{
						header("Location:phpapps_admin_tables_form_imp.php?module_id=".$this->MODULE_ID."&gact=editRec&gfield=ID&gfield_value=".$this->TABLE_ID);
					}
				}
			}
			
		
		}
		
		function beforeSaveRec(){	
			$sql = new DB_query("ALTER TABLE ".(new DB_table("view_tables"))->getValue("TABLE_SCHEMA",$this->ID).".".(new DB_table("tables"))->getValue("TABLE_NAME",$this->ID) ." RENAME ".
				(new DB_table("view_tables"))->getValue("TABLE_SCHEMA",$this->ID).".".$this->TABLE_NAME);
		
			if( $this->globals->con->query($sql) == -1 ){
				$this->errors[] = "SQL error: (".$sql->sql().")" . $this->globals->con->get_error();	
			}else{
			
			}
					
		}
		
		function afterSaveRec(){
			//header("Location:win_close.html");
		}

		function beforeDeleteRec(){
		}
		
		function afterDeleteRec(){
			header("Location:win_close.html");
		}
		
		function beforeDisplay(){	
			if($this->gact == "editRec"){
				$table_details_grid =  new DB_grid($this->globals->con, "table","phpapps.view_table_details","phpapps_table_details_grid");
				$table_details_grid->grid_title = "COLUMNS";
				$table_details_grid->paginable = false;
				$table_details_grid->filterable = false;
				$table_details_grid->exportable = false;
				$table_details_grid->cols = array(
						"COLUMN_NAME",
						"COLUMN_TYPE_LABEl",
						"COLUMN_SIZE",
						"COLUMN_DEFAULT_VALUE",
						"CONCAT(FOREIGN_KEY_SCHEMA_LABEl,'.',FOREIGN_KEY_TABLE_LABEl)",
						"FOREIGN_KEY_COLUMN_LABEL",
						"COLUMN_INDEX_TYPE_LABEL",
						"DESCRIPTION");
				$table_details_grid->labels = array(
						"NAME",
						"TYPE",
						"SIZE",
						"DEFAULT VALUE",
						"FK TABLE",
						"FK COLUMN",
						"INDEX TYPE",
						"DESCRIPTION");
				$table_details_grid->where_rules = array("TABLE_ID = :table_id");
				$table_details_grid->where_params = array(":table_id" => $this->ID);
				$table_details_grid->rows_on_pg = 20;
				$table_details_grid->edit_form = "phpapps_admin_table_details_form_imp.php?table_id=".$this->ID;
				$this->globals->sm->assign("table_details_grid",$table_details_grid->get_grid_str());
			}
		}
		
		function afterDisplay(){	
		}
		
	};
	
	$phpapps_admin_tables_form_Impl = new phpapps_admin_tables_form_impl();
?>