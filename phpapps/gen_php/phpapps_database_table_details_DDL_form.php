<?php
// includes
require_once ("globals.php");

class phpapps_database_table_details_DDL_form{
	public $globals;
	public $form_schema = "phpapps";
	public $form_table = "table_details";
	public $template = "gen_tpl/phpapps_database_table_details_DDL_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
		public $ID;
		public $TABLE_ID;
		public $COLUMN_NAME;
		public $COLUMN_TYPE_ID;
		public $UNSIGN;
		public $COLUMN_SIZE;
		public $ACCEPT_NULL;
		public $COLUMN_DEFAULT_VALUE;
		public $AUTOINCREMENT;
		public $DESCRIPTION;
		
		 
		 
		 
			public $COLUMN_TYPE_ID_sel;
	 
			public $UNSIGN_sel;
	 
		 
			public $ACCEPT_NULL_sel;
	 
		 
			public $AUTOINCREMENT_sel;
	 
		 
			
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
	
	public $errors = array();
	
	function __construct(){
		global $GLOBALS_OBJ;
		$this->globals = &$GLOBALS_OBJ;
                
                			 
					 
					 
								$this->COLUMN_TYPE_ID_sel = new DB_select("COLUMN_TYPE_ID",".list_mysql_column_types");
			 
								$this->UNSIGN_sel = new DB_select("UNSIGN",".list_no_yes");
			 
					 
								$this->ACCEPT_NULL_sel = new DB_select("ACCEPT_NULL",".list_no_yes");
			 
					 
								$this->AUTOINCREMENT_sel = new DB_select("AUTOINCREMENT",".list_no_yes");
			 
					 
				
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
		                
	}
		
	function init(){
		if($_SERVER['REQUEST_METHOD'] === 'POST') {
			$this->parsePostVars();
                        $this->takePostActions();
		} else {
			$this->parseGetVars();
                        $this->takeGetActions();
		}
	}
	
	function beforeGetRec(){
	}
	
