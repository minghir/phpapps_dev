<?php
// includes
require_once ("globals.php");

class phpapps_users_role_permissions_form{
	private $globals;
	public $schema = "phpapps";
	public $table = "role_permissions";
	public $template = "gen_tpl/phpapps_users_role_permissions_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
		public $ROLE_ID;
		public $PERMISSION_ID;
	
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
									ROLE_ID,
												PERMISSION_ID
							
				FROM ".$this->schema.".".$this->table." WHERE ".$this->gfield." = '".$this->gfield_value."'";
			$this->globals->con->query($sql);
			$this->globals->con->next();
							$this->ROLE_ID = $this->globals->con->get_field("ROLE_ID");
							$this->PERMISSION_ID = $this->globals->con->get_field("PERMISSION_ID");
						
	}
	
	function addRec(){
		$sql = "INSERT INTO ".$this->schema.".".$this->table." (
									ROLE_ID,
												PERMISSION_ID
						 ) VALUES (
									'$this->ROLE_ID',
												'$this->PERMISSION_ID'
									)";
				
		$this->globals->con->exec($sql);
		header("Location:win_close.html");
	}
	
	function saveRec(){
		$sql = "UPDATE ".$this->schema.".".$this->table." SET 
									ROLE_ID = '$this->ROLE_ID',
												PERMISSION_ID = '$this->PERMISSION_ID'
							
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
		
					$this->ROLE_ID  = addslashes(trim($_POST["ROLE_ID"]));
					$this->PERMISSION_ID  = addslashes(trim($_POST["PERMISSION_ID"]));
				
				if($this->ROLE_ID == "") {
			$this->errors[] = "Campul ROLE_ID este obligatoriu!";
		}
				if($this->PERMISSION_ID == "") {
			$this->errors[] = "Campul PERMISSION_ID este obligatoriu!";
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
					 
					 
				
									$ROLE_ID_sel = new DB_select("ROLE_ID","phpapps.roles");
				$ROLE_ID_sel->query = "SELECT ID AS VALUE, ROLE_NAME AS LABEL FROM phpapps.roles ORDER BY ROLE_NAME";
				$ROLE_ID_sel->selected_val = $this->ROLE_ID;
				$ROLE_ID_sel->setup_select_options();
			 
									$PERMISSION_ID_sel = new DB_select("PERMISSION_ID","phpapps.view_permissions");
				$PERMISSION_ID_sel->query = "SELECT ID AS VALUE, DESCRIPTION AS LABEL FROM phpapps.view_permissions ORDER BY DESCRIPTION";
				$PERMISSION_ID_sel->selected_val = $this->PERMISSION_ID;
				$PERMISSION_ID_sel->setup_select_options();
			 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
							"ROLE_ID" => $this->ROLE_ID,
							"PERMISSION_ID" => $this->PERMISSION_ID,
									 
						 
													"ROLE_ID_sel" => $ROLE_ID_sel->get_select_str(),
			 
										"PERMISSION_ID_sel" => $PERMISSION_ID_sel->get_select_str(),
			 
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