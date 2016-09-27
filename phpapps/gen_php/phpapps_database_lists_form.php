<?php
// includes
require_once ("globals.php");

class phpapps_database_lists_form{
	public $globals;
	public $schema = "phpapps";
	public $table = "tables";
	public $template = "gen_tpl/phpapps_database_lists_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
		public $ID;
		public $ORIGIN_ID;
		public $MODULE_ID;
		public $SCHEMA_ID;
		public $TABLE_NAME;
		public $TABLE_TYPE;
		public $DESCRIPTION;
		
		 
		 
		 
		 
		 
		 
		 
			
		 
		 
		 
		 
		 
		 
		 
	
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
									ID,
												ORIGIN_ID,
												MODULE_ID,
												SCHEMA_ID,
												TABLE_NAME,
												TABLE_TYPE,
												DESCRIPTION
							
				FROM ".$this->schema.".".$this->table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($sql);
			$this->globals->con->next();
							$this->ID = stripslashes($this->globals->con->get_field("ID"));
							$this->ORIGIN_ID = stripslashes($this->globals->con->get_field("ORIGIN_ID"));
							$this->MODULE_ID = stripslashes($this->globals->con->get_field("MODULE_ID"));
							$this->SCHEMA_ID = stripslashes($this->globals->con->get_field("SCHEMA_ID"));
							$this->TABLE_NAME = stripslashes($this->globals->con->get_field("TABLE_NAME"));
							$this->TABLE_TYPE = stripslashes($this->globals->con->get_field("TABLE_TYPE"));
							$this->DESCRIPTION = stripslashes($this->globals->con->get_field("DESCRIPTION"));
						
	}
	
	function afterGetRec(){
	}
	
	function beforeAddRec(){
	}
	
	function addRec(){
		$this->beforeAddRec();
	
		$this->check_errors();
		$sql = new DB_query("INSERT INTO ".$this->schema.".".$this->table." (
									ID,
												ORIGIN_ID,
												MODULE_ID,
												SCHEMA_ID,
												TABLE_NAME,
												TABLE_TYPE,
												DESCRIPTION
						 ) VALUES (
									:ID,
												:ORIGIN_ID,
												:MODULE_ID,
												:SCHEMA_ID,
												:TABLE_NAME,
												:TABLE_TYPE,
												:DESCRIPTION
									)",
			array(
									":ID" => $this->ID,
									":ORIGIN_ID" => $this->ORIGIN_ID,
									":MODULE_ID" => $this->MODULE_ID,
									":SCHEMA_ID" => $this->SCHEMA_ID,
									":TABLE_NAME" => $this->TABLE_NAME,
									":TABLE_TYPE" => $this->TABLE_TYPE,
									":DESCRIPTION" => $this->DESCRIPTION,
							)
			);
print_r($sql);
		if(count($this->errors) == 0) {	
			if( $this->globals->con->query($sql) == -1){
                            $this->errors[] = $this->globals->con->get_error();
                        }
		}
		
		$this->afterAddRec();
	}
	
	function afterAddRec(){
		//header("Location:win_close.html");
	}
	
	function beforeSaveRec(){
	}
	
	function saveRec(){
		$this->beforeSaveRec();
		
		$this->check_errors();
		
		$sql = new DB_query("UPDATE ".$this->schema.".".$this->table." SET 
									ID = :ID,
												ORIGIN_ID = :ORIGIN_ID,
												MODULE_ID = :MODULE_ID,
												SCHEMA_ID = :SCHEMA_ID,
												TABLE_NAME = :TABLE_NAME,
												TABLE_TYPE = :TABLE_TYPE,
												DESCRIPTION = :DESCRIPTION
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
									":ID" => $this->ID,
									":ORIGIN_ID" => $this->ORIGIN_ID,
									":MODULE_ID" => $this->MODULE_ID,
									":SCHEMA_ID" => $this->SCHEMA_ID,
									":TABLE_NAME" => $this->TABLE_NAME,
									":TABLE_TYPE" => $this->TABLE_TYPE,
									":DESCRIPTION" => $this->DESCRIPTION,
								":".$this->gfield => $this->gfield_value
			)	
			);
				
		if(count($this->errors) == 0) {	
			if( $this->globals->con->query($sql) == -1){
                            $this->errors[] = $this->globals->con->get_error();
                        }
		};
		
		$this->afterSaveRec();
	}
	
	function afterSaveRec(){
		//header("Location:win_close.html");
	}

	function beforeDeleteRec(){
	}
	
	function deleteRec(){
		$this->beforeDeleteRec();
		
		$sql = new DB_query("DELETE FROM ".$this->schema.".".$this->table."
				WHERE ".$this->gfield." = :".$this->gfield, array(":".$this->gfield=>$this->gfield_value) );
				
		if(count($this->errors) == 0) {
			if( $this->globals->con->query($sql) == -1){
                            $this->errors[] = $this->globals->con->get_error();
                        }
		}
		
		$this->afterDeleteRec();
	}
	
	function afterDeleteRec(){
		//header("Location:win_close.html");
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
		
					$this->ID  = addslashes(trim($_POST["ID"]));
					$this->ORIGIN_ID  = addslashes(trim($_POST["ORIGIN_ID"]));
					$this->MODULE_ID  = addslashes(trim($_POST["MODULE_ID"]));
					$this->SCHEMA_ID  = addslashes(trim($_POST["SCHEMA_ID"]));
					$this->TABLE_NAME  = addslashes(trim($_POST["TABLE_NAME"]));
					$this->TABLE_TYPE  = addslashes(trim($_POST["TABLE_TYPE"]));
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
			}
	
	function setup_display(){
					 
					 
					 
					 
					 
					 
					 
				
					 
					 
					 
					 
					 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
							"ID" => $this->ID,
							"ORIGIN_ID" => $this->ORIGIN_ID,
							"MODULE_ID" => $this->MODULE_ID,
							"SCHEMA_ID" => $this->SCHEMA_ID,
							"TABLE_NAME" => $this->TABLE_NAME,
							"TABLE_TYPE" => $this->TABLE_TYPE,
							"DESCRIPTION" => $this->DESCRIPTION,
									 
						 
						 
						 
						 
						 
						 
									 
						 
						 
						 
						 
						 
						 
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
}
?>