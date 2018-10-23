<?php
// includes
require_once ("globals.php");

class phpapps_users_users_form{
	public $globals;
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
		public $MODIFY_UID;
		public $CREATE_UID;
		public $MODIFY_DATE;
		public $CREATE_DATE;
		
		 
		 
		 
		 
		 
			public $USER_TYPE_sel;
	 
		 
		 
		 
		 
		 
		 
			
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
	
	public $errors = array();
	
	function __construct(){
		global $GLOBALS_OBJ;
		$this->globals = $GLOBALS_OBJ;
	}
		
	function init(){
		if($_SERVER['REQUEST_METHOD'] === 'POST') {
			$this->parsePostVars();
		} else {
			$this->parseGetVars();
		}
	}
	
	function beforeGetRec(){
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
												PROFILE_ID,
												MODIFY_UID,
												CREATE_UID,
												MODIFY_DATE,
												CREATE_DATE
							
				FROM ".$this->schema.".".$this->table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($sql);
			$this->globals->con->next();
							$this->USERNAME = $this->globals->con->get_field("USERNAME");
							$this->PASSWORD = $this->globals->con->get_field("PASSWORD");
							$this->FIRSTNAME = $this->globals->con->get_field("FIRSTNAME");
							$this->LASTNAME = $this->globals->con->get_field("LASTNAME");
							$this->EMAIL = $this->globals->con->get_field("EMAIL");
							$this->USER_TYPE = $this->globals->con->get_field("USER_TYPE");
							$this->DESCRIPTION = $this->globals->con->get_field("DESCRIPTION");
							$this->PROFILE_ID = $this->globals->con->get_field("PROFILE_ID");
							$this->MODIFY_UID = $this->globals->con->get_field("MODIFY_UID");
							$this->CREATE_UID = $this->globals->con->get_field("CREATE_UID");
							$this->MODIFY_DATE = $this->globals->con->get_field("MODIFY_DATE");
							$this->CREATE_DATE = $this->globals->con->get_field("CREATE_DATE");
						
	}
	
	function afterGetRec(){
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
												PROFILE_ID,
												MODIFY_UID,
												CREATE_UID,
												MODIFY_DATE,
												CREATE_DATE
						 ) VALUES (
									:USERNAME,
												:PASSWORD,
												:FIRSTNAME,
												:LASTNAME,
												:EMAIL,
												:USER_TYPE,
												:DESCRIPTION,
												:PROFILE_ID,
												:MODIFY_UID,
												:CREATE_UID,
												:MODIFY_DATE,
												:CREATE_DATE
									)",
			array(
									":USERNAME" => $this->USERNAME,
									":PASSWORD" => $this->PASSWORD,
									":FIRSTNAME" => $this->FIRSTNAME,
									":LASTNAME" => $this->LASTNAME,
									":EMAIL" => $this->EMAIL,
									":USER_TYPE" => $this->USER_TYPE,
									":DESCRIPTION" => $this->DESCRIPTION,
									":PROFILE_ID" => $this->PROFILE_ID,
									":MODIFY_UID" => $this->MODIFY_UID,
									":CREATE_UID" => $this->CREATE_UID,
									":MODIFY_DATE" => $this->MODIFY_DATE,
									":CREATE_DATE" => $this->CREATE_DATE,
							)
			);

		if(count($this->errors) == 0) {	
			$this->globals->con->query($sql);
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
									USERNAME = :USERNAME,
												PASSWORD = :PASSWORD,
												FIRSTNAME = :FIRSTNAME,
												LASTNAME = :LASTNAME,
												EMAIL = :EMAIL,
												USER_TYPE = :USER_TYPE,
												DESCRIPTION = :DESCRIPTION,
												PROFILE_ID = :PROFILE_ID,
												MODIFY_UID = :MODIFY_UID,
												CREATE_UID = :CREATE_UID,
												MODIFY_DATE = :MODIFY_DATE,
												CREATE_DATE = :CREATE_DATE
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
									":USERNAME" => $this->USERNAME,
									":PASSWORD" => $this->PASSWORD,
									":FIRSTNAME" => $this->FIRSTNAME,
									":LASTNAME" => $this->LASTNAME,
									":EMAIL" => $this->EMAIL,
									":USER_TYPE" => $this->USER_TYPE,
									":DESCRIPTION" => $this->DESCRIPTION,
									":PROFILE_ID" => $this->PROFILE_ID,
									":MODIFY_UID" => $this->MODIFY_UID,
									":CREATE_UID" => $this->CREATE_UID,
									":MODIFY_DATE" => $this->MODIFY_DATE,
									":CREATE_DATE" => $this->CREATE_DATE,
								":".$this->gfield => $this->gfield_value
			)	
			);
				
		if(count($this->errors) == 0) {	
			$this->globals->con->query($sql);
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
				WHERE ".$this->gfield." = :".$this->gfield, array(":".$this->gfield=>$this->gfield_value) );
				
		if(count($this->errors) == 0) {	
			$this->globals->con->query($sql);
		}
		
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
				$this->beforeGetRec();
				$this->getRec();
				$this->afterGetRec();
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
					$this->MODIFY_UID  = addslashes(trim($_POST["MODIFY_UID"]));
					$this->CREATE_UID  = addslashes(trim($_POST["CREATE_UID"]));
					$this->MODIFY_DATE  = addslashes(trim($_POST["MODIFY_DATE"]));
					$this->CREATE_DATE  = addslashes(trim($_POST["CREATE_DATE"]));
				
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
				if($this->USER_TYPE == "") {
			$this->errors[] = "Campul USER_TYPE este obligatoriu!";
		}
			}
	
	function setup_display(){
					 
					 
					 
					 
					 
								$this->USER_TYPE_sel = new DB_select("USER_TYPE","phpapps.list_user_types");
			$this->USER_TYPE_sel->selected_val = $this->USER_TYPE;
			$this->USER_TYPE_sel->setup_select_options();
			 
					 
					 
					 
					 
					 
					 
				
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
			
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
							"MODIFY_UID" => $this->MODIFY_UID,
							"CREATE_UID" => $this->CREATE_UID,
							"MODIFY_DATE" => $this->MODIFY_DATE,
							"CREATE_DATE" => $this->CREATE_DATE,
									 
						 
						 
						 
						 
										"USER_TYPE_sel" => $this->USER_TYPE_sel->get_select_str(),
			 
						 
						 
						 
						 
						 
						 
									 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
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
		
		$this->afterDisplay();
	}
	
	function afterDisplay(){	
	}
	
	function get_html_str(){	
		$this->setup_display();
		
		$this->beforeDisplay();
		
		$this->globals->sm->fetch($this->template);
	}
}
?>