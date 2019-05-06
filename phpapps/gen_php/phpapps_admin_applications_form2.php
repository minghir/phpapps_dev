<?php
// includes
require_once ("globals.php");

class phpapps_admin_applications_form{
	public $globals;
	public $form_schema = "phpapps";
	public $form_table = "applications";
	public $template = "gen_tpl/phpapps_admin_applications_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
	            
	public $USER_ID;
        	            
	public $APP_NAME;
        	            
	public $APP_TITLE;
        	            
	public $APP_SCHEMA;
        	            
	public $BASE_DIR;
        	            
	public $APP_DATE;
        	            
	public $DESCRIPTION;
       
        public $APP_SCHEMA_sel;
	 
		 
		 
			
			public $USER_ID_sel;
	 
		 
		 
		 
		 
		 
		 
	        
        

	public $errors = array();
	
	function __construct(){
		global $GLOBALS_OBJ;
		$this->globals = &$GLOBALS_OBJ;
                
                			 
					 
					 
								$this->APP_SCHEMA_sel = new DB_select("APP_SCHEMA","phpapps.list_databases");
                        			 
					 
					 
					 
				
									$this->USER_ID_sel = new DB_select("USER_ID","phpapps.users");
                                			 
					 
					 
					 
					 
					 
					 
		                
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
									USER_ID,
												APP_NAME,
												APP_TITLE,
												APP_SCHEMA,
												BASE_DIR,
												APP_DATE,
												DESCRIPTION
							
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($sql);
			$this->globals->con->next();
			                                                                $this->USER_ID = stripslashes($this->globals->con->get_field("USER_ID"));
                                			                                                                $this->APP_NAME = stripslashes($this->globals->con->get_field("APP_NAME"));
                                			                                                                $this->APP_TITLE = stripslashes($this->globals->con->get_field("APP_TITLE"));
                                			                                                                $this->APP_SCHEMA = stripslashes($this->globals->con->get_field("APP_SCHEMA"));
                                			                                                                $this->BASE_DIR = stripslashes($this->globals->con->get_field("BASE_DIR"));
                                			                                                                $this->APP_DATE = stripslashes($this->globals->con->get_field("APP_DATE"));
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
															USER_ID,
																						APP_NAME,
																						APP_TITLE,
																						APP_SCHEMA,
																						BASE_DIR,
																						APP_DATE,
																						DESCRIPTION
										 ) VALUES (
															:USER_ID,
																						:APP_NAME,
																						:APP_TITLE,
																						:APP_SCHEMA,
																						:BASE_DIR,
																						:APP_DATE,
																						:DESCRIPTION
													)",
			array(
									                                            
                                            ":USER_ID" => $this->USER_ID,
                                        														                                            
                                            ":APP_NAME" => $this->APP_NAME,
                                        														                                            
                                            ":APP_TITLE" => $this->APP_TITLE,
                                        														                                            
                                            ":APP_SCHEMA" => $this->APP_SCHEMA,
                                        														                                            
                                            ":BASE_DIR" => $this->BASE_DIR,
                                        														                                            
                                            ":APP_DATE" => $this->APP_DATE,
                                        														                                            
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
									USER_ID = :USER_ID,
												APP_NAME = :APP_NAME,
												APP_TITLE = :APP_TITLE,
												APP_SCHEMA = :APP_SCHEMA,
												BASE_DIR = :BASE_DIR,
												APP_DATE = :APP_DATE,
												DESCRIPTION = :DESCRIPTION
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
				                                                                                    ":USER_ID" => $this->USER_ID,
                                        				                                                                                    ":APP_NAME" => $this->APP_NAME,
                                        				                                                                                    ":APP_TITLE" => $this->APP_TITLE,
                                        				                                                                                    ":APP_SCHEMA" => $this->APP_SCHEMA,
                                        				                                                                                    ":BASE_DIR" => $this->BASE_DIR,
                                        				                                                                                    ":APP_DATE" => $this->APP_DATE,
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
                                //$this->addRec();
			break;
		}
	}
	
	function parsePostVars(){
		$this->pact = $_POST["pact"];
		$this->gact = $_POST["gact"];
		$this->gfield = $_POST["gfield"];
		$this->gfield_value = $_POST["gfield_value"];
		
		                                                    $this->USER_ID  = htmlspecialchars(addslashes(trim($_POST["USER_ID"])));
                                                		                                                    $this->APP_NAME  = htmlspecialchars(addslashes(trim($_POST["APP_NAME"])));
                                                		                                                    $this->APP_TITLE  = htmlspecialchars(addslashes(trim($_POST["APP_TITLE"])));
                                                		                                                    $this->APP_SCHEMA  = htmlspecialchars(addslashes(trim($_POST["APP_SCHEMA"])));
                                                		                                                    $this->BASE_DIR  = htmlspecialchars(addslashes(trim($_POST["BASE_DIR"])));
                                                		                                                    $this->APP_DATE  = htmlspecialchars(addslashes(trim($_POST["APP_DATE"])));
                                                		                                                    $this->DESCRIPTION  = htmlspecialchars(addslashes(trim($_POST["DESCRIPTION"])));
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
				if($this->USER_ID == "") {
			$this->errors[] = "Campul USER_ID este obligatoriu!";
		}
				if($this->APP_NAME == "") {
			$this->errors[] = "Campul APP_NAME este obligatoriu!";
		}
			}
	
	function setup_display(){
					 
					 
					 
								//$this->APP_SCHEMA_sel = new DB_select("APP_SCHEMA",".phpapps.list_databases");
			$this->APP_SCHEMA_sel->selected_val = $this->APP_SCHEMA;
			$this->APP_SCHEMA_sel->setup_select_options();
			 
					 
					 
					 
				
									//$this->USER_ID_sel = new DB_select("USER_ID",".phpapps.users");
				$this->USER_ID_sel->db_query = new DB_query("SELECT ID AS VALUE, USERNAME AS LABEL FROM phpapps.users ORDER BY USERNAME");
				$this->USER_ID_sel->selected_val = $this->USER_ID;
				$this->USER_ID_sel->setup_select_options();
			 
					 
					 
					 
					 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
							"USER_ID" => $this->USER_ID,
							"APP_NAME" => $this->APP_NAME,
							"APP_TITLE" => $this->APP_TITLE,
							"APP_SCHEMA" => $this->APP_SCHEMA,
							"BASE_DIR" => $this->BASE_DIR,
							"APP_DATE" => $this->APP_DATE,
							"DESCRIPTION" => $this->DESCRIPTION,
									 
						 
						 
										"APP_SCHEMA_sel" => $this->APP_SCHEMA_sel->get_select_str(),
			 
						 
						 
						 
													"USER_ID_sel" => $this->USER_ID_sel->get_select_str(),
			 
						 
						 
						 
						 
						 
						 
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