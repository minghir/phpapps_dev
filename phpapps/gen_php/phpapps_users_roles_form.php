<?php
// includes
namespace wabdo; require_once ("globals.php");

class phpapps_users_roles_form{
	private $globals;
	public $schema = "phpapps";
	public $table = "roles";
	public $template = "gen_tpl/phpapps_users_roles_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
		public $ROLE_NAME;
		public $DESCRIPTION;
	
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
		$sql = "SELECT 
									ROLE_NAME,
												DESCRIPTION
							
				FROM ".$this->schema.".".$this->table." WHERE ".$this->gfield." = '".$this->gfield_value."'";
			$this->globals->con->query($sql);
			$this->globals->con->next();
							$this->ROLE_NAME = $this->globals->con->get_field("ROLE_NAME");
							$this->DESCRIPTION = $this->globals->con->get_field("DESCRIPTION");
						
	}
	
	function addRec(){
		$sql = "INSERT INTO ".$this->schema.".".$this->table." (
									ROLE_NAME,
												DESCRIPTION
						 ) VALUES (
									'$this->ROLE_NAME',
												'$this->DESCRIPTION'
									)";
				
		$this->globals->con->exec($sql);
		header("Location:win_close.html");
	}
	
	function saveRec(){
		$sql = "UPDATE ".$this->schema.".".$this->table." SET 
									ROLE_NAME = '$this->ROLE_NAME',
												DESCRIPTION = '$this->DESCRIPTION'
							
				WHERE ".$this->gfield." = '".$this->gfield_value."'";
				
		$this->globals->con->exec($sql);
		header("Location:win_close.html");
	}

	function deleteRec(){
		$sql = "DELETE FROM ".$this->schema.".".$this->table."
				WHERE ".$this->gfield." = '".$this->gfield_value."'";
		$this->globals->con->exec($sql);
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
		
					$this->ROLE_NAME  = addslashes(trim($_POST["ROLE_NAME"]));
					$this->DESCRIPTION  = addslashes(trim($_POST["DESCRIPTION"]));
				
				if($this->ROLE_NAME == "") {
			$this->errors[] = "Campul ROLE_NAME este obligatoriu!";
		}
				
		switch($this->pact){
			case "addRec":
				if(count($this->errors) == 0) $this->addRec();
			break;
			case "saveRec":
				if(count($this->errors) == 0) $this->saveRec();
			break;
			case "deleteRec":
				$this->deleteRec();
			break;
		}
	}
	
	function setup_display(){
					 
					 
				
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
							"ROLE_NAME" => $this->ROLE_NAME,
							"DESCRIPTION" => $this->DESCRIPTION,
									 
						 
									 
						 
						"pact" => $this->pact,
			"gact" => $this->gact,
			"gfield" => $this->gfield,
			"gfield_value" => $this->gfield_value,
			"error_msg" => $error_msg,
		));
	}
	
	function display(){	
		$this->setup_display();
		$this->globals->sm->display($this->template);
	}
	
	function get_html_str(){	
		$this->setup_display();
		$this->globals->sm->fetch($this->template);
	}
};
?>