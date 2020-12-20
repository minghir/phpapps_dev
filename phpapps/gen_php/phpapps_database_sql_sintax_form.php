<?php
// includes
namespace wabdo; require_once ("globals.php");

class phpapps_database_sql_sintax_form{
	public $globals;
	public $schema = "phpapps";
	public $table = "sql_sintax";
	public $template = "gen_tpl/phpapps_database_sql_sintax_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
		public $ID;
		public $DBMS_TYPE_ID;
		public $SINTAX_TYPE_ID;
		public $DEF_TPL;
		public $DESCRIPTION;
		
		 
			public $DBMS_TYPE_ID_sel;
	 
			public $SINTAX_TYPE_ID_sel;
	 
		 
		 
			
		 
		 
		 
		 
		 
	
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
									ID,
												DBMS_TYPE_ID,
												SINTAX_TYPE_ID,
												DEF_TPL,
												DESCRIPTION
							
				FROM ".$this->schema.".".$this->table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($sql);
			$this->globals->con->next();
							$this->ID = stripslashes($this->globals->con->get_field("ID"));
							$this->DBMS_TYPE_ID = stripslashes($this->globals->con->get_field("DBMS_TYPE_ID"));
							$this->SINTAX_TYPE_ID = stripslashes($this->globals->con->get_field("SINTAX_TYPE_ID"));
							$this->DEF_TPL = stripslashes($this->globals->con->get_field("DEF_TPL"));
							$this->DESCRIPTION = stripslashes($this->globals->con->get_field("DESCRIPTION"));
						
	}
	
	function afterGetRec(){
	}
	
	function beforeAddRec(){
	}
	
	function addRec(){
		$this->beforeAddRec();
	
		$this->check_errors();
		$sql = new DB_query("INSERT INTO ".$this->schema.".".$this->table." (
									ID,
												DBMS_TYPE_ID,
												SINTAX_TYPE_ID,
												DEF_TPL,
												DESCRIPTION
						 ) VALUES (
									:ID,
												:DBMS_TYPE_ID,
												:SINTAX_TYPE_ID,
												:DEF_TPL,
												:DESCRIPTION
									)",
			array(
									":ID" => $this->ID,
									":DBMS_TYPE_ID" => $this->DBMS_TYPE_ID,
									":SINTAX_TYPE_ID" => $this->SINTAX_TYPE_ID,
									":DEF_TPL" => $this->DEF_TPL,
									":DESCRIPTION" => $this->DESCRIPTION,
							)
			);

		if(count($this->errors) == 0) {	
			if( $this->globals->con->query($sql) == -1){
                            $this->errors[] = $this->globals->con->get_error();
                        }
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
									ID = :ID,
												DBMS_TYPE_ID = :DBMS_TYPE_ID,
												SINTAX_TYPE_ID = :SINTAX_TYPE_ID,
												DEF_TPL = :DEF_TPL,
												DESCRIPTION = :DESCRIPTION
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
									":ID" => $this->ID,
									":DBMS_TYPE_ID" => $this->DBMS_TYPE_ID,
									":SINTAX_TYPE_ID" => $this->SINTAX_TYPE_ID,
									":DEF_TPL" => $this->DEF_TPL,
									":DESCRIPTION" => $this->DESCRIPTION,
								":".$this->gfield => $this->gfield_value
			)	
			);
				
		if(count($this->errors) == 0) {	
			if( $this->globals->con->query($sql) == -1){
                            $this->errors[] = $this->globals->con->get_error();
                        }
		};
		
		$this->afterSaveRec();
	}
	
	function afterSaveRec(){
		//header("Location:win_close.html");
	}

	function beforeDeleteRec(){
	}
	
	function deleteRec(){
		$this->beforeDeleteRec();
		
		$sql = new DB_query("DELETE FROM ".$this->schema.".".$this->table."
				WHERE ".$this->gfield." = :".$this->gfield, array(":".$this->gfield=>$this->gfield_value) );
				
		if(count($this->errors) == 0) {
			if( $this->globals->con->query($sql) == -1){
                            $this->errors[] = $this->globals->con->get_error();
                        }
		}
		
		$this->afterDeleteRec();
	}
	
	function afterDeleteRec(){
		//header("Location:win_close.html");
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
		
					$this->ID  = addslashes(trim($_POST["ID"]));
					$this->DBMS_TYPE_ID  = addslashes(trim($_POST["DBMS_TYPE_ID"]));
					$this->SINTAX_TYPE_ID  = addslashes(trim($_POST["SINTAX_TYPE_ID"]));
					$this->DEF_TPL  = addslashes(trim($_POST["DEF_TPL"]));
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
				if($this->DBMS_TYPE_ID == "") {
			$this->errors[] = "Campul DBMS_TYPE_ID este obligatoriu!";
		}
				if($this->SINTAX_TYPE_ID == "") {
			$this->errors[] = "Campul SINTAX_TYPE_ID este obligatoriu!";
		}
			}
	
	function setup_display(){
					 
								$this->DBMS_TYPE_ID_sel = new DB_select("DBMS_TYPE_ID","{$this->globals->PHPAPPS_DB}.list_dbms_types");
			$this->DBMS_TYPE_ID_sel->selected_val = $this->DBMS_TYPE_ID;
			$this->DBMS_TYPE_ID_sel->setup_select_options();
			 
								$this->SINTAX_TYPE_ID_sel = new DB_select("SINTAX_TYPE_ID","{$this->globals->PHPAPPS_DB}.list_sql_sintax_types");
			$this->SINTAX_TYPE_ID_sel->selected_val = $this->SINTAX_TYPE_ID;
			$this->SINTAX_TYPE_ID_sel->setup_select_options();
			 
					 
					 
				
					 
					 
					 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
							"ID" => $this->ID,
							"DBMS_TYPE_ID" => $this->DBMS_TYPE_ID,
							"SINTAX_TYPE_ID" => $this->SINTAX_TYPE_ID,
							"DEF_TPL" => $this->DEF_TPL,
							"DESCRIPTION" => $this->DESCRIPTION,
									 
										"DBMS_TYPE_ID_sel" => $this->DBMS_TYPE_ID_sel->get_select_str(),
			 
										"SINTAX_TYPE_ID_sel" => $this->SINTAX_TYPE_ID_sel->get_select_str(),
			 
						 
						 
									 
						 
						 
						 
						 
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