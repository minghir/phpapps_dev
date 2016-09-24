<?php
// includes
require_once ("globals.php");

class phpapps_users_permissions_form{
	private $globals;
	public $schema = "phpapps";
	public $table = "permissions";
	public $template = "gen_tpl/phpapps_users_permissions_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
		public $PERMISSION_NAME;
		public $DESCRIPTION;
		public $PERMISSION_TYPE;
		public $OBJECT_TYPE;
		public $OBJECT_ID;
	
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
									PERMISSION_NAME,
												DESCRIPTION,
												PERMISSION_TYPE,
												OBJECT_TYPE,
												OBJECT_ID
							
				FROM ".$this->schema.".".$this->table." WHERE ".$this->gfield." = '".$this->gfield_value."'";
			$this->globals->con->query($sql);
			$this->globals->con->next();
							$this->PERMISSION_NAME = $this->globals->con->get_field("PERMISSION_NAME");
							$this->DESCRIPTION = $this->globals->con->get_field("DESCRIPTION");
							$this->PERMISSION_TYPE = $this->globals->con->get_field("PERMISSION_TYPE");
							$this->OBJECT_TYPE = $this->globals->con->get_field("OBJECT_TYPE");
							$this->OBJECT_ID = $this->globals->con->get_field("OBJECT_ID");
						
	}
	
	function addRec(){
		$sql = "INSERT INTO ".$this->schema.".".$this->table." (
									PERMISSION_NAME,
												DESCRIPTION,
												PERMISSION_TYPE,
												OBJECT_TYPE,
												OBJECT_ID
						 ) VALUES (
									'$this->PERMISSION_NAME',
												'$this->DESCRIPTION',
												'$this->PERMISSION_TYPE',
												'$this->OBJECT_TYPE',
												'$this->OBJECT_ID'
									)";
				
		$this->globals->con->exec($sql);
		header("Location:win_close.html");
	}
	
	function saveRec(){
		$sql = "UPDATE ".$this->schema.".".$this->table." SET 
									PERMISSION_NAME = '$this->PERMISSION_NAME',
												DESCRIPTION = '$this->DESCRIPTION',
												PERMISSION_TYPE = '$this->PERMISSION_TYPE',
												OBJECT_TYPE = '$this->OBJECT_TYPE',
												OBJECT_ID = '$this->OBJECT_ID'
							
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
		
					$this->PERMISSION_NAME  = addslashes(trim($_POST["PERMISSION_NAME"]));
					$this->DESCRIPTION  = addslashes(trim($_POST["DESCRIPTION"]));
					$this->PERMISSION_TYPE  = addslashes(trim($_POST["PERMISSION_TYPE"]));
					$this->OBJECT_TYPE  = addslashes(trim($_POST["OBJECT_TYPE"]));
					$this->OBJECT_ID  = addslashes(trim($_POST["OBJECT_ID"]));
				
				if($this->PERMISSION_NAME == "") {
			$this->errors[] = "Campul PERMISSION_NAME este obligatoriu!";
		}
				if($this->PERMISSION_TYPE == "") {
			$this->errors[] = "Campul PERMISSION_TYPE este obligatoriu!";
		}
				if($this->OBJECT_TYPE == "") {
			$this->errors[] = "Campul OBJECT_TYPE este obligatoriu!";
		}
				if($this->OBJECT_ID == "") {
			$this->errors[] = "Campul OBJECT_ID este obligatoriu!";
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
								$PERMISSION_NAME_sel = new DB_select("PERMISSION_NAME","phpapps.list_permission_names");
			$PERMISSION_NAME_sel->selected_val = $this->PERMISSION_NAME;
			$PERMISSION_NAME_sel->setup_select_options();
			 
					 
								$PERMISSION_TYPE_sel = new DB_select("PERMISSION_TYPE","phpapps.list_permission_types");
			$PERMISSION_TYPE_sel->selected_val = $this->PERMISSION_TYPE;
			$PERMISSION_TYPE_sel->setup_select_options();
			 
								$OBJECT_TYPE_sel = new DB_select("OBJECT_TYPE","phpapps.list_object_types");
			$OBJECT_TYPE_sel->selected_val = $this->OBJECT_TYPE;
			$OBJECT_TYPE_sel->setup_select_options();
			 
					 
				
					 
					 
					 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
							"PERMISSION_NAME" => $this->PERMISSION_NAME,
							"DESCRIPTION" => $this->DESCRIPTION,
							"PERMISSION_TYPE" => $this->PERMISSION_TYPE,
							"OBJECT_TYPE" => $this->OBJECT_TYPE,
							"OBJECT_ID" => $this->OBJECT_ID,
													"PERMISSION_NAME_sel" => $PERMISSION_NAME_sel->get_select_str(),
			 
						 
										"PERMISSION_TYPE_sel" => $PERMISSION_TYPE_sel->get_select_str(),
			 
										"OBJECT_TYPE_sel" => $OBJECT_TYPE_sel->get_select_str(),
			 
						 
									 
						 
						 
						 
						 
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