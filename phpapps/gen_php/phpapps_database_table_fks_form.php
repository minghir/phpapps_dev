<?php
// includes
require_once ("globals.php");

class phpapps_database_table_fks_form{
	public $globals;
	public $form_schema = "phpapps";
	public $form_table = "table_fks";
	public $template = "gen_tpl/phpapps_database_table_fks_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
		public $ID;
		public $COLUMN_ID;
		public $FK_NAME;
		public $FK_TABLE_ID;
		public $FK_COLUMN_ID;
		public $ON_UPDATE;
		public $ON_DELETE;
		public $DESCRIPTION;
		
		 
		 
		 
		 
		 
			public $ON_UPDATE_sel;
	 
			public $ON_DELETE_sel;
	 
		 
			
		 
			public $COLUMN_ID_sel;
	 
		 
			public $FK_TABLE_ID_sel;
	 
			public $FK_COLUMN_ID_sel;
	 
		 
		 
		 
	
	public $errors = array();
	
	function __construct(){
		global $GLOBALS_OBJ;
		$this->globals = &$GLOBALS_OBJ;
                
                			 
					 
					 
					 
					 
								$this->ON_UPDATE_sel = new DB_select("ON_UPDATE",".list_foreign_key_options");
			 
								$this->ON_DELETE_sel = new DB_select("ON_DELETE",".list_foreign_key_options");
			 
					 
				
					 
									$this->COLUMN_ID_sel = new DB_select("COLUMN_ID",".table_details");
			 
					 
									$this->FK_TABLE_ID_sel = new DB_select("FK_TABLE_ID",".tables");
			 
									$this->FK_COLUMN_ID_sel = new DB_select("FK_COLUMN_ID",".table_details");
			 
					 
					 
					 
		                
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
												COLUMN_ID,
												FK_NAME,
												FK_TABLE_ID,
												FK_COLUMN_ID,
												ON_UPDATE,
												ON_DELETE,
												DESCRIPTION
							
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($sql);
			$this->globals->con->next();
							$this->ID = stripslashes($this->globals->con->get_field("ID"));
							$this->COLUMN_ID = stripslashes($this->globals->con->get_field("COLUMN_ID"));
							$this->FK_NAME = stripslashes($this->globals->con->get_field("FK_NAME"));
							$this->FK_TABLE_ID = stripslashes($this->globals->con->get_field("FK_TABLE_ID"));
							$this->FK_COLUMN_ID = stripslashes($this->globals->con->get_field("FK_COLUMN_ID"));
							$this->ON_UPDATE = stripslashes($this->globals->con->get_field("ON_UPDATE"));
							$this->ON_DELETE = stripslashes($this->globals->con->get_field("ON_DELETE"));
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
																					COLUMN_ID,
																						FK_NAME,
																						FK_TABLE_ID,
																						FK_COLUMN_ID,
																						ON_UPDATE,
																						ON_DELETE,
																						DESCRIPTION
										 ) VALUES (
																					:COLUMN_ID,
																						:FK_NAME,
																						:FK_TABLE_ID,
																						:FK_COLUMN_ID,
																						:ON_UPDATE,
																						:ON_DELETE,
																						:DESCRIPTION
													)",
			array(
																							":COLUMN_ID" => $this->COLUMN_ID,
																			":FK_NAME" => $this->FK_NAME,
																			":FK_TABLE_ID" => $this->FK_TABLE_ID,
																			":FK_COLUMN_ID" => $this->FK_COLUMN_ID,
																			":ON_UPDATE" => $this->ON_UPDATE,
																			":ON_DELETE" => $this->ON_DELETE,
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
												COLUMN_ID = :COLUMN_ID,
												FK_NAME = :FK_NAME,
												FK_TABLE_ID = :FK_TABLE_ID,
												FK_COLUMN_ID = :FK_COLUMN_ID,
												ON_UPDATE = :ON_UPDATE,
												ON_DELETE = :ON_DELETE,
												DESCRIPTION = :DESCRIPTION
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
									":ID" => $this->ID,
									":COLUMN_ID" => $this->COLUMN_ID,
									":FK_NAME" => $this->FK_NAME,
									":FK_TABLE_ID" => $this->FK_TABLE_ID,
									":FK_COLUMN_ID" => $this->FK_COLUMN_ID,
									":ON_UPDATE" => $this->ON_UPDATE,
									":ON_DELETE" => $this->ON_DELETE,
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
					$this->COLUMN_ID  = addslashes(trim($_POST["COLUMN_ID"]));
					$this->FK_NAME  = addslashes(trim($_POST["FK_NAME"]));
					$this->FK_TABLE_ID  = addslashes(trim($_POST["FK_TABLE_ID"]));
					$this->FK_COLUMN_ID  = addslashes(trim($_POST["FK_COLUMN_ID"]));
					$this->ON_UPDATE  = addslashes(trim($_POST["ON_UPDATE"]));
					$this->ON_DELETE  = addslashes(trim($_POST["ON_DELETE"]));
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
				if($this->COLUMN_ID == "") {
			$this->errors[] = "Campul COLUMN_ID este obligatoriu!";
		}
				if($this->FK_NAME == "") {
			$this->errors[] = "Campul FK_NAME este obligatoriu!";
		}
				if($this->FK_TABLE_ID == "") {
			$this->errors[] = "Campul FK_TABLE_ID este obligatoriu!";
		}
			}
	
