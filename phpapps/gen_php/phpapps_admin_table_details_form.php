<?php
// includes
require_once ("globals.php");

class phpapps_admin_table_details_form{
	public $globals;
	public $schema = "phpapps";
	public $table = "table_details";
	public $template = "gen_tpl/phpapps_admin_table_details_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
		public $TABLE_ID;
		public $COLUMN_NAME;
		public $COLUMN_TYPE_ID;
		public $COLUMN_SIZE;
		public $COLUMN_DEFAULT_VALUE;
		public $FOREIGN_KEY_SCHEMA_ID;
		public $FOREIGN_KEY_TABLE_ID;
		public $COLUMN_INDEX_TYPE_ID;
		public $DESCRIPTION;
		
		 
		 
			public $COLUMN_TYPE_ID_sel;
	 
		 
		 
			public $FOREIGN_KEY_SCHEMA_ID_sel;
	 
		 
			public $COLUMN_INDEX_TYPE_ID_sel;
	 
		 
			
		 
		 
		 
		 
		 
		 
			public $FOREIGN_KEY_TABLE_ID_sel;
	 
		 
		 
	
	public $errors = array();
	
	function __construct(){
		global $GLOBALS_OBJ;
		$this->globals = $GLOBALS_OBJ;
	}
		
	function init(){
		if($_SERVER['REQUEST_METHOD'] === 'POST') {
			$this->parsePostVars();
		} else {
			$this->parseGetVars();
		}
	}
	
	function beforeGetRec(){
	}
	
	function getRec(){
		$sql = new DB_query( "SELECT 
									TABLE_ID,
												COLUMN_NAME,
												COLUMN_TYPE_ID,
												COLUMN_SIZE,
												COLUMN_DEFAULT_VALUE,
												FOREIGN_KEY_SCHEMA_ID,
												FOREIGN_KEY_TABLE_ID,
												COLUMN_INDEX_TYPE_ID,
												DESCRIPTION
							
				FROM ".$this->schema.".".$this->table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($sql);
			$this->globals->con->next();
							$this->TABLE_ID = $this->globals->con->get_field("TABLE_ID");
							$this->COLUMN_NAME = $this->globals->con->get_field("COLUMN_NAME");
							$this->COLUMN_TYPE_ID = $this->globals->con->get_field("COLUMN_TYPE_ID");
							$this->COLUMN_SIZE = $this->globals->con->get_field("COLUMN_SIZE");
							$this->COLUMN_DEFAULT_VALUE = $this->globals->con->get_field("COLUMN_DEFAULT_VALUE");
							$this->FOREIGN_KEY_SCHEMA_ID = $this->globals->con->get_field("FOREIGN_KEY_SCHEMA_ID");
							$this->FOREIGN_KEY_TABLE_ID = $this->globals->con->get_field("FOREIGN_KEY_TABLE_ID");
							$this->COLUMN_INDEX_TYPE_ID = $this->globals->con->get_field("COLUMN_INDEX_TYPE_ID");
							$this->DESCRIPTION = $this->globals->con->get_field("DESCRIPTION");
						
	}
	
	function afterGetRec(){
	}
	
	function beforeAddRec(){
	}
	
	function addRec(){
		$this->beforeAddRec();
	
		$this->check_errors();
		$sql = new DB_query("INSERT INTO ".$this->schema.".".$this->table." (
									TABLE_ID,
												COLUMN_NAME,
												COLUMN_TYPE_ID,
												COLUMN_SIZE,
												COLUMN_DEFAULT_VALUE,
												FOREIGN_KEY_SCHEMA_ID,
												FOREIGN_KEY_TABLE_ID,
												COLUMN_INDEX_TYPE_ID,
												DESCRIPTION
						 ) VALUES (
									:TABLE_ID,
												:COLUMN_NAME,
												:COLUMN_TYPE_ID,
												:COLUMN_SIZE,
												:COLUMN_DEFAULT_VALUE,
												:FOREIGN_KEY_SCHEMA_ID,
												:FOREIGN_KEY_TABLE_ID,
												:COLUMN_INDEX_TYPE_ID,
												:DESCRIPTION
									)",
			array(
									":TABLE_ID" => $this->TABLE_ID,
									":COLUMN_NAME" => $this->COLUMN_NAME,
									":COLUMN_TYPE_ID" => $this->COLUMN_TYPE_ID,
									":COLUMN_SIZE" => $this->COLUMN_SIZE,
									":COLUMN_DEFAULT_VALUE" => $this->COLUMN_DEFAULT_VALUE,
									":FOREIGN_KEY_SCHEMA_ID" => $this->FOREIGN_KEY_SCHEMA_ID,
									":FOREIGN_KEY_TABLE_ID" => $this->FOREIGN_KEY_TABLE_ID,
									":COLUMN_INDEX_TYPE_ID" => $this->COLUMN_INDEX_TYPE_ID,
									":DESCRIPTION" => $this->DESCRIPTION,
							)
			);

		if(count($this->errors) == 0) {	
			$this->globals->con->query($sql);
		}
		
		$this->afterAddRec();
	}
	
