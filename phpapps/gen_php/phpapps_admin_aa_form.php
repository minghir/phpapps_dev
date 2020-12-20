<?php
// includes
namespace wabdo; require_once ("globals.php");


class phpapps_admin_aa_form{

	var $globals;
	var $schema = "phpapps";
	var $table = "aa";
	var $template = "gen_tpl/phpapps_admin_aa_form.tpl";
	//get values
	var $gact;
	var $gfield;
	var $gfield_value;
	//post values
	var $pact;
		var $ID;
		var $USERNAME;
		var $PASSWORD;
		var $FIRSTNAME;
		var $LASTNAME;
		var $EMAIL;
		var $USER_TYPE;
		var $DESCRIPTION;
	
	var $errors = array();
	
	function phpapps_admin_aa_form(){
		//$this->display();
	}
		
	function init(){
		//print_r($_POST);
		//$this->globals = new Globals(".");
		$this->globals = new Globals();
		if($_POST["pact"] != "") {
			$this->parsePostVars();
		} else {
			$this->parseGetVars();
		}
	}
	
	function getRec(){
		$sql = "SELECT 
									ID,
												USERNAME,
												PASSWORD,
												FIRSTNAME,
												LASTNAME,
												EMAIL,
												USER_TYPE,
												DESCRIPTION
							
				FROM {$this->globals->PHPAPPS_DB}.aa WHERE ".$this->gfield." = '".$this->gfield_value."'";
			$this->globals->con->query($sql);
			$this->globals->con->next();
							$this->ID = $this->globals->con->get_field("ID");
							$this->USERNAME = $this->globals->con->get_field("USERNAME");
							$this->PASSWORD = $this->globals->con->get_field("PASSWORD");
							$this->FIRSTNAME = $this->globals->con->get_field("FIRSTNAME");
							$this->LASTNAME = $this->globals->con->get_field("LASTNAME");
							$this->EMAIL = $this->globals->con->get_field("EMAIL");
							$this->USER_TYPE = $this->globals->con->get_field("USER_TYPE");
							$this->DESCRIPTION = $this->globals->con->get_field("DESCRIPTION");
						
	}
	
	function addRec(){
		$sql = "INSERT INTO {$this->globals->PHPAPPS_DB}.aa (
									ID,
												USERNAME,
												PASSWORD,
												FIRSTNAME,
												LASTNAME,
												EMAIL,
												USER_TYPE,
												DESCRIPTION
						 ) VALUES (
									'$this->ID',
												'$this->USERNAME',
												'$this->PASSWORD',
												'$this->FIRSTNAME',
												'$this->LASTNAME',
												'$this->EMAIL',
												'$this->USER_TYPE',
												'$this->DESCRIPTION'
									)";
				
		$this->globals->con->exec($sql);
		header("Location:win_close.html");
	}
	
	function saveRec(){
		$sql = "UPDATE {$this->globals->PHPAPPS_DB}.aa SET 
									ID = '$this->ID',
												USERNAME = '$this->USERNAME',
												PASSWORD = '$this->PASSWORD',
												FIRSTNAME = '$this->FIRSTNAME',
												LASTNAME = '$this->LASTNAME',
												EMAIL = '$this->EMAIL',
												USER_TYPE = '$this->USER_TYPE',
												DESCRIPTION = '$this->DESCRIPTION'
							
				WHERE ".$this->gfield." = '".$this->gfield_value."'";
				
		$this->globals->con->exec($sql);
		header("Location:win_close.html");
	}

	function deleteRec(){
		$sql = "DELETE FROM {$this->globals->PHPAPPS_DB}.aa 
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
				//$this->deleteRec();
			break;
		}
	}
	
	function parsePostVars(){
		$this->pact = $_POST["pact"];
		$this->gact = $_POST["gact"];
		$this->gfield = $_POST["gfield"];
		$this->gfield_value = $_POST["gfield_value"];
		
					$this->ID  = addslashes(trim($_POST["ID"]));
					$this->USERNAME  = addslashes(trim($_POST["USERNAME"]));
					$this->PASSWORD  = addslashes(trim($_POST["PASSWORD"]));
					$this->FIRSTNAME  = addslashes(trim($_POST["FIRSTNAME"]));
					$this->LASTNAME  = addslashes(trim($_POST["LASTNAME"]));
					$this->EMAIL  = addslashes(trim($_POST["EMAIL"]));
					$this->USER_TYPE  = addslashes(trim($_POST["USER_TYPE"]));
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
	
	function display(){
					 
					 
					 
					 
					 
					 
					 
					 
				
					 
					 
					 
					 
					 
					 
					 
					 
				
	
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
							"ID" => $this->ID,
							"USERNAME" => $this->USERNAME,
							"PASSWORD" => $this->PASSWORD,
							"FIRSTNAME" => $this->FIRSTNAME,
							"LASTNAME" => $this->LASTNAME,
							"EMAIL" => $this->EMAIL,
							"USER_TYPE" => $this->USER_TYPE,
							"DESCRIPTION" => $this->DESCRIPTION,
						
						 
						 
						 
						 
						 
						 
						 
						 
						
						 
						 
						 
						 
						 
						 
						 
						 
						
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