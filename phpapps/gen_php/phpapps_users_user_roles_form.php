<?php
// includes
require_once ("globals.php");

class phpapps_users_user_roles_form{
	private $globals;
	public $schema = "phpapps";
	public $table = "user_roles";
	public $template = "gen_tpl/phpapps_users_user_roles_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
		public $UID;
		public $ROLE_ID;
		
		 
		 
			
		 
			public $ROLE_ID_sel;
	 
	
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
									UID,
												ROLE_ID
							
				FROM ".$this->schema.".".$this->table." WHERE ".$this->gfield." = '".$this->gfield_value."'");
			$this->globals->con->query($sql->sql());
			$this->globals->con->next();
							$this->UID = $this->globals->con->get_field("UID");
							$this->ROLE_ID = $this->globals->con->get_field("ROLE_ID");
						
	}
	
	
	function beforeAddRec(){
	}
	
	function addRec(){
		$this->beforeAddRec();
	
		$this->check_errors();
		$sql = new DB_query("INSERT INTO ".$this->schema.".".$this->table." (
									UID,
												ROLE_ID
						 ) VALUES (
									'$this->UID',
												'$this->ROLE_ID'
									)");

		if(count($this->errors) == 0) {	
			$this->globals->con->exec($sql->sql());
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
									UID = '$this->UID',
												ROLE_ID = '$this->ROLE_ID'
							
				WHERE ".$this->gfield." = '".$this->gfield_value."'");
				
		if(count($this->errors) == 0) {	
			$this->globals->con->exec($sql->sql());
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
		
					$this->UID  = addslashes(trim($_POST["UID"]));
					$this->ROLE_ID  = addslashes(trim($_POST["ROLE_ID"]));
				
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
				if($this->UID == "") {
			$this->errors[] = "Campul UID este obligatoriu!";
		}
				if($this->ROLE_ID == "") {
			$this->errors[] = "Campul ROLE_ID este obligatoriu!";
		}
			}
	
	function setup_display(){
					 
					 
				
					 
									$this->ROLE_ID_sel = new DB_select("ROLE_ID","phpapps.roles");
				$this->ROLE_ID_sel->query = "SELECT ID AS VALUE, ROLE_NAME AS LABEL FROM phpapps.roles ORDER BY ROLE_NAME";
				$this->ROLE_ID_sel->selected_val = $this->ROLE_ID;
				$this->ROLE_ID_sel->setup_select_options();
			 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
							"UID" => $this->UID,
							"ROLE_ID" => $this->ROLE_ID,
									 
						 
									 
										"ROLE_ID_sel" => $this->ROLE_ID_sel->get_select_str(),
			 
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