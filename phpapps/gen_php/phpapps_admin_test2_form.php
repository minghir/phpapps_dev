<?php
// includes
require_once ("globals.php");


class phpapps_admin_test2_form{

	var $globals;
	var $schema = "phpapps";
	var $table = "test2";
	var $template = "gen_tpl/phpapps_admin_test2_form.tpl";
	//get values
	var $gact;
	var $gfield;
	var $gfield_value;
	//post values
	var $pact;
	
	///////////////////??????????
	var $select_lists;
	/////////////??????????????
		var $TEST_ID;
	
	var $errors = array();
	
	function phpapps_admin_test2_form(){
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
									TEST_ID
							
				FROM ".$this->schema.".".$this->table." WHERE ".$this->gfield." = '".$this->gfield_value."'";
			$this->globals->con->query($sql);
			$this->globals->con->next();
							$this->TEST_ID = $this->globals->con->get_field("TEST_ID");
						
	}
	
	function addRec(){
		$sql = "INSERT INTO ".$this->schema.".".$this->table." (
									TEST_ID
						 ) VALUES (
									'$this->TEST_ID'
									)";
				
		$this->globals->con->exec($sql);
		header("Location:win_close.html");
	}
	
	function saveRec(){
		$sql = "UPDATE ".$this->schema.".".$this->table." SET 
									TEST_ID = '$this->TEST_ID'
							
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
				//$this->deleteRec();
			break;
		}
	}
	
	function parsePostVars(){
		$this->pact = $_POST["pact"];
		$this->gact = $_POST["gact"];
		$this->gfield = $_POST["gfield"];
		$this->gfield_value = $_POST["gfield_value"];
		
					$this->TEST_ID  = addslashes(trim($_POST["TEST_ID"]));
				
				
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
								/////////////////??????????????
			$tmp_list_ob = new DB_select("$this->TEST_ID","phpapps.list_databases");
			$tmp_list_ob->setup_select_options();
			
			$this->select_lists[] = $tmp_list_ob->get_select_str();
			///////////////?????????????????
			
				$sql = "SELECT ID, VALUE FROM phpapps.list_databases";
				$this->globals->con->query($sql);
				 while($res=$this->globals->con->fetch_array()){
					$list_databases_id[] = $res["ID"];
					$list_databases_value[] = $res["VALUE"];
					$list_databases_sel[] = $res["ID"] == $this->TEST_ID ? "selected" : "";
				 }
				 
				
					 
				
	
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
							"TEST_ID" => $this->TEST_ID,
						
										"list_databases_id" => $list_databases_id,
				"list_databases_value" => $list_databases_value,
				"list_databases_sel" => $list_databases_sel,
			 
						
						 
						
			"select_lists" =>  $this->select_lists,
			
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