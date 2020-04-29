<?php
// includes
require_once ("globals.php");

class eshop_admin_categories_form22{
	private $globals;
	public $schema = "eshop";
	public $table = "categories";
	public $template = "gen_tpl/eshop_admin_categories_form22.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
		public $ID;
		public $PID;
		public $NAME;
		public $TITLE;
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
									ID,
												PID,
												NAME,
												TITLE,
												DESCRIPTION
							
				FROM ".$this->schema.".".$this->table." WHERE ".$this->gfield." = '".$this->gfield_value."'";
			$this->globals->con->query($sql);
			$this->globals->con->next();
							$this->ID = $this->globals->con->get_field("ID");
							$this->PID = $this->globals->con->get_field("PID");
							$this->NAME = $this->globals->con->get_field("NAME");
							$this->TITLE = $this->globals->con->get_field("TITLE");
							$this->DESCRIPTION = $this->globals->con->get_field("DESCRIPTION");
						
	}
	
	function addRec(){
		$sql = "INSERT INTO ".$this->schema.".".$this->table." (
									ID,
												PID,
												NAME,
												TITLE,
												DESCRIPTION
						 ) VALUES (
									'$this->ID',
												'$this->PID',
												'$this->NAME',
												'$this->TITLE',
												'$this->DESCRIPTION'
									)";
				
		$this->globals->con->exec($sql);
		header("Location:win_close.html");
	}
	
	function saveRec(){
		$sql = "UPDATE ".$this->schema.".".$this->table." SET 
									ID = '$this->ID',
												PID = '$this->PID',
												NAME = '$this->NAME',
												TITLE = '$this->TITLE',
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
		
					$this->ID  = addslashes(trim($_POST["ID"]));
					$this->PID  = addslashes(trim($_POST["PID"]));
					$this->NAME  = addslashes(trim($_POST["NAME"]));
					$this->TITLE  = addslashes(trim($_POST["TITLE"]));
					$this->DESCRIPTION  = addslashes(trim($_POST["DESCRIPTION"]));
				
				
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
							"ID" => $this->ID,
							"PID" => $this->PID,
							"NAME" => $this->NAME,
							"TITLE" => $this->TITLE,
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