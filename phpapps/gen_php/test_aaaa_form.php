<?php
// includes
require_once ("globals.php");


class test_aaaa_form{

	var $globals;
	var $schema = "phpapps";
	var $table = "aaaa";
	var $template = "gen_tpl/test_aaaa_form.tpl";
	//get values
	var $gact;
	var $gfield;
	var $gfield_value;
	//post values
	var $pact;
	
	var $errors = array();
	
	function test_aaaa_form(){
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
				
				FROM phpapps.aaaa WHERE ".$this->gfield." = '".$this->gfield_value."'";
			$this->globals->con->query($sql);
			$this->globals->con->next();
						
	}
	
	function addRec(){
		$sql = "INSERT INTO phpapps.aaaa (
			 ) VALUES (
						)";
				
		$this->globals->con->exec($sql);
		header("Location:win_close.html");
	}
	
	function saveRec(){
		$sql = "UPDATE phpapps.aaaa SET 
				
				WHERE ".$this->gfield." = '".$this->gfield_value."'";
				
		$this->globals->con->exec($sql);
		header("Location:win_close.html");
	}

	function deleteRec(){
		$sql = "DELETE FROM phpapps.aaaa 
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