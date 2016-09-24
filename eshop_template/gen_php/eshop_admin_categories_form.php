<?php
// includes
require_once ("globals.php");

class eshop_admin_categories_form{
	private $globals;
	public $schema = "eshop";
	public $table = "categories";
	public $template = "gen_tpl/eshop_admin_categories_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
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
		if($_POST["pact"] != "") {
			$this->parsePostVars();
		} else {
			$this->parseGetVars();
		}
	}
	
	function getRec(){
		$sql = "SELECT 
									PID,
												NAME,
												TITLE,
												DESCRIPTION
							
				FROM ".$this->schema.".".$this->table." WHERE ".$this->gfield." = '".$this->gfield_value."'";
			$this->globals->con->query($sql);
			$this->globals->con->next();
							$this->PID = $this->globals->con->get_field("PID");
							$this->NAME = $this->globals->con->get_field("NAME");
							$this->TITLE = $this->globals->con->get_field("TITLE");
							$this->DESCRIPTION = $this->globals->con->get_field("DESCRIPTION");
						
	}
	
	function addRec(){
		$sql = "INSERT INTO ".$this->schema.".".$this->table." (
									PID,
												NAME,
												TITLE,
												DESCRIPTION
						 ) VALUES (
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
		
					$this->PID  = addslashes(trim($_POST["PID"]));
					$this->NAME  = addslashes(trim($_POST["NAME"]));
					$this->TITLE  = addslashes(trim($_POST["TITLE"]));
					$this->DESCRIPTION  = addslashes(trim($_POST["DESCRIPTION"]));
				
				if($this->PID == "") {
			$this->errors[] = "Campul PID este obligatoriu!";
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
	
	function display(){
					 
					 
					 
					 
				
									$PID_sel = new DB_select("PID","eshop.categories");
				$PID_sel->query = "SELECT ID AS VALUE, NAME AS LABEL FROM eshop.categories ORDER BY NAME";
				$PID_sel->selected_val = $this->PID;
				$PID_sel->setup_select_options();
			 
					 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
							"PID" => $this->PID,
							"NAME" => $this->NAME,
							"TITLE" => $this->TITLE,
							"DESCRIPTION" => $this->DESCRIPTION,
									 
						 
						 
						 
													"PID_sel" => $PID_sel->get_select_str(),
			 
						 
						 
						 
						"pact" => $this->pact,
			"gact" => $this->gact,
			"gfield" => $this->gfield,
			"gfield_value" => $this->gfield_value,
			"error_msg" => $error_msg,
		));
		
		$this->globals->sm->display($this->template);
	}
};
?>