<?php
require_once ("globals.php");
include ("gen_php/phpapps_admin_tables_form.php");
/*
	class phpapps_mytable_def extends DB_table_def{
	
		public $globals;
		public $table_name;
		public $schema;

		function __construct($scm,$tbl,$mod_id){
			global $GLOBALS_OBJ;
			$this->globals = $GLOBALS_OBJ;
			
			$this->schema = $scm;	
			$this->table_name = $tbl;
			
			$this->read_structure();
			
		}
	
		function read_structure(){
			$sql = new DB_query("DESC ".$this->schema.".".$this->table_name);
			if( $this->globals->con->query( $sql ) != -1 ){
				while($res=$this->globals->con->fetch_array()){
				// [Field] => ID [Type] => bigint(20) [Null] => NO [Key] => PRI [Default] => [Extra] => auto_increment 
				//Field	Type	Null	Key	Default	Extra
				//ID 	 bigint(20) 	 NO 	 PRI 	  	 auto_increment 
				//function add_column_def($vname,$vtype,$vsize,$vdefault="",$vfk = "", $vindex="")


//				COLUMN_NAME,DATA_TYPE,	CHARACTER_MAXIMUM+NUMERIC_PRECISION, COLUMN_DEFAULT,
				$tmp_arr = explode("(",$res["Type"]);
				
				$col_type = $tmp_arr[0];
				$col_size = $tmp_arr[1];
				
				//$this->add_column_def($res["Field"],
				print_r($res);
				
				}
			}
		}
	};
*/

	class phpapps_admin_custom_table_field{
		private $action;
		
		public $globals;
		public $MODULE_ID;
		
		//public $columns = array();
		
		function __construct($mod_id,$act = "add"){
			
			global $GLOBALS_OBJ;
			$this->globals = $GLOBALS_OBJ;
			$this->MODULE_ID = $mod_id;
			
			$this->action = $act;
			
			$select_column_types = new DB_select("col_types[]","phpapps.list_mysql_column_types");
			//$select_column_types->disabled = true;
			$select_column_types->selected_val = 5;
			$select_column_types->html_id = "col_type_0";
			$select_column_types->setup_select_options();
			
			$select_column_indexes = new DB_select("col_idxs[]","phpapps.list_index_types");
			//$select_column_indexes->disabled = true;
			$select_column_indexes->html_id = "col_idx_0";
			$select_column_indexes->selected_val = 1;
			$select_column_indexes->setup_select_options();
			
			$select_column_fks = new DB_select("col_fks[]","list_fks");
			//$select_column_fks->disabled = true;
			$select_column_fks->html_id = "col_fks_0";
			$select_column_fks->query = "SELECT CONCAT(ld.VALUE,'.',t.TABLE_NAME) AS VALUE, 
										 CONCAT(ld.VALUE,'.',t.TABLE_NAME) AS LABEL  
										 FROM phpapps.tables t, phpapps.view_modules m, phpapps.applications a, phpapps.list_databases ld 
										 WHERE t.MODULE_ID = m.ID AND 
										 m.APP_ID = a.ID AND 
										 a.APP_SCHEMA = ld.ID AND 
										 m.ID = :module_id ORDER BY VALUE";
			$select_column_fks->query_params = array(":module_id" => $this->MODULE_ID);
			//echo $select_column_fks->query;
			$select_column_fks->setup_select_options();
			
			$this->globals->sm->assign(array(
				"select_column_types_0"=>$select_column_types->get_select_str(),
				"select_column_indexes_0"=>$select_column_indexes->get_select_str(),
				"select_column_fks_0" => $select_column_fks->get_select_str()
			));
		}
		
		function add_custom_field(){
			$select_column_types = new DB_select("col_types[]","phpapps.list_mysql_column_types");
			//$select_column_types->disabled = true;
			$select_column_types->selected_val = 5;
			$select_column_types->html_id = "col_type_1";
			$select_column_types->setup_select_options();
			
			$select_column_indexes = new DB_select("col_idxs[]","phpapps.list_index_types");
			//$select_column_indexes->disabled = true;
			$select_column_indexes->html_id = "col_idx_1";
			$select_column_indexes->selected_val = 1;
			$select_column_indexes->setup_select_options();
			
			$select_column_fks = new DB_select("col_fks[]","list_fks");
			//$select_column_fks->disabled = true;
			$select_column_fks->html_id = "col_fks_1";
			$select_column_fks->query = "SELECT CONCAT(ld.VALUE,'.',t.TABLE_NAME) AS VALUE, 
										 CONCAT(ld.VALUE,'.',t.TABLE_NAME) AS LABEL  
										 FROM phpapps.tables t, phpapps.view_modules m, phpapps.applications a, phpapps.list_databases ld 
										 WHERE t.MODULE_ID = m.ID AND 
										 m.APP_ID = a.ID AND 
										 a.APP_SCHEMA = ld.ID AND 
										 m.ID = :module_id ORDER BY VALUE";
			$select_column_fks->query_params = array(":module_id" => $this->MODULE_ID);
			//echo $select_column_fks->query;
			$select_column_fks->setup_select_options();
			
			$this->globals->sm->assign(array(
				"select_column_types_1"=>$select_column_types->get_select_str(),
				"select_column_indexes_1"=>$select_column_indexes->get_select_str(),
				"select_column_fks_1" => $select_column_fks->get_select_str()
			));
		}
		
		function get_custom_table_str(){
			$tpl = "";
			if($this->action == "add"){
				$tpl = "phpapps_admin_tables_form_imp_add_field.tpl";
			}else{
				$tpl = "phpapps_admin_tables_form_imp_edit_field.tpl";
			}
			return $this->globals->sm->fetch( $tpl );
		}
		
	};