	function afterAddRec(){
		header("Location:win_close.html");
	}
	
	function beforeSaveRec(){
	}
	
	function saveRec(){
		$this->beforeSaveRec();
		
		$this->check_errors();
		
		$sql = new DB_query("UPDATE ".$this->schema.".".$this->table." SET 
									TABLE_ID = :TABLE_ID,
												COLUMN_NAME = :COLUMN_NAME,
												COLUMN_TYPE_ID = :COLUMN_TYPE_ID,
												COLUMN_SIZE = :COLUMN_SIZE,
												COLUMN_DEFAULT_VALUE = :COLUMN_DEFAULT_VALUE,
												FOREIGN_KEY_SCHEMA_ID = :FOREIGN_KEY_SCHEMA_ID,
												FOREIGN_KEY_TABLE_ID = :FOREIGN_KEY_TABLE_ID,
												COLUMN_INDEX_TYPE_ID = :COLUMN_INDEX_TYPE_ID,
												DESCRIPTION = :DESCRIPTION
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
									":TABLE_ID" => $this->TABLE_ID,
									":COLUMN_NAME" => $this->COLUMN_NAME,
									":COLUMN_TYPE_ID" => $this->COLUMN_TYPE_ID,
									":COLUMN_SIZE" => $this->COLUMN_SIZE,
									":COLUMN_DEFAULT_VALUE" => $this->COLUMN_DEFAULT_VALUE,
									":FOREIGN_KEY_SCHEMA_ID" => $this->FOREIGN_KEY_SCHEMA_ID,
									":FOREIGN_KEY_TABLE_ID" => $this->FOREIGN_KEY_TABLE_ID,
									":COLUMN_INDEX_TYPE_ID" => $this->COLUMN_INDEX_TYPE_ID,
									":DESCRIPTION" => $this->DESCRIPTION,
								":".$this->gfield => $this->gfield_value
			)	
			);
				
		if(count($this->errors) == 0) {	
			$this->globals->con->query($sql);
		};
		
