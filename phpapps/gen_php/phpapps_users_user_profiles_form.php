<?php
// includes
require_once ("globals.php");

class phpapps_users_user_profiles_form{
	private $globals;
	public $schema = "phpapps";
	public $table = "user_profiles";
	public $template = "gen_tpl/phpapps_users_user_profiles_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
		public $SCRIPT_ID;
		public $PROFILE_NAME;
		public $THEME;
		
		 
		 
		 
			
			public $SCRIPT_ID_sel;
	 
		 
		 
	
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
									SCRIPT_ID,
												PROFILE_NAME,
												THEME
							
				FROM ".$this->schema.".".$this->table." WHERE ".$this->gfield." = '".$this->gfield_value."'");
			$this->globals->con->query($sql->sql());
			$this->globals->con->next();
							$this->SCRIPT_ID = $this->globals->con->get_field("SCRIPT_ID");
							$this->PROFILE_NAME = $this->globals->con->get_field("PROFILE_NAME");
							$this->THEME = $this->globals->con->get_field("THEME");
						
	}
	
	
	function beforeAddRec(){
	}
	
	function addRec(){
		$this->beforeAddRec();
	
		$this->check_errors();
		$sql = new DB_query("INSERT INTO ".$this->schema.".".$this->table." (
									SCRIPT_ID,
												PROFILE_NAME,
												THEME
						 ) VALUES (
									'$this->SCRIPT_ID',
												'$this->PROFILE_NAME',
												'$this->THEME'
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
									SCRIPT_ID = '$this->SCRIPT_ID',
												PROFILE_NAME = '$this->PROFILE_NAME',
												THEME = '$this->THEME'
							
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
		
					$this->SCRIPT_ID  = addslashes(trim($_POST["SCRIPT_ID"]));
					$this->PROFILE_NAME  = addslashes(trim($_POST["PROFILE_NAME"]));
					$this->THEME  = addslashes(trim($_POST["THEME"]));
				
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
				if($this->PROFILE_NAME == "") {
			$this->errors[] = "Campul PROFILE_NAME este obligatoriu!";
		}
			}
	
	function setup_display(){
					 
					 
					 
				
									$this->SCRIPT_ID_sel = new DB_select("SCRIPT_ID","phpapps.scripts");
				$this->SCRIPT_ID_sel->query = "SELECT ID AS VALUE, SCRIPT_NAME AS LABEL FROM phpapps.scripts ORDER BY SCRIPT_NAME";
				$this->SCRIPT_ID_sel->selected_val = $this->SCRIPT_ID;
				$this->SCRIPT_ID_sel->setup_select_options();
			 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
							"SCRIPT_ID" => $this->SCRIPT_ID,
							"PROFILE_NAME" => $this->PROFILE_NAME,
							"THEME" => $this->THEME,
									 
						 
						 
													"SCRIPT_ID_sel" => $this->SCRIPT_ID_sel->get_select_str(),
			 
						 
						 
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