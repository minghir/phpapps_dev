<?php
// includes
require_once ("globals.php");

class phpapps_admin_forms_form{
	public $globals;
	public $schema = "phpapps";
	public $table = "forms";
	public $template = "gen_tpl/phpapps_admin_forms_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
		public $ID;
		public $MODULE_ID;
		public $FORM_NAME;
		public $TABLE_ID;
		public $FORM_QUERY;
		public $FORM_PHP_DIR;
		public $FORM_TPL_DIR;
		public $DESCRIPTION;
		
		 
		 
		 
		 
		 
		 
		 
		 
			
		 
			public $MODULE_ID_sel;
	 
		 
			public $TABLE_ID_sel;
	 
		 
		 
		 
		 
	
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
												MODULE_ID,
												FORM_NAME,
												TABLE_ID,
												FORM_QUERY,
												FORM_PHP_DIR,
												FORM_TPL_DIR,
												DESCRIPTION
							
				FROM ".$this->schema.".".$this->table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($sql);
			$this->globals->con->next();
							$this->ID = $this->globals->con->get_field("ID");
							$this->MODULE_ID = $this->globals->con->get_field("MODULE_ID");
							$this->FORM_NAME = $this->globals->con->get_field("FORM_NAME");
							$this->TABLE_ID = $this->globals->con->get_field("TABLE_ID");
							$this->FORM_QUERY = $this->globals->con->get_field("FORM_QUERY");
							$this->FORM_PHP_DIR = $this->globals->con->get_field("FORM_PHP_DIR");
							$this->FORM_TPL_DIR = $this->globals->con->get_field("FORM_TPL_DIR");
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
									ID,
												MODULE_ID,
												FORM_NAME,
												TABLE_ID,
												FORM_QUERY,
												FORM_PHP_DIR,
												FORM_TPL_DIR,
												DESCRIPTION
						 ) VALUES (
									:ID,
												:MODULE_ID,
												:FORM_NAME,
												:TABLE_ID,
												:FORM_QUERY,
												:FORM_PHP_DIR,
												:FORM_TPL_DIR,
												:DESCRIPTION
									)",
			array(
									":ID" => $this->ID,
									":MODULE_ID" => $this->MODULE_ID,
									":FORM_NAME" => $this->FORM_NAME,
									":TABLE_ID" => $this->TABLE_ID,
									":FORM_QUERY" => $this->FORM_QUERY,
									":FORM_PHP_DIR" => $this->FORM_PHP_DIR,
									":FORM_TPL_DIR" => $this->FORM_TPL_DIR,
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
									ID = :ID,
												MODULE_ID = :MODULE_ID,
												FORM_NAME = :FORM_NAME,
												TABLE_ID = :TABLE_ID,
												FORM_QUERY = :FORM_QUERY,
												FORM_PHP_DIR = :FORM_PHP_DIR,
												FORM_TPL_DIR = :FORM_TPL_DIR,
												DESCRIPTION = :DESCRIPTION
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
									":ID" => $this->ID,
									":MODULE_ID" => $this->MODULE_ID,
									":FORM_NAME" => $this->FORM_NAME,
									":TABLE_ID" => $this->TABLE_ID,
									":FORM_QUERY" => $this->FORM_QUERY,
									":FORM_PHP_DIR" => $this->FORM_PHP_DIR,
									":FORM_TPL_DIR" => $this->FORM_TPL_DIR,
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
		
					$this->ID  = addslashes(trim($_POST["ID"]));
					$this->MODULE_ID  = addslashes(trim($_POST["MODULE_ID"]));
					$this->FORM_NAME  = addslashes(trim($_POST["FORM_NAME"]));
					$this->TABLE_ID  = addslashes(trim($_POST["TABLE_ID"]));
					$this->FORM_QUERY  = addslashes(trim($_POST["FORM_QUERY"]));
					$this->FORM_PHP_DIR  = addslashes(trim($_POST["FORM_PHP_DIR"]));
					$this->FORM_TPL_DIR  = addslashes(trim($_POST["FORM_TPL_DIR"]));
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
					 
					 
					 
					 
					 
					 
					 
					 
				
					 
									$this->MODULE_ID_sel = new DB_select("MODULE_ID","phpapps.modules");
				$this->MODULE_ID_sel->query = "SELECT ID AS VALUE, MODULE_NAME AS LABEL FROM phpapps.modules ORDER BY MODULE_NAME";
				$this->MODULE_ID_sel->selected_val = $this->MODULE_ID;
				$this->MODULE_ID_sel->setup_select_options();
			 
					 
									$this->TABLE_ID_sel = new DB_select("TABLE_ID","phpapps.tables");
				$this->TABLE_ID_sel->query = "SELECT ID AS VALUE, TABLE_NAME AS LABEL FROM phpapps.tables ORDER BY TABLE_NAME";
				$this->TABLE_ID_sel->selected_val = $this->TABLE_ID;
				$this->TABLE_ID_sel->setup_select_options();
			 
					 
					 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
							"ID" => $this->ID,
							"MODULE_ID" => $this->MODULE_ID,
							"FORM_NAME" => $this->FORM_NAME,
							"TABLE_ID" => $this->TABLE_ID,
							"FORM_QUERY" => $this->FORM_QUERY,
							"FORM_PHP_DIR" => $this->FORM_PHP_DIR,
							"FORM_TPL_DIR" => $this->FORM_TPL_DIR,
							"DESCRIPTION" => $this->DESCRIPTION,
									 
						 
						 
						 
						 
						 
						 
						 
									 
										"MODULE_ID_sel" => $this->MODULE_ID_sel->get_select_str(),
			 
						 
										"TABLE_ID_sel" => $this->TABLE_ID_sel->get_select_str(),
			 
						 
						 
						 
						 
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