	function setup_display(){
					 
					 
					 
					 
					 
								//$this->ON_UPDATE_sel = new DB_select("ON_UPDATE",".list_foreign_key_options");
			$this->ON_UPDATE_sel->selected_val = $this->ON_UPDATE;
			$this->ON_UPDATE_sel->setup_select_options();
			 
								//$this->ON_DELETE_sel = new DB_select("ON_DELETE",".list_foreign_key_options");
			$this->ON_DELETE_sel->selected_val = $this->ON_DELETE;
			$this->ON_DELETE_sel->setup_select_options();
			 
					 
				
					 
									//$this->COLUMN_ID_sel = new DB_select("COLUMN_ID",".table_details");
				$this->COLUMN_ID_sel->query = "SELECT ID AS VALUE, COLUMN_NAME AS LABEL FROM .table_details ORDER BY COLUMN_NAME";
				$this->COLUMN_ID_sel->selected_val = $this->COLUMN_ID;
				$this->COLUMN_ID_sel->setup_select_options();
			 
					 
									//$this->FK_TABLE_ID_sel = new DB_select("FK_TABLE_ID",".tables");
				$this->FK_TABLE_ID_sel->query = "SELECT ID AS VALUE, TABLE_NAME AS LABEL FROM .tables ORDER BY TABLE_NAME";
				$this->FK_TABLE_ID_sel->selected_val = $this->FK_TABLE_ID;
				$this->FK_TABLE_ID_sel->setup_select_options();
			 
									//$this->FK_COLUMN_ID_sel = new DB_select("FK_COLUMN_ID",".table_details");
				$this->FK_COLUMN_ID_sel->query = "SELECT ID AS VALUE, COLUMN_NAME AS LABEL FROM .table_details ORDER BY COLUMN_NAME";
				$this->FK_COLUMN_ID_sel->selected_val = $this->FK_COLUMN_ID;
				$this->FK_COLUMN_ID_sel->setup_select_options();
			 
					 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
							"ID" => $this->ID,
							"COLUMN_ID" => $this->COLUMN_ID,
							"FK_NAME" => $this->FK_NAME,
							"FK_TABLE_ID" => $this->FK_TABLE_ID,
							"FK_COLUMN_ID" => $this->FK_COLUMN_ID,
							"ON_UPDATE" => $this->ON_UPDATE,
							"ON_DELETE" => $this->ON_DELETE,
							"DESCRIPTION" => $this->DESCRIPTION,
									 
						 
						 
						 
						 
										"ON_UPDATE_sel" => $this->ON_UPDATE_sel->get_select_str(),
			 
										"ON_DELETE_sel" => $this->ON_DELETE_sel->get_select_str(),
			 
						 
									 
										"COLUMN_ID_sel" => $this->COLUMN_ID_sel->get_select_str(),
			 
						 
										"FK_TABLE_ID_sel" => $this->FK_TABLE_ID_sel->get_select_str(),
			 
										"FK_COLUMN_ID_sel" => $this->FK_COLUMN_ID_sel->get_select_str(),
			 
						 
						 
						 
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