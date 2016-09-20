<?php
// includes
require_once ("globals.php");

class phpapps_users_users_form{
	private $globals;
	public $schema = "phpapps";
	public $table = "users";
	public $template = "gen_tpl/phpapps_users_users_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
		public $USERNAME;
		public $PASSWORD;
		public $FIRSTNAME;
		public $LASTNAME;
		public $EMAIL;
		public $USER_TYPE;
		public $DESCRIPTION;
		public $PROFILE_ID;
		
		 
		 
		 
		 
		 
			public $USER_TYPE_sel;
	 
		 
		 
			
		 
		 
		 
		 
		 
		 
		 
			public $PROFILE_ID_sel;
	 
	
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
									USERNAME,
												PASSWORD,
												FIRSTNAME,
												LASTNAME,
												EMAIL,
												USER_TYPE,
												DESCRIPTION,
												PROFILE_ID
							
				FROM ".$this->schema.".".$this->table." WHERE ".$this->gfield." = '".$this->gfield_value."'");
			$this->globals->con->query($sql->sql());
			$this->globals->con->next();
							$this->USERNAME = $this->globals->con->get_field("USERNAME");
							$this->PASSWORD = $this->globals->con->get_field("PASSWORD");
							$this->FIRSTNAME = $this->globals->con->get_field("FIRSTNAME");
							$this->LASTNAME = $this->globals->con->get_field("LASTNAME");
							$this->EMAIL = $this->globals->con->get_field("EMAIL");
							$this->USER_TYPE = $this->globals->con->get_field("USER_TYPE");
							$this->DESCRIPTION = $this->globals->con->get_field("DESCRIPTION");
							$this->PROFILE_ID = $this->globals->con->get_field("PROFILE_ID");
						
	}
	
	
	function beforeAddRec(){
	}
	
	function addRec(){
		$this->beforeAddRec();
	
		$this->check_errors();
		$sql = new DB_query("INSERT INTO ".$this->schema.".".$this->table." (
									USERNAME,
												PASSWORD,
												FIRSTNAME,
												LASTNAME,
												EMAIL,
												USER_TYPE,
												DESCRIPTION,
												PROFILE_ID
						 ) VALUES (
									'$this->USERNAME',
												'$this->PASSWORD',
												'$this->FIRSTNAME',
												'$this->LASTNAME',
												'$this->EMAIL',
												'$this->USER_TYPE',
												'$this->DESCRIPTION',
												'$this->PROFILE_ID'
									)");
echo $sql->sql();
		if(count($this->errors) == 0) {	
			$this->globals->con->exec($sql->sql());
		}
		
		$this->afterAddRec();
	}
	
	function afterAddRec(){
		//header("Location:win_close.html");
	}
	
	function beforeSaveRec(){
	}
	
	function saveRec(){
		$this->beforeSaveRec();
		
		$this->check_errors();
		$sql = new DB_query("UPDATE ".$this->schema.".".$this->table." SET 
									USERNAME = '$this->USERNAME',
												PASSWORD = '$this->PASSWORD',
												FIRSTNAME = '$this->FIRSTNAME',
												LASTNAME = '$this->LASTNAME',
												EMAIL = '$this->EMAIL',
												USER_TYPE = '$this->USER_TYPE',
												DESCRIPTION = '$this->DESCRIPTION',
												PROFILE_ID = '$this->PROFILE_ID'
							
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
		
					$this->USERNAME  = addslashes(trim($_POST["USERNAME"]));
					$this->PASSWORD  = addslashes(trim($_POST["PASSWORD"]));
					$this->FIRSTNAME  = addslashes(trim($_POST["FIRSTNAME"]));
					$this->LASTNAME  = addslashes(trim($_POST["LASTNAME"]));
					$this->EMAIL  = addslashes(trim($_POST["EMAIL"]));
					$this->USER_TYPE  = addslashes(trim($_POST["USER_TYPE"]));
					$this->DESCRIPTION  = addslashes(trim($_POST["DESCRIPTION"]));
					$this->PROFILE_ID  = addslashes(trim($_POST["PROFILE_ID"]));
				
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
				if($this->USERNAME == "") {
			$this->errors[] = "Campul USERNAME este obligatoriu!";
		}
			}
	
	function setup_display(){
					 
					 
					 
					 
					 
								$this->USER_TYPE_sel = new DB_select("USER_TYPE","phpapps.list_user_types");
			$this->USER_TYPE_sel->selected_val = $this->USER_TYPE;
			$this->USER_TYPE_sel->setup_select_options();
			 
					 
					 
				
					 
					 
					 
					 
					 
					 
					 
									$this->PROFILE_ID_sel = new DB_select("PROFILE_ID","phpapps.user_profiles");
				$this->PROFILE_ID_sel->query = "SELECT ID AS VALUE, PROFILE_NAME AS LABEL FROM phpapps.user_profiles ORDER BY PROFILE_NAME";
				$this->PROFILE_ID_sel->selected_val = $this->PROFILE_ID;
				$this->PROFILE_ID_sel->setup_select_options();
			 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
							"USERNAME" => $this->USERNAME,
							"PASSWORD" => $this->PASSWORD,
							"FIRSTNAME" => $this->FIRSTNAME,
							"LASTNAME" => $this->LASTNAME,
							"EMAIL" => $this->EMAIL,
							"USER_TYPE" => $this->USER_TYPE,
							"DESCRIPTION" => $this->DESCRIPTION,
							"PROFILE_ID" => $this->PROFILE_ID,
									 
						 
						 
						 
						 
										"USER_TYPE_sel" => $this->USER_TYPE_sel->get_select_str(),
			 
						 
						 
									 
						 
						 
						 
						 
						 
						 
										"PROFILE_ID_sel" => $this->PROFILE_ID_sel->get_select_str(),
			 
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