		$this->afterSaveRec();
	}
	
	function afterSaveRec(){
		header("Location:win_close.html");
	}

	function beforeDeleteRec(){
	}
	
	function deleteRec(){
		$this->beforeDeleteRec();
		
		$sql = new DB_query("DELETE FROM ".$this->schema.".".$this->table."
				WHERE ".$this->gfield." = :".$this->gfield, array(":".$this->gfield=>$this->gfield_value) );
				
		if(count($this->errors) == 0) {	
			$this->globals->con->query($sql);
		}
		
		$this->afterDeleteRec();
	}
	
	function afterDeleteRec(){
		header("Location:win_close.html");
	}
	
	function parseGetVars(){
		$this->gact = trim($_GET["gact"]);
		$this->gfield = trim($_GET["gfield"]);
		$this->gfield_value = trim($_GET["gfield_value"]);
		
			switch($this->gact){
			case "editRec":
				$this->beforeGetRec();
				$this->getRec();
				$this->afterGetRec();
			break;
			case "deleteRec":
				$this->deleteRec();
			break;
			case "addRec":
			break;
		}
	}
	
	function parsePostVars(){
		$this->pact = $_POST["pact"];
		$this->gact = $_POST["gact"];
		$this->gfield = $_POST["gfield"];
		$this->gfield_value = $_POST["gfield_value"];
		
					$this->TABLE_ID  = addslashes(trim($_POST["TABLE_ID"]));
					$this->COLUMN_NAME  = addslashes(trim($_POST["COLUMN_NAME"]));
					$this->COLUMN_TYPE_ID  = addslashes(trim($_POST["COLUMN_TYPE_ID"]));
					$this->COLUMN_SIZE  = addslashes(trim($_POST["COLUMN_SIZE"]));
					$this->COLUMN_DEFAULT_VALUE  = addslashes(trim($_POST["COLUMN_DEFAULT_VALUE"]));
					$this->FOREIGN_KEY_SCHEMA_ID  = addslashes(trim($_POST["FOREIGN_KEY_SCHEMA_ID"]));
					$this->FOREIGN_KEY_TABLE_ID  = addslashes(trim($_POST["FOREIGN_KEY_TABLE_ID"]));
					$this->COLUMN_INDEX_TYPE_ID  = addslashes(trim($_POST["COLUMN_INDEX_TYPE_ID"]));
					$this->DESCRIPTION  = addslashes(trim($_POST["DESCRIPTION"]));
				
		switch($this->pact){
			case "addRec":
				$this->addRec();
			break;
			case "saveRec":
				$this->saveRec();
			break;
			case "deleteRec":
				$this->deleteRec();
			break;
		}
		
	}
	
	function check_errors(){
				if($this->TABLE_ID == "") {
			$this->errors[] = "Campul TABLE_ID este obligatoriu!";
		}
				if($this->COLUMN_NAME == "") {
			$this->errors[] = "Campul COLUMN_NAME este obligatoriu!";
		}
				if($this->COLUMN_TYPE_ID == "") {
			$this->errors[] = "Campul COLUMN_TYPE_ID este obligatoriu!";
		}
			}
	
	function setup_display(){
					 
					 
								$this->COLUMN_TYPE_ID_sel = new DB_select("COLUMN_TYPE_ID","phpapps.list_mysql_column_types");
			$this->COLUMN_TYPE_ID_sel->selected_val = $this->COLUMN_TYPE_ID;
			$this->COLUMN_TYPE_ID_sel->setup_select_options();
			 
					 
					 
								$this->FOREIGN_KEY_SCHEMA_ID_sel = new DB_select("FOREIGN_KEY_SCHEMA_ID","phpapps.list_databases");
			$this->FOREIGN_KEY_SCHEMA_ID_sel->selected_val = $this->FOREIGN_KEY_SCHEMA_ID;
			$this->FOREIGN_KEY_SCHEMA_ID_sel->setup_select_options();
			 
					 
								$this->COLUMN_INDEX_TYPE_ID_sel = new DB_select("COLUMN_INDEX_TYPE_ID","phpapps.list_index_types");
			$this->COLUMN_INDEX_TYPE_ID_sel->selected_val = $this->COLUMN_INDEX_TYPE_ID;
			$this->COLUMN_INDEX_TYPE_ID_sel->setup_select_options();
			 
					 
				
					 
					 
					 
					 
					 
					 
									$this->FOREIGN_KEY_TABLE_ID_sel = new DB_select("FOREIGN_KEY_TABLE_ID","phpapps.tables");
				$this->FOREIGN_KEY_TABLE_ID_sel->query = "SELECT ID AS VALUE, TABLE_NAME AS LABEL FROM phpapps.tables ORDER BY TABLE_NAME";
				$this->FOREIGN_KEY_TABLE_ID_sel->selected_val = $this->FOREIGN_KEY_TABLE_ID;
				$this->FOREIGN_KEY_TABLE_ID_sel->setup_select_options();
			 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
							"TABLE_ID" => $this->TABLE_ID,
							"COLUMN_NAME" => $this->COLUMN_NAME,
							"COLUMN_TYPE_ID" => $this->COLUMN_TYPE_ID,
							"COLUMN_SIZE" => $this->COLUMN_SIZE,
							"COLUMN_DEFAULT_VALUE" => $this->COLUMN_DEFAULT_VALUE,
							"FOREIGN_KEY_SCHEMA_ID" => $this->FOREIGN_KEY_SCHEMA_ID,
							"FOREIGN_KEY_TABLE_ID" => $this->FOREIGN_KEY_TABLE_ID,
							"COLUMN_INDEX_TYPE_ID" => $this->COLUMN_INDEX_TYPE_ID,
							"DESCRIPTION" => $this->DESCRIPTION,
									 
						 
										"COLUMN_TYPE_ID_sel" => $this->COLUMN_TYPE_ID_sel->get_select_str(),
			 
						 
						 
										"FOREIGN_KEY_SCHEMA_ID_sel" => $this->FOREIGN_KEY_SCHEMA_ID_sel->get_select_str(),
			 
						 
										"COLUMN_INDEX_TYPE_ID_sel" => $this->COLUMN_INDEX_TYPE_ID_sel->get_select_str(),
			 
						 
									 
						 
						 
						 
						 
						 
										"FOREIGN_KEY_TABLE_ID_sel" => $this->FOREIGN_KEY_TABLE_ID_sel->get_select_str(),
			 
						 
						 
						"pact" => $this->pact,
			"gact" => $this->gact,
			"gfield" => $this->gfield,
			"gfield_value" => $this->gfield_value,
			"error_msg" => $error_msg,
		));
	}
	
	function beforeDisplay(){	
	}
	
	function display(){	
		$this->setup_display();
		
		$this->beforeDisplay();
		
		$this->globals->sm->display($this->template);
		
		$this->afterDisplay();
	}
	
	function afterDisplay(){	
	}
	
	function get_html_str(){	
		$this->setup_display();
		
		$this->beforeDisplay();
		
		$this->globals->sm->fetch($this->template);
	}
};
?>