	function getRec(){
		$sql = new DB_query( "SELECT 
									ID,
												TABLE_ID,
												COLUMN_NAME,
												COLUMN_TYPE_ID,
												UNSIGN,
												COLUMN_SIZE,
												ACCEPT_NULL,
												COLUMN_DEFAULT_VALUE,
												AUTOINCREMENT,
												DESCRIPTION
							
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($sql);
			$this->globals->con->next();
							$this->ID = stripslashes($this->globals->con->get_field("ID"));
							$this->TABLE_ID = stripslashes($this->globals->con->get_field("TABLE_ID"));
							$this->COLUMN_NAME = stripslashes($this->globals->con->get_field("COLUMN_NAME"));
							$this->COLUMN_TYPE_ID = stripslashes($this->globals->con->get_field("COLUMN_TYPE_ID"));
							$this->UNSIGN = stripslashes($this->globals->con->get_field("UNSIGN"));
							$this->COLUMN_SIZE = stripslashes($this->globals->con->get_field("COLUMN_SIZE"));
							$this->ACCEPT_NULL = stripslashes($this->globals->con->get_field("ACCEPT_NULL"));
							$this->COLUMN_DEFAULT_VALUE = stripslashes($this->globals->con->get_field("COLUMN_DEFAULT_VALUE"));
							$this->AUTOINCREMENT = stripslashes($this->globals->con->get_field("AUTOINCREMENT"));
							$this->DESCRIPTION = stripslashes($this->globals->con->get_field("DESCRIPTION"));
						
	}
	
	function afterGetRec(){
	}
	
	function beforeAddRec(){
	}
	
	function addRec(){
		$this->beforeAddRec();
	
		$this->check_errors();
		$sql = new DB_query("INSERT INTO ".$this->form_schema.".".$this->form_table." (
									ID,
												TABLE_ID,
												COLUMN_NAME,
												COLUMN_TYPE_ID,
												UNSIGN,
												COLUMN_SIZE,
												ACCEPT_NULL,
												COLUMN_DEFAULT_VALUE,
												AUTOINCREMENT,
												DESCRIPTION
						 ) VALUES (
									:ID,
												:TABLE_ID,
												:COLUMN_NAME,
												:COLUMN_TYPE_ID,
												:UNSIGN,
												:COLUMN_SIZE,
												:ACCEPT_NULL,
												:COLUMN_DEFAULT_VALUE,
												:AUTOINCREMENT,
												:DESCRIPTION
									)",
			array(
									":ID" => $this->ID,
									":TABLE_ID" => $this->TABLE_ID,
									":COLUMN_NAME" => $this->COLUMN_NAME,
									":COLUMN_TYPE_ID" => $this->COLUMN_TYPE_ID,
									":UNSIGN" => $this->UNSIGN,
									":COLUMN_SIZE" => $this->COLUMN_SIZE,
									":ACCEPT_NULL" => $this->ACCEPT_NULL,
									":COLUMN_DEFAULT_VALUE" => $this->COLUMN_DEFAULT_VALUE,
									":AUTOINCREMENT" => $this->AUTOINCREMENT,
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
		
		$sql = new DB_query("UPDATE ".$this->form_schema.".".$this->form_table." SET 
									ID = :ID,
												TABLE_ID = :TABLE_ID,
												COLUMN_NAME = :COLUMN_NAME,
												COLUMN_TYPE_ID = :COLUMN_TYPE_ID,
												UNSIGN = :UNSIGN,
												COLUMN_SIZE = :COLUMN_SIZE,
												ACCEPT_NULL = :ACCEPT_NULL,
												COLUMN_DEFAULT_VALUE = :COLUMN_DEFAULT_VALUE,
												AUTOINCREMENT = :AUTOINCREMENT,
												DESCRIPTION = :DESCRIPTION
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
									":ID" => $this->ID,
									":TABLE_ID" => $this->TABLE_ID,
									":COLUMN_NAME" => $this->COLUMN_NAME,
									":COLUMN_TYPE_ID" => $this->COLUMN_TYPE_ID,
									":UNSIGN" => $this->UNSIGN,
									":COLUMN_SIZE" => $this->COLUMN_SIZE,
									":ACCEPT_NULL" => $this->ACCEPT_NULL,
									":COLUMN_DEFAULT_VALUE" => $this->COLUMN_DEFAULT_VALUE,
									":AUTOINCREMENT" => $this->AUTOINCREMENT,
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
		
		$sql = new DB_query("DELETE FROM ".$this->form_schema.".".$this->form_table."
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
        }
        
        function takeGetActions(){
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
					$this->TABLE_ID  = addslashes(trim($_POST["TABLE_ID"]));
					$this->COLUMN_NAME  = addslashes(trim($_POST["COLUMN_NAME"]));
					$this->COLUMN_TYPE_ID  = addslashes(trim($_POST["COLUMN_TYPE_ID"]));
					$this->UNSIGN  = addslashes(trim($_POST["UNSIGN"]));
					$this->COLUMN_SIZE  = addslashes(trim($_POST["COLUMN_SIZE"]));
					$this->ACCEPT_NULL  = addslashes(trim($_POST["ACCEPT_NULL"]));
					$this->COLUMN_DEFAULT_VALUE  = addslashes(trim($_POST["COLUMN_DEFAULT_VALUE"]));
					$this->AUTOINCREMENT  = addslashes(trim($_POST["AUTOINCREMENT"]));
					$this->DESCRIPTION  = addslashes(trim($_POST["DESCRIPTION"]));
		        }
		
        function takePostActions(){
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
				if($this->COLUMN_NAME == "") {
			$this->errors[] = "Campul COLUMN_NAME este obligatoriu!";
		}
				if($this->COLUMN_TYPE_ID == "") {
			$this->errors[] = "Campul COLUMN_TYPE_ID este obligatoriu!";
		}
				if($this->UNSIGN == "") {
			$this->errors[] = "Campul UNSIGN este obligatoriu!";
		}
				if($this->ACCEPT_NULL == "") {
			$this->errors[] = "Campul ACCEPT_NULL este obligatoriu!";
		}
				if($this->AUTOINCREMENT == "") {
			$this->errors[] = "Campul AUTOINCREMENT este obligatoriu!";
		}
			}
	
	function setup_display(){
					 
					 
					 
								//$this->COLUMN_TYPE_ID_sel = new DB_select("COLUMN_TYPE_ID",".list_mysql_column_types");
			$this->COLUMN_TYPE_ID_sel->selected_val = $this->COLUMN_TYPE_ID;
			$this->COLUMN_TYPE_ID_sel->setup_select_options();
			 
								//$this->UNSIGN_sel = new DB_select("UNSIGN",".list_no_yes");
			$this->UNSIGN_sel->selected_val = $this->UNSIGN;
			$this->UNSIGN_sel->setup_select_options();
			 
					 
								//$this->ACCEPT_NULL_sel = new DB_select("ACCEPT_NULL",".list_no_yes");
			$this->ACCEPT_NULL_sel->selected_val = $this->ACCEPT_NULL;
			$this->ACCEPT_NULL_sel->setup_select_options();
			 
					 
								//$this->AUTOINCREMENT_sel = new DB_select("AUTOINCREMENT",".list_no_yes");
			$this->AUTOINCREMENT_sel->selected_val = $this->AUTOINCREMENT;
			$this->AUTOINCREMENT_sel->setup_select_options();
			 
					 
				
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
							"ID" => $this->ID,
							"TABLE_ID" => $this->TABLE_ID,
							"COLUMN_NAME" => $this->COLUMN_NAME,
							"COLUMN_TYPE_ID" => $this->COLUMN_TYPE_ID,
							"UNSIGN" => $this->UNSIGN,
							"COLUMN_SIZE" => $this->COLUMN_SIZE,
							"ACCEPT_NULL" => $this->ACCEPT_NULL,
							"COLUMN_DEFAULT_VALUE" => $this->COLUMN_DEFAULT_VALUE,
							"AUTOINCREMENT" => $this->AUTOINCREMENT,
							"DESCRIPTION" => $this->DESCRIPTION,
									 
						 
						 
										"COLUMN_TYPE_ID_sel" => $this->COLUMN_TYPE_ID_sel->get_select_str(),
			 
										"UNSIGN_sel" => $this->UNSIGN_sel->get_select_str(),
			 
						 
										"ACCEPT_NULL_sel" => $this->ACCEPT_NULL_sel->get_select_str(),
			 
						 
										"AUTOINCREMENT_sel" => $this->AUTOINCREMENT_sel->get_select_str(),
			 
						 
									 
						 
						 
						 
						 
						 
						 
						 
						 
						 
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
                $this->beforeDisplay();
		$this->setup_display();
		$this->globals->sm->display($this->template);
		$this->afterDisplay();
	}
	
	function afterDisplay(){	
	}
	
	function get_html_str(){	
                $this->beforeDisplay();
		$this->setup_display();
		$this->globals->sm->fetch($this->template);
                $this->afterDisplay();
	}
}
?>