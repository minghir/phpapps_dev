<?php
// includes
require_once ("globals.php");

class phpapps_admin_products_form{
	private $globals;
	public $schema = "eshop";
	public $table = "products";
	public $template = "gen_tpl/phpapps_admin_products_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
		public $ID;
		public $CATEG_ID;
		public $PRODUCT_NAME;
		public $DESCRIPTION;
		public $MODIFY_UID;
		public $CREATE_UID;
		public $MODIFY_DATE;
		public $CREATE_DATE;
		
		 
		 
		 
		 
		 
		 
		 
		 
			
		 
		 
		 
		 
		 
		 
		 
		 
	
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
									ID,
												CATEG_ID,
												PRODUCT_NAME,
												DESCRIPTION,
												MODIFY_UID,
												CREATE_UID,
												MODIFY_DATE,
												CREATE_DATE
							
				FROM ".$this->schema.".".$this->table." WHERE ".$this->gfield." = '".$this->gfield_value."'");
			$this->globals->con->query($sql->sql());
			$this->globals->con->next();
							$this->ID = $this->globals->con->get_field("ID");
							$this->CATEG_ID = $this->globals->con->get_field("CATEG_ID");
							$this->PRODUCT_NAME = $this->globals->con->get_field("PRODUCT_NAME");
							$this->DESCRIPTION = $this->globals->con->get_field("DESCRIPTION");
							$this->MODIFY_UID = $this->globals->con->get_field("MODIFY_UID");
							$this->CREATE_UID = $this->globals->con->get_field("CREATE_UID");
							$this->MODIFY_DATE = $this->globals->con->get_field("MODIFY_DATE");
							$this->CREATE_DATE = $this->globals->con->get_field("CREATE_DATE");
						
	}
	
	
	function beforeAddRec(){
	}
	
	function addRec(){
		$this->beforeAddRec();
	
		$this->check_errors();
		$sql = new DB_query("INSERT INTO ".$this->schema.".".$this->table." (
									ID,
												CATEG_ID,
												PRODUCT_NAME,
												DESCRIPTION,
												MODIFY_UID,
												CREATE_UID,
												MODIFY_DATE,
												CREATE_DATE
						 ) VALUES (
									'$this->ID',
												'$this->CATEG_ID',
												'$this->PRODUCT_NAME',
												'$this->DESCRIPTION',
												'$this->MODIFY_UID',
												'$this->CREATE_UID',
												'$this->MODIFY_DATE',
												'$this->CREATE_DATE'
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
									ID = '$this->ID',
												CATEG_ID = '$this->CATEG_ID',
												PRODUCT_NAME = '$this->PRODUCT_NAME',
												DESCRIPTION = '$this->DESCRIPTION',
												MODIFY_UID = '$this->MODIFY_UID',
												CREATE_UID = '$this->CREATE_UID',
												MODIFY_DATE = '$this->MODIFY_DATE',
												CREATE_DATE = '$this->CREATE_DATE'
							
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
		
					$this->ID  = addslashes(trim($_POST["ID"]));
					$this->CATEG_ID  = addslashes(trim($_POST["CATEG_ID"]));
					$this->PRODUCT_NAME  = addslashes(trim($_POST["PRODUCT_NAME"]));
					$this->DESCRIPTION  = addslashes(trim($_POST["DESCRIPTION"]));
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
			}
	
	function setup_display(){
					 
					 
					 
					 
					 
					 
					 
					 
				
					 
					 
					 
					 
					 
					 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
							"ID" => $this->ID,
							"CATEG_ID" => $this->CATEG_ID,
							"PRODUCT_NAME" => $this->PRODUCT_NAME,
							"DESCRIPTION" => $this->DESCRIPTION,
							"MODIFY_UID" => $this->MODIFY_UID,
							"CREATE_UID" => $this->CREATE_UID,
							"MODIFY_DATE" => $this->MODIFY_DATE,
							"CREATE_DATE" => $this->CREATE_DATE,
									 
						 
						 
						 
						 
						 
						 
						 
									 
						 
						 
						 
						 
						 
						 
						 
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