<?php
// includes
namespace wabdo; require_once ("globals.php");

class phpapps_admin_products2_form{
	private $globals;
	public $schema = "eshop";
	public $table = "products";
	public $template = "gen_tpl/phpapps_admin_products2_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
		public $CATEG_ID;
		public $PRODUCT_NAME;
		public $DESCRIPTION;
		
		 
		 
		 
			
			public $CATEG_ID_sel;
	 
		 
		 
	
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
									CATEG_ID,
												PRODUCT_NAME,
												DESCRIPTION
							
				FROM ".$this->schema.".".$this->table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($sql);
			$this->globals->con->next();
							$this->CATEG_ID = $this->globals->con->get_field("CATEG_ID");
							$this->PRODUCT_NAME = $this->globals->con->get_field("PRODUCT_NAME");
							$this->DESCRIPTION = $this->globals->con->get_field("DESCRIPTION");
						
	}
	
	
	function beforeAddRec(){
	}
	
	function addRec(){
		$this->beforeAddRec();
	
		$this->check_errors();
		$sql = new DB_query("INSERT INTO ".$this->schema.".".$this->table." (
									CATEG_ID,
												PRODUCT_NAME,
												DESCRIPTION
						 ) VALUES (
									:CATEG_ID,
												:PRODUCT_NAME,
												:DESCRIPTION
									)",
			array(
									":CATEG_ID" => $this->CATEG_ID,
									":PRODUCT_NAME" => $this->PRODUCT_NAME,
									":DESCRIPTION" => $this->DESCRIPTION,
							)
			);

		if(count($this->errors) == 0) {	
			$this->globals->con->query($sql);
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
									CATEG_ID = :CATEG_ID,
												PRODUCT_NAME = :PRODUCT_NAME,
												DESCRIPTION = :DESCRIPTION
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
									":CATEG_ID" => $this->CATEG_ID,
									":PRODUCT_NAME" => $this->PRODUCT_NAME,
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
		
					$this->CATEG_ID  = addslashes(trim($_POST["CATEG_ID"]));
					$this->PRODUCT_NAME  = addslashes(trim($_POST["PRODUCT_NAME"]));
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
				if($this->CATEG_ID == "") {
			$this->errors[] = "Campul CATEG_ID este obligatoriu!";
		}
			}
	
	function setup_display(){
					 
					 
					 
				
									$this->CATEG_ID_sel = new DB_select("CATEG_ID","eshop.categories");
				$this->CATEG_ID_sel->query = "SELECT ID AS VALUE, ID AS LABEL FROM eshop.categories ORDER BY ID";
				$this->CATEG_ID_sel->selected_val = $this->CATEG_ID;
				$this->CATEG_ID_sel->setup_select_options();
			 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
							"CATEG_ID" => $this->CATEG_ID,
							"PRODUCT_NAME" => $this->PRODUCT_NAME,
							"DESCRIPTION" => $this->DESCRIPTION,
									 
						 
						 
													"CATEG_ID_sel" => $this->CATEG_ID_sel->get_select_str(),
			 
						 
						 
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