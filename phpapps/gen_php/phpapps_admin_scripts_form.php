<?php
// includes
require_once ("globals.php");

class phpapps_admin_scripts_form{
	private $globals;
	public $schema = "phpapps";
	public $table = "scripts";
	public $template = "gen_tpl/phpapps_admin_scripts_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
		public $MODULE_ID;
		public $SCRIPT_TYPE;
		public $SCRIPT_NAME;
		public $DESCRIPTION;
		
		 
			public $SCRIPT_TYPE_sel;
	 
		 
		 
			
		 
		 
		 
		 
	
	public $errors = array();
	
	function __contruct(){
	}
		
	function init(){
		global $GLOBALS_OBJ;
		$this->globals = $GLOBALS_OBJ;
		if($_SERVER['REQUEST_METHOD'] === 'POST') {
			$this->parsePostVars();
		} else {
			$this->parseGetVars();
		}
	}
	
	function getRec(){
		$sql = new DB_query( "SELECT 
									MODULE_ID,
												SCRIPT_TYPE,
												SCRIPT_NAME,
												DESCRIPTION
							
				FROM ".$this->schema.".".$this->table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($sql);
			$this->globals->con->next();
							$this->MODULE_ID = $this->globals->con->get_field("MODULE_ID");
							$this->SCRIPT_TYPE = $this->globals->con->get_field("SCRIPT_TYPE");
							$this->SCRIPT_NAME = $this->globals->con->get_field("SCRIPT_NAME");
							$this->DESCRIPTION = $this->globals->con->get_field("DESCRIPTION");
						
	}
	
	
	function beforeAddRec(){
	}
	
	function addRec(){
		$this->beforeAddRec();
	
		$this->check_errors();
		$sql = new DB_query("INSERT INTO ".$this->schema.".".$this->table." (
									MODULE_ID,
												SCRIPT_TYPE,
												SCRIPT_NAME,
												DESCRIPTION
						 ) VALUES (
									:MODULE_ID,
												:SCRIPT_TYPE,
												:SCRIPT_NAME,
												:DESCRIPTION
									)",
			array(
									":MODULE_ID" => $this->MODULE_ID,
									":SCRIPT_TYPE" => $this->SCRIPT_TYPE,
									":SCRIPT_NAME" => $this->SCRIPT_NAME,
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
									MODULE_ID = :MODULE_ID,
												SCRIPT_TYPE = :SCRIPT_TYPE,
												SCRIPT_NAME = :SCRIPT_NAME,
												DESCRIPTION = :DESCRIPTION
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
									":MODULE_ID" => $this->MODULE_ID,
									":SCRIPT_TYPE" => $this->SCRIPT_TYPE,
									":SCRIPT_NAME" => $this->SCRIPT_NAME,
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
		$this->globals->con->query($sql);
		
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
				$this->getRec();
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
		
					$this->MODULE_ID  = addslashes(trim($_POST["MODULE_ID"]));
					$this->SCRIPT_TYPE  = addslashes(trim($_POST["SCRIPT_TYPE"]));
					$this->SCRIPT_NAME  = addslashes(trim($_POST["SCRIPT_NAME"]));
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
				if($this->MODULE_ID == "") {
			$this->errors[] = "Campul MODULE_ID este obligatoriu!";
		}
				if($this->SCRIPT_NAME == "") {
			$this->errors[] = "Campul SCRIPT_NAME este obligatoriu!";
		}
			}
	
	function setup_display(){
					 
								$this->SCRIPT_TYPE_sel = new DB_select("SCRIPT_TYPE","phpapps.list_script_types");
			$this->SCRIPT_TYPE_sel->selected_val = $this->SCRIPT_TYPE;
			$this->SCRIPT_TYPE_sel->setup_select_options();
			 
					 
					 
				
					 
					 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
							"MODULE_ID" => $this->MODULE_ID,
							"SCRIPT_TYPE" => $this->SCRIPT_TYPE,
							"SCRIPT_NAME" => $this->SCRIPT_NAME,
							"DESCRIPTION" => $this->DESCRIPTION,
									 
										"SCRIPT_TYPE_sel" => $this->SCRIPT_TYPE_sel->get_select_str(),
			 
						 
						 
									 
						 
						 
						 
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
	}
	
	function get_html_str(){	
		$this->setup_display();
		
		$this->beforeDisplay();
		
		$this->globals->sm->fetch($this->template);
	}
};
?>