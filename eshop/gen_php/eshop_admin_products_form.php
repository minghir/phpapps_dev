<?php
// includes
require_once ("globals.php");

class eshop_admin_products_form{
	private $globals;
	public $schema = "eshop";
	public $table = "products";
	public $template = "gen_tpl/eshop_admin_products_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
		public $CATEG_ID;
		public $PRODUCT_NAME;
		public $DESCRIPTION;
	
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
									CATEG_ID,
												PRODUCT_NAME,
												DESCRIPTION
							
				FROM ".$this->schema.".".$this->table." WHERE ".$this->gfield." = '".$this->gfield_value."'";
			$this->globals->con->query($sql);
			$this->globals->con->next();
							$this->CATEG_ID = $this->globals->con->get_field("CATEG_ID");
							$this->PRODUCT_NAME = $this->globals->con->get_field("PRODUCT_NAME");
							$this->DESCRIPTION = $this->globals->con->get_field("DESCRIPTION");
						
	}
	
	function addRec(){
		$sql = "INSERT INTO ".$this->schema.".".$this->table." (
									CATEG_ID,
												PRODUCT_NAME,
												DESCRIPTION
						 ) VALUES (
									'$this->CATEG_ID',
												'$this->PRODUCT_NAME',
												'$this->DESCRIPTION'
									)";
				
		$this->globals->con->exec($sql);
		header("Location:win_close.html");
	}
	
	function saveRec(){
		$sql = "UPDATE ".$this->schema.".".$this->table." SET 
									CATEG_ID = '$this->CATEG_ID',
												PRODUCT_NAME = '$this->PRODUCT_NAME',
												DESCRIPTION = '$this->DESCRIPTION'
							
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
		
					$this->CATEG_ID  = addslashes(trim($_POST["CATEG_ID"]));
					$this->PRODUCT_NAME  = addslashes(trim($_POST["PRODUCT_NAME"]));
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
	
	function setup_display(){
					 
					 
					 
				
									$CATEG_ID_sel = new DB_select("CATEG_ID","eshop.categories");
				$CATEG_ID_sel->query = "SELECT ID AS VALUE, NAME AS LABEL FROM eshop.categories ORDER BY NAME";
				$CATEG_ID_sel->selected_val = $this->CATEG_ID;
				$CATEG_ID_sel->setup_select_options();
			 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
							"CATEG_ID" => $this->CATEG_ID,
							"PRODUCT_NAME" => $this->PRODUCT_NAME,
							"DESCRIPTION" => $this->DESCRIPTION,
									 
						 
						 
													"CATEG_ID_sel" => $CATEG_ID_sel->get_select_str(),
			 
						 
						 
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