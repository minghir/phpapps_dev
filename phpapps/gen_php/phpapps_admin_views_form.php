<?php
// includes
require_once ("globals.php");

class phpapps_admin_views_form{
	private $globals;
	public $schema = "phpapps";
	public $table = "views";
	public $template = "gen_tpl/phpapps_admin_views_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
		public $MODULE_ID;
		public $VIEW_NAME;
		public $CREATE_VIEW_QUERY;
		public $DESCRIPTION;
		
		 
		 
		 
		 
			
			public $MODULE_ID_sel;
	 
		 
		 
		 
	
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
									MODULE_ID,
												VIEW_NAME,
												CREATE_VIEW_QUERY,
												DESCRIPTION
							
				FROM ".$this->schema.".".$this->table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($sql);
			$this->globals->con->next();
							$this->MODULE_ID = $this->globals->con->get_field("MODULE_ID");
							$this->VIEW_NAME = $this->globals->con->get_field("VIEW_NAME");
							$this->CREATE_VIEW_QUERY = $this->globals->con->get_field("CREATE_VIEW_QUERY");
							$this->DESCRIPTION = $this->globals->con->get_field("DESCRIPTION");
						
	}
	
	
	function beforeAddRec(){
	}
	
	function addRec(){
		$this->beforeAddRec();
	
		$this->check_errors();
		$sql = new DB_query("INSERT INTO ".$this->schema.".".$this->table." (
									MODULE_ID,
												VIEW_NAME,
												CREATE_VIEW_QUERY,
												DESCRIPTION
						 ) VALUES (
									:MODULE_ID,
												:VIEW_NAME,
												:CREATE_VIEW_QUERY,
												:DESCRIPTION
									)",
			array(
									":MODULE_ID" => $this->MODULE_ID,
									":VIEW_NAME" => $this->VIEW_NAME,
									":CREATE_VIEW_QUERY" => $this->CREATE_VIEW_QUERY,
									":DESCRIPTION" => $this->DESCRIPTION,
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
									MODULE_ID = :MODULE_ID,
												VIEW_NAME = :VIEW_NAME,
												CREATE_VIEW_QUERY = :CREATE_VIEW_QUERY,
												DESCRIPTION = :DESCRIPTION
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
									":MODULE_ID" => $this->MODULE_ID,
									":VIEW_NAME" => $this->VIEW_NAME,
									":CREATE_VIEW_QUERY" => $this->CREATE_VIEW_QUERY,
									":DESCRIPTION" => $this->DESCRIPTION,
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
		$this->globals->con->query($sql);
		
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
		
					$this->MODULE_ID  = addslashes(trim($_POST["MODULE_ID"]));
					$this->VIEW_NAME  = addslashes(trim($_POST["VIEW_NAME"]));
					$this->CREATE_VIEW_QUERY  = addslashes(trim($_POST["CREATE_VIEW_QUERY"]));
					$this->DESCRIPTION  = addslashes(trim($_POST["DESCRIPTION"]));
				
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
				if($this->MODULE_ID == "") {
			$this->errors[] = "Campul MODULE_ID este obligatoriu!";
		}
				if($this->VIEW_NAME == "") {
			$this->errors[] = "Campul VIEW_NAME este obligatoriu!";
		}
			}
	
	function setup_display(){
					 
					 
					 
					 
				
									$this->MODULE_ID_sel = new DB_select("MODULE_ID","phpapps.modules");
				$this->MODULE_ID_sel->query = "SELECT ID AS VALUE, MODULE_NAME AS LABEL FROM phpapps.modules ORDER BY MODULE_NAME";
				$this->MODULE_ID_sel->selected_val = $this->MODULE_ID;
				$this->MODULE_ID_sel->setup_select_options();
			 
					 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
							"MODULE_ID" => $this->MODULE_ID,
							"VIEW_NAME" => $this->VIEW_NAME,
							"CREATE_VIEW_QUERY" => $this->CREATE_VIEW_QUERY,
							"DESCRIPTION" => $this->DESCRIPTION,
									 
						 
						 
						 
													"MODULE_ID_sel" => $this->MODULE_ID_sel->get_select_str(),
			 
						 
						 
						 
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