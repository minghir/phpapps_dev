<?php
// includes
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");


class phpapps_admin_modules_form extends phpapps_display_abs{
	public $globals;
	public $form_schema = "phpapps";
	public $form_table = "modules";
	public $template = "gen_tpl/phpapps_admin_modules_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
	            
	public $APP_ID;
        	            
	public $SCRIPT_ID;
        	            
	public $MODULE_NAME;
        	            
	public $MODULE_TITLE;
        	            
	public $MODULE_DATE;
        	            
	public $DESCRIPTION;
        		
		 
		 
		 
		 
		 
		 
			
		 
			public $SCRIPT_ID_sel;
	 
		 
		 
		 
		 
	        
        

	public $errors = array();
	
	function __construct(){
            parent::__construct();
		global $GLOBALS_OBJ;
		$this->globals = &$GLOBALS_OBJ;
                
                			 
					 
					 
					 
					 
					 
				
					 
									$this->SCRIPT_ID_sel = new DB_select("SCRIPT_ID","phpapps.scripts");
                                			 
					 
					 
					 
					 
		                
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
									APP_ID,
												SCRIPT_ID,
												MODULE_NAME,
												MODULE_TITLE,
												MODULE_DATE,
												DESCRIPTION
							
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($sql);
			$this->globals->con->next();
			                                                                $this->APP_ID = stripslashes($this->globals->con->get_field("APP_ID"));
                                			                                                                $this->SCRIPT_ID = stripslashes($this->globals->con->get_field("SCRIPT_ID"));
                                			                                                                $this->MODULE_NAME = stripslashes($this->globals->con->get_field("MODULE_NAME"));
                                			                                                                $this->MODULE_TITLE = stripslashes($this->globals->con->get_field("MODULE_TITLE"));
                                			                                                                $this->MODULE_DATE = stripslashes($this->globals->con->get_field("MODULE_DATE"));
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
															APP_ID,
																						SCRIPT_ID,
																						MODULE_NAME,
																						MODULE_TITLE,
																						MODULE_DATE,
																						DESCRIPTION
										 ) VALUES (
															:APP_ID,
																						:SCRIPT_ID,
																						:MODULE_NAME,
																						:MODULE_TITLE,
																						:MODULE_DATE,
																						:DESCRIPTION
													)",
			array(
									                                            
                                            ":APP_ID" => $this->APP_ID,
                                        														                                            
                                            ":SCRIPT_ID" => $this->SCRIPT_ID,
                                        														                                            
                                            ":MODULE_NAME" => $this->MODULE_NAME,
                                        														                                            
                                            ":MODULE_TITLE" => $this->MODULE_TITLE,
                                        														                                            
                                            ":MODULE_DATE" => $this->MODULE_DATE,
                                        														                                            
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
									APP_ID = :APP_ID,
												SCRIPT_ID = :SCRIPT_ID,
												MODULE_NAME = :MODULE_NAME,
												MODULE_TITLE = :MODULE_TITLE,
												MODULE_DATE = :MODULE_DATE,
												DESCRIPTION = :DESCRIPTION
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
				                                                                                    ":APP_ID" => $this->APP_ID,
                                        				                                                                                    ":SCRIPT_ID" => $this->SCRIPT_ID,
                                        				                                                                                    ":MODULE_NAME" => $this->MODULE_NAME,
                                        				                                                                                    ":MODULE_TITLE" => $this->MODULE_TITLE,
                                        				                                                                                    ":MODULE_DATE" => $this->MODULE_DATE,
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
		
		                                                    $this->APP_ID  = addslashes(trim($_POST["APP_ID"]));
                        		                                                    $this->SCRIPT_ID  = addslashes(trim($_POST["SCRIPT_ID"]));
                        		                                                    $this->MODULE_NAME  = addslashes(trim($_POST["MODULE_NAME"]));
                        		                                                    $this->MODULE_TITLE  = addslashes(trim($_POST["MODULE_TITLE"]));
                        		                                                    $this->MODULE_DATE  = addslashes(trim($_POST["MODULE_DATE"]));
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
				if($this->APP_ID == "") {
			$this->errors[] = "Campul APP_ID este obligatoriu!";
		}
				if($this->SCRIPT_ID == "") {
			$this->errors[] = "Campul SCRIPT_ID este obligatoriu!";
		}
				if($this->MODULE_NAME == "") {
			$this->errors[] = "Campul MODULE_NAME este obligatoriu!";
		}
			}
	
	function setup_display(){
					 
					 
					 
					 
					 
					 
				
					 
									//$this->SCRIPT_ID_sel = new DB_select("SCRIPT_ID",".phpapps.scripts");
				$this->SCRIPT_ID_sel->db_query = new DB_query("SELECT ID AS VALUE, SCRIPT_NAME AS LABEL FROM phpapps.scripts ORDER BY SCRIPT_NAME");
				$this->SCRIPT_ID_sel->selected_val = $this->SCRIPT_ID;
				$this->SCRIPT_ID_sel->setup_select_options();
			 
					 
					 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
							"APP_ID" => $this->APP_ID,
							"SCRIPT_ID" => $this->SCRIPT_ID,
							"MODULE_NAME" => $this->MODULE_NAME,
							"MODULE_TITLE" => $this->MODULE_TITLE,
							"MODULE_DATE" => $this->MODULE_DATE,
							"DESCRIPTION" => $this->DESCRIPTION,
									 
						 
						 
						 
						 
						 
									 
										"SCRIPT_ID_sel" => $this->SCRIPT_ID_sel->get_select_str(),
			 
						 
						 
						 
						 
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