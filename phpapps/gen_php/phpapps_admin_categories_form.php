<?php
// includes
require_once ("globals.php");

class phpapps_admin_categories_form{
	private $globals;
	public $schema = "eshop";
	public $table = "categories";
	public $template = "gen_tpl/phpapps_admin_categories_form.tpl";
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
		if($_SERVER['REQUEST_METHOD'] === 'POST') {
			$this->parsePostVars();
		} else {
			$this->parseGetVars();
		}
	}
	
	function getRec(){
		$sql = new DB_query( "SELECT 
									PID,
												NAME,
												TITLE,
												DESCRIPTION
							
				FROM ".$this->schema.".".$this->table." WHERE ".$this->gfield." = '".$this->gfield_value."'");
			$this->globals->con->query($sql->sql());
			$this->globals->con->next();
							$this->PID = $this->globals->con->get_field("PID");
							$this->NAME = $this->globals->con->get_field("NAME");
							$this->TITLE = $this->globals->con->get_field("TITLE");
							$this->DESCRIPTION = $this->globals->con->get_field("DESCRIPTION");
						
	}
	
	
	function beforeAddRec(){
	}
	
	function addRec(){
		$this->beforeAddRec();
	
		$sql = new DB_query("INSERT INTO ".$this->schema.".".$this->table." (
									PID,
												NAME,
												TITLE,
												DESCRIPTION
						 ) VALUES (
									'$this->PID',
												'$this->NAME',
												'$this->TITLE',
												'$this->DESCRIPTION'
									)");
				
		$this->globals->con->exec($sql->sql());
		
		$this->afterAddRec();
	}
	
	function afterAddRec(){
		header("Location:win_close.html");
	}
	
	function beforeSaveRec(){
	}
	
	function saveRec(){
		$this->beforeSaveRec();
		
		$sql = new DB_query("UPDATE ".$this->schema.".".$this->table." SET 
									PID = '$this->PID',
												NAME = '$this->NAME',
												TITLE = '$this->TITLE',
												DESCRIPTION = '$this->DESCRIPTION'
							
				WHERE ".$this->gfield." = '".$this->gfield_value."'");
				
		$this->globals->con->exec($sql->sql());
		
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
				WHERE ".$this->gfield." = '".$this->gfield_value."'");
		$this->globals->con->exec($sql->sql());
		
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