///////////////////////////
	class phpapps_admin_tables_form_impl  extends phpapps_admin_tables_form{
	
		public $popup = false;	

		public $nr_cols;
		public $col_names;
		public $col_types;
		public $col_sizes;
		public $col_defaults;
		public $col_fks;
		public $col_indexes;
		
		private $col_types_selects;
		private $col_fks_selects;
		private $col_idxs_selects;
		private $table_definition;
		
		private $create_table_str;
		private $custom_field;
		
		function __construct(){
			global $GLOBALS_OBJ;
			$this->globals = $GLOBALS_OBJ;
		echo "AICI 1<br>";	
			$this->MODULE_ID = $_GET["module_id"];
			$this->gact = $_GET["gact"];
			
			
			
			if($this->gact == "editRec"){
				$this->custom_field = new phpapps_admin_custom_table_field($this->MODULE_ID,"edit");
				$this->template = "phpapps_admin_tables_edit_form_imp.tpl";
				$this->globals->sm->assign(array(
					"FROM_IMP_CLASS"=>$this->custom_field->get_custom_table_str(),
					));
				$this->beforeSaveRec();	
			}else{
				$this->custom_field = new phpapps_admin_custom_table_field($this->MODULE_ID,"add");
				$this->template = "phpapps_admin_tables_form_imp.tpl";
				$this->globals->sm->assign(array(
					"FROM_IMP_CLASS"=>$this->custom_field->get_custom_table_str(),
					));
			}
			
			$sql = new DB_query("SELECT  
									MODULE_SCHEMA 
								FROM phpapps.view_modules 
								WHERE ID = :module_id",array(":module_id"=>$this->MODULE_ID));
								
			$this->globals->con->query($sql);
			$this->globals->con->next();
			
			$this->SCHEMA_ID = $this->globals->con->get_field("MODULE_SCHEMA");	
			
			
			if($_SERVER['REQUEST_METHOD'] === 'POST'){
			echo "AICI 1.2<br>";	
				$this->parse_post_vars();
				$this->setup_template();
			}
			
			$this->init();
			
			if($this->gact == "dropTable"){
				$this->dropTable();
			}
			$this->display();
		}
		
		function parse_post_vars(){
		//$this->parsePostVars()
					$this->nr_cols = $_POST["nr_cols"];
					$this->col_names = $_POST["col_names"];
					$this->col_types = $_POST["col_types"];
					$this->col_sizes = $_POST["col_sizes"];
					$this->col_defaults = $_POST["col_defaults"];
					$this->col_fks = $_POST["col_fks"];
					$this->col_indexes = $_POST["col_idxs"];
					$this->TABLE_NAME = $_POST["TABLE_NAME"];
					$this->DESCRIPTION = $_POST["DESCRIPTION"];
print_r($_POST);
			for($i = 0;$i < count($this->nr_cols);$i++){
			
				$sel_type = new DB_select("col_types[]","phpapps.list_mysql_column_types");
				$sel_type->selected_val = $this->col_types[$i];
				$sel_type->html_id = "col_type_".$i;
				$sel_type->setup_select_options();
				$this->col_types_selects[] = $sel_type->get_select_str();
				
				$sel_idx = new DB_select("col_idxs[]","phpapps.list_index_types");
				$sel_idx->selected_val = $this->col_indexes[$i];
				$sel_idx->html_id = "col_idx_" . $i;
				$sel_idx->setup_select_options();
				$this->col_idxs_selects[] = $sel_idx->get_select_str();
				
				$sel_fk = new DB_select("col_fks[]","list_fks");
				$sel_fk->selected_val = $this->col_fks[$i];
				$sel_fk->html_id = "col_fks_" . $i;
				$sel_fk->query = "SELECT CONCAT(ld.VALUE,'.',t.TABLE_NAME) AS VALUE, 
										 CONCAT(ld.VALUE,'.',t.TABLE_NAME) AS LABEL  
										 FROM phpapps.tables t, phpapps.view_modules m, phpapps.applications a, phpapps.list_databases ld 
										 WHERE t.MODULE_ID = m.ID AND 
										 m.APP_ID = a.ID AND 
										 a.APP_SCHEMA = ld.ID AND 
										 m.ID = :module_id ORDER BY VALUE";
				$sel_fk->query_params = array(":module_id" => $this->MODULE_ID);
				$sel_fk->setup_select_options();
				$this->col_fks_selects[] = $sel_fk->get_select_str();
				
				if($this->col_names[$i] == "" ){$this->errors[] = "Column name $i!!!";}
				if($this->col_types[$i] == "" ){$this->errors[] = "Column type $i!!!";}
//la text nu trebuie size				
				if($this->col_types[$i] != "TEXT"){
					if($this->col_sizes[$i] == "" ){$this->errors[] = "Column size $i!!!";}
				}
			}
			
			//if(count($this->errors) == 0){
				$this->setup_table_def();
			//}
		}
		
		function setup_template(){
				
			$this->custom_field->globals->sm->assign(array(
				"nr_cols" => $this->nr_cols,
				"col_names" => $this->col_names,
				"select_column_types" => $this->col_types_selects, 
				"col_sizes" => $this->col_sizes,
				"col_defaults" => $this->col_defaults,
				"select_column_indexes" => $this->col_idxs_selects,
				"select_column_fks" => $this->col_fks_selects,
			));
		}
		
		
		function setup_table_def(){
			
			$sql = new DB_query("SELECT a.APP_SCHEMA, 
								ld.VALUE FROM phpapps.view_modules m, phpapps.applications a, phpapps.list_databases ld 
								WHERE  m.APP_ID = a.ID AND 
								a.APP_SCHEMA = ld.ID AND 
								m.ID = :module_id ORDER BY VALUE",array(":module_id"=>$this->MODULE_ID));
			
			if( $this->globals->con->query($sql) == 1){
				$this->globals->con->next();
				$table_schema = $this->globals->con->get_field("VALUE");
			}
			$this->table_definition = new DB_table_def($table_schema,$this->TABLE_NAME);
			
			for($i = 0;$i < count($this->nr_cols);$i++){
				$this->table_definition->add_column_def(
					$this->col_names[$i],
					$this->col_types[$i],
					$this->col_sizes[$i],
					$this->col_defaults[$i],
					$this->col_fks[$i],
					$this->col_indexes[$i]
				);
			}
			//$this->addRec();
		}
			
		function afterGetRec(){
			echo "<h1>MIMI(".$this->TABLE_NAME.")</h1>";
			echo "<h1>MIMI(".$this->gfield_value.")</h1>";
			
			$sql = new DB_query("
							SELECT 
								
								ID,
								TABLE_ID,
								COLUMN_NAME,
								COLUMN_TYPE,
								COLUMN_SIZE,
								COLUMN_DEFAULT_VALUE,
								(SELECT VALUE FROM phpapps.list_databases WHER ID = FOREIGN_KEY_SCHEMA) AS 'FOREIGN_KEY_SCHEMA',
								(SELECT VALUE FROM phpapps.tables WHER ID = FOREIGN_KEY_TABLE ) AS 'FOREIGN_KEY_TABLE',
								FOREIGN_KEY_COLUMN,
								COLUMN_INDEX_TYPE,
								DESCRIPTION
							FROM phpapps.table_details
								WHERE  TABLE_ID = :table_id ",array(":table_id"=>$this->TABLE_ID));
					
						$this->nr_cols = $this->globals->con->query( $sql );
						
						while($res=$this->globals->con->fetch_array()){
							$this->col_names[] = $res["COLUMN_NAME"];
							$this->col_types[] = $res["COLUMN_TYPE"];
							$this->col_sizes[] = $res["COLUMN_SIZE"];
							$this->col_defaults[] = $res["COLUMN_DEFAULT_VALUE"];
							$this->col_fks[] = $res["FOREIGN_KEY_SCHEMA"].".".$res["FOREIGN_KEY_TABLE"];
							$this->col_indexes["COLUMN_INDEX_TYPE"];
							
							$this->custom_field->add_custom_field();
						}
					//$this->setup_template();
		}
		
		function beforeSaveRec(){
		
		
		//$edit_table_def = new phpapps_mytable_def($this->schema,$this->table, $this->MODULE_ID);
		//$edit_table_def = new phpapps_mytable_def($this->SCHEMA_ID,$this->gfield_value, $this->MODULE_ID);
		
		/*		
				$sqls[] = "DROP TABLE " . $this->TABLE_NAME;
				$sqls[] = stripslashes($this->CREATE_TABLE_QUERY);
				$sqls[] = "UPDATE phpapps.tables SET 
												MODULE_ID = '$this->MODULE_ID',
															TABLE_NAME = '$this->TABLE_NAME',
															CREATE_TABLE_QUERY = '$this->CREATE_TABLE_QUERY',
															DESCRIPTION = '$this->DESCRIPTION'
										
							WHERE ".$this->gfield." = '".$this->gfield_value."'";
							
				if( $this->globals->con->exec($sqls) != -1 ){
					header("Location:win_close.html");
				}else{
					$this->errors[] = "SQL error!!!";
				}
		*/
		}

		function addRec(){
			echo "AICI 1.3<br>";	
			//print_r($_POST);
			if(count($this->errors) > 0) return;
				
			$sql = new DB_query( $this->table_definition->get_create_str() );
			
			echo $this->table_definition->get_create_str();
			
			if( $this->globals->con->query( $sql ) != -1 ){
			
				$sql = new DB_query( "INSERT INTO phpapps.tables (
															MODULE_ID,
															SCHEMA_ID,
															TABLE_NAME,
															TABLE_TYPE,
															DESCRIPTION
									 ) VALUES (
															:module_id,
															:schema_id,
															:table_name,
															:table_type,
															:desc
												)",
									array(
										":module_id"=>$this->MODULE_ID,
										":schema_id"=>$this->SCHEMA_ID,
										":table_name"=>$this->TABLE_NAME,
										":table_type"=>$this->TABLE_TYPE,
										":desc"=>$this->DESCRIPTION
									));
												
				if( $this->globals->con->query( $sql ) != -1 ){
					$sql = new DB_query("SELECT ID FROM phpapps.tables WHERE MODULE_ID = :module_id AND
															SCHEMA_ID = :schema_id AND
															TABLE_NAME = :table_name",
											array(":module_id" => $this->MODULE_ID,
												":schema_id" => $this->SCHEMA_ID,
												":table_name" => $this->TABLE_NAME
												));
		echo "<br>";print_r($sql);echo "<br>";
					$this->globals->con->query( $sql );
					$this->globals->con->next();
					$this->TABLE_ID = $this->globals->con->get_field("ID");
				
					for($i = 0;$i < count($this->nr_cols);$i++){
						$FOREIGN_KEY_SCHEMA = "";
						$FOREIGN_KEY_TABLE = "";
						$FOREIGN_KEY_COLUMN = "";
						if($this->col_fks[$i] != ""){
							$temp_array = explode(".",$this->col_fks[$i]);
							$sql = new DB_query("SELECT ID FROM phpapps.list_databases WHERE VALUE = :val",array(":val"=>($temp_array[0] == "" ? "" : $temp_array[0])));
							if($this->globals->con->query($sql,"DB_list_getID") != -1){
								$this->globals->con->next("DB_list_getID");
								$FOREIGN_KEY_SCHEMA = $this->globals->con->get_field("ID","DB_list_getID");
							}
							
							$sql = new DB_query("SELECT ID FROM phpapps.tables WHERE TABLE_NAME = :val",array(":val"=>($temp_array[1] == "" ? "" : $temp_array[1])));
							if($this->globals->con->query($sql,"DB_list_getID") != -1){
								$this->globals->con->next("DB_list_getID");
								$FOREIGN_KEY_TABLE = $this->globals->con->get_field("ID","DB_list_getID");
							}
							
							$FOREIGN_KEY_COLUMN = "ID";
						}
						
						$sql = new DB_query("INSERT INTO phpapps.table_details (
								TABLE_ID,
								COLUMN_NAME,
								COLUMN_TYPE,
								COLUMN_SIZE,
								COLUMN_DEFAULT_VALUE,
								FOREIGN_KEY_SCHEMA,
								FOREIGN_KEY_TABLE,
								FOREIGN_KEY_COLUMN,
								COLUMN_INDEX_TYPE,
								DESCRIPTION)
							VALUES (
								:TABLE_ID,
								:COLUMN_NAME,
								:COLUMN_TYPE,
								:COLUMN_SIZE,
								:COLUMN_DEFAULT_VALUE,
								:FOREIGN_KEY_SCHEMA,
								:FOREIGN_KEY_TABLE,
								:FOREIGN_KEY_COLUMN,
								:COLUMN_INDEX_TYPE,
								:DESCRIPTION)",
								array(
								":TABLE_ID" => $this->TABLE_ID,
								":COLUMN_NAME" => $this->col_names[$i],
								":COLUMN_TYPE" => $this->col_types[$i],
								":COLUMN_SIZE" => $this->col_sizes[$i],
								":COLUMN_DEFAULT_VALUE" => $this->col_defaults[$i],
								":FOREIGN_KEY_SCHEMA" => $FOREIGN_KEY_SCHEMA,
								":FOREIGN_KEY_TABLE" => $FOREIGN_KEY_TABLE,
								":FOREIGN_KEY_COLUMN" => $FOREIGN_KEY_COLUMN,
								":COLUMN_INDEX_TYPE" => $this->col_indexes[$i],
								":DESCRIPTION" => ""));

								if( $this->globals->con->query( $sql ) == -1 ){
									print_r($this->globals->con->get_error());
								}
					}

				//	header("Location:phpapps_admin_module.php?module_id=".$this->MODULE_ID);
				}else{
					$this->errors[] = "SQL error: (".$sql->sql().")" . $this->globals->con->get_error();	
				}
				
			}else{
				$this->errors[] = "SQL error: (".$sql->sql().")" . $this->globals->con->get_error();
			}
		}
		
		function deleteRec(){
			$sql = new DB_query( "SELECT TABLE_NAME, TABLE_SCHEMA
					FROM phpapps.view_tables 
					WHERE ".$this->gfield." = :".$this->gfield." AND MODULE_ID = :module_id",
					array(":".$this->gfield => $this->gfield_value,":module_id"=>$this->MODULE_ID));
			//echo $sql->sql();
			$this->globals->con->query( $sql );
			$this->globals->con->next();
			$this->TABLE_NAME = $this->globals->con->get_field("TABLE_NAME");
				
				$sql = new DB_query("DELETE FROM phpapps.tables 
					WHERE ".$this->gfield." = :".$this->gfield , array(":".$this->gfield => $this->gfield_value));
//print_r($sql);				
				if( $this->globals->con->query($sql) != -1 ){
					//header("Location:phpapps_admin_module.php?module_id=".$this->MODULE_ID);
					header("Location:win_close.html");
				}else{
					$this->errors[] = "SQL error: (".$sql->sql().")" . $this->globals->con->get_error();	
				}
			
			//header("Location:win_close.html");
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
	};
	
	$phpapps_admin_tables_form_Impl = new phpapps_admin_tables_form_impl();
?>