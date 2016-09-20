<?php
// includes
require_once ("globals.php");

class phpapps_admin_test3_form{
	private $globals;
	public $schema = "phpapps";
	public $table = "test3";
	public $template = "gen_tpl/phpapps_admin_test3_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
		public $APP_ID;
		public $MOD_ID;
		public $NUME;
	
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
									APP_ID,
												MOD_ID,
												NUME
							
				FROM ".$this->schema.".".$this->table." WHERE ".$this->gfield." = '".$this->gfield_value."'";
			$this->globals->con->query($sql);
			$this->globals->con->next();
							$this->APP_ID = $this->globals->con->get_field("APP_ID");
							$this->MOD_ID = $this->globals->con->get_field("MOD_ID");
							$this->NUME = $this->globals->con->get_field("NUME");
						
	}
	
	function addRec(){
		$sql = "INSERT INTO ".$this->schema.".".$this->table." (
									APP_ID,
												MOD_ID,
												NUME
						 ) VALUES (
									'$this->APP_ID',
												'$this->MOD_ID',
												'$this->NUME'
									)";
				
		$this->globals->con->exec($sql);
		header("Location:win_close.html");
	}
	
	function saveRec(){
		$sql = "UPDATE ".$this->schema.".".$this->table." SET 
									APP_ID = '$this->APP_ID',
												MOD_ID = '$this->MOD_ID',
												NUME = '$this->NUME'
							
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
		
					$this->APP_ID  = addslashes(trim($_POST["APP_ID"]));
					$this->MOD_ID  = addslashes(trim($_POST["MOD_ID"]));
					$this->NUME  = addslashes(trim($_POST["NUME"]));
				
				if($this->MOD_ID == "") {
			$this->errors[] = "Campul MOD_ID este obligatoriu!";
		}
				if($this->NUME == "") {
			$this->errors[] = "Campul NUME este obligatoriu!";
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
					 
					 
					 
				
									$APP_ID_sel = new DB_select("APP_ID","phpapps.applications");
				$APP_ID_sel->query = "SELECT ID AS VALUE, APP_TITLE AS LABEL FROM phpapps.applications ORDER BY APP_TITLE";
				$APP_ID_sel->selected_val = $this->APP_ID;
				$APP_ID_sel->setup_select_options();
			 
									$MOD_ID_sel = new DB_select("MOD_ID","phpapps.modules");
				$MOD_ID_sel->query = "SELECT ID AS VALUE, MODULE_TITLE AS LABEL FROM phpapps.modules ORDER BY MODULE_TITLE";
				$MOD_ID_sel->selected_val = $this->MOD_ID;
				$MOD_ID_sel->setup_select_options();
			 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
							"APP_ID" => $this->APP_ID,
							"MOD_ID" => $this->MOD_ID,
							"NUME" => $this->NUME,
									 
						 
						 
													"APP_ID_sel" => $APP_ID_sel->get_select_str(),
			 
										"MOD_ID_sel" => $MOD_ID_sel->get_select_str(),
			 
						 
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