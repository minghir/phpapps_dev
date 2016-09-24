<?php
require_once ("globals.php");
include ("gen_php/phpapps_admin_table_details_form.php");
	class phpapps_admin_table_details_form_impl extends phpapps_admin_table_details_form{
		var $TABLE_NAME = "";
		var $TABLE_SCHEMA = "";
		var $AFTER_COL = "";
		
		public function __construct() {
			parent::__construct();
		
			$this->template = "phpapps_admin_table_details_form_imp.tpl";
			$this->TABLE_ID = $_GET["table_id"];
			
			
			$sql = new DB_query("SELECT TABLE_SCHEMA, TABLE_NAME FROM phpapps.view_tables WHERE ID = :table_id",
								array(":table_id" => $this->TABLE_ID));

			if( $this->globals->con->query($sql) == -1 ){
			}else{
				$this->globals->con->next();
				$this->TABLE_NAME = $this->globals->con->get_field("TABLE_NAME");
				$this->TABLE_SCHEMA = $this->globals->con->get_field("TABLE_SCHEMA");
			}
			$this->init();
			$this->display();
		}
		
		function dropColumn(){
			if($this->FOREIGN_KEY_TABLE_ID != ''){
				$fk_name = " DROP FOREIGN KEY ".
						(new DB_list("list_databases"))->getValue($this->FOREIGN_KEY_SCHEMA_ID) . "_" .
						(new DB_table("tables"))->getValue("TABLE_NAME",$this->FOREIGN_KEY_TABLE_ID) ."_". $this->COLUMN_NAME."_FK,";
						
			}
				
			$alter_str = "ALTER TABLE " . $this->TABLE_SCHEMA . "." . $this->TABLE_NAME . " $fk_name DROP COLUMN " . $this->COLUMN_NAME;
			
			
			$sql =  new DB_query( $alter_str );
			if( $this->globals->con->query($sql) == -1 ){
				$this->errors[] = "ERROARE>".$this->globals->con->get_error();
			}else{
			}
		}
		
		function addColumn(){	
			$fk_table = (new DB_list("list_databases"))->getValue($this->FOREIGN_KEY_SCHEMA_ID) . "." .
						(new DB_table("tables"))->getValue("TABLE_NAME",$this->FOREIGN_KEY_TABLE_ID);
		
			$def = new DB_column_def($this->COLUMN_NAME,
									$this->COLUMN_TYPE_ID,
									$this->COLUMN_SIZE,
									$this->COLUMN_DEFAULT_VALUE,
									$fk_table,
									$this->COLUMN_INDEX_TYPE_ID
									);
									
			$alter_str = "ALTER TABLE " . $this->TABLE_SCHEMA . "." . $this->TABLE_NAME . 
							" ADD COLUMN " . $def->column_str() . 
							" AFTER ".$this->AFTER_COL;// .", ADD " . $def->reference_str();
									
			if($this->FOREIGN_KEY_SCHEMA_ID != '' && $this->FOREIGN_KEY_TABLE_ID != ''){
				$fk_name = str_replace(".","_",$fk_table) . "_" . $this->COLUMN_NAME . "_FK";
				$alter_str .= ", ADD CONSTRAINT ".$fk_name." " . $def->reference_str();
			}
			
			if($this->COLUMN_INDEX_TYPE_ID != '5'){
				//$alter_str .= ", ADD " . $def->reference_str();
				$alter_str .= ", ADD " . $def->index_str() ;
			}
		
			$sql =  new DB_query( $alter_str );
		
print_r($sql);			

//exit();

			if( $this->globals->con->query($sql) == -1 ){
				$this->errors[] = "ERROARE>".$this->globals->con->get_error();
			}else{
			}

		}
		
		function beforeGetRec(){
		}
		
		function afterGetRec(){
		}
	
		function beforeAddRec(){
			$this->addColumn();
			//print_r($this);
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
			$this->getRec();
			$this->dropColumn();
		}
		
		function afterDeleteRec(){
			$this->globals->con->print_log();
			print_r($this->errors);
			//header("Location:win_close.html");
		}
		
		function beforeDisplay(){	
			
			$AFTER_COL_SEL = new DB_select("AFTER_COL","view_table_details");
			$AFTER_COL_SEL->query = "SELECT COLUMN_NAME,COLUMN_NAME FROM phpapps.view_table_details WHERE TABLE_ID = :table_id";
			$AFTER_COL_SEL->query_params[":table_id"] = $this->TABLE_ID;
			$AFTER_COL_SEL->empty_option = false;
			$AFTER_COL_SEL->setup_select_options();

			$str = "<tr><td align='right'>AFTER:</td><td>".$AFTER_COL_SEL->get_select_str()."</td></tr>";
			$this->COLUMN_INDEX_TYPE_ID_sel->empty_option = false;
			$this->COLUMN_INDEX_TYPE_ID_sel->setup_select_options();
			
			$this->globals->sm->assign(array(
											"FROM_IMP_CLASS" => $str,
											"COLUMN_INDEX_TYPE_ID_sel" => $this->COLUMN_INDEX_TYPE_ID_sel->get_select_str(),
										));
			
		}
		
		function afterDisplay(){	
		}
		
		function parsePostVars(){
			$this->AFTER_COL = addslashes(trim($_POST["AFTER_COL"]));
			parent::parsePostVars();
		}
		
	};
	
	$phpapps_admin_table_details_form_Impl = new phpapps_admin_table_details_form_impl();
?>