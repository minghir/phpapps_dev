<?php
// includes
require_once ("globals.php");

class articles_app_users_form{
	public $globals;
	public $form_schema = "atsepa";
	public $form_table = "app_users";
	public $template = "gen_tpl/articles_app_users_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
	            
	public $ID;
        	            
	public $USERNAME;
        	            
	public $PASSWORD;
        	            
	public $EMAIL;
        	            
	public $USER_TYPE;
        	            
	public $JOIN_DATE;
        		
		 
		 
		 
		 
		 
		 
			
		 
		 
		 
		 
		 
		 
	        
        

	public $errors = array();
	
	function __construct(){
		global $GLOBALS_OBJ;
		$this->globals = &$GLOBALS_OBJ;
                
                			 
					 
					 
					 
					 
					 
				
					 
					 
					 
					 
					 
					 
		                
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
												USERNAME,
												PASSWORD,
												EMAIL,
												USER_TYPE,
												JOIN_DATE
							
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($sql);
			$this->globals->con->next();
			                                                                $this->ID = stripslashes($this->globals->con->get_field("ID"));
                                			                                                                $this->USERNAME = stripslashes($this->globals->con->get_field("USERNAME"));
                                			                                                                $this->PASSWORD = stripslashes($this->globals->con->get_field("PASSWORD"));
                                			                                                                $this->EMAIL = stripslashes($this->globals->con->get_field("EMAIL"));
                                			                                                                $this->USER_TYPE = stripslashes($this->globals->con->get_field("USER_TYPE"));
                                			                                                                $this->JOIN_DATE = stripslashes($this->globals->con->get_field("JOIN_DATE"));
                                						
	}
	
	function afterGetRec(){
	}
	
	function beforeAddRec(){
	}
	
	function addRec(){
		$this->beforeAddRec();
	
		$this->check_errors();
		$sql = new DB_query("INSERT INTO ".$this->form_schema.".".$this->form_table." (
																					USERNAME,
																						PASSWORD,
																						EMAIL,
																						USER_TYPE,
																						JOIN_DATE
										 ) VALUES (
																					:USERNAME,
																						:PASSWORD,
																						:EMAIL,
																						:USER_TYPE,
																						:JOIN_DATE
													)",
			array(
																		                                            
                                            ":USERNAME" => $this->USERNAME,
                                        														                                            
                                            ":PASSWORD" => $this->PASSWORD,
                                        														                                            
                                            ":EMAIL" => $this->EMAIL,
                                        														                                            
                                            ":USER_TYPE" => $this->USER_TYPE,
                                        														                                            
                                            ":JOIN_DATE" => $this->JOIN_DATE,
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
												USERNAME = :USERNAME,
												PASSWORD = :PASSWORD,
												EMAIL = :EMAIL,
												USER_TYPE = :USER_TYPE,
												JOIN_DATE = :JOIN_DATE
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
				                                                                                    ":ID" => $this->ID,
                                        				                                                                                    ":USERNAME" => $this->USERNAME,
                                        				                                                                                    ":PASSWORD" => $this->PASSWORD,
                                        				                                                                                    ":EMAIL" => $this->EMAIL,
                                        				                                                                                    ":USER_TYPE" => $this->USER_TYPE,
                                        				                                                                                    ":JOIN_DATE" => $this->JOIN_DATE,
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
		
		                                                    $this->ID  = htmlspecialchars(addslashes(trim($_POST["ID"])));
                                                		                                                    $this->USERNAME  = htmlspecialchars(addslashes(trim($_POST["USERNAME"])));
                                                		                                                    $this->PASSWORD  = htmlspecialchars(addslashes(trim($_POST["PASSWORD"])));
                                                		                                                    $this->EMAIL  = htmlspecialchars(addslashes(trim($_POST["EMAIL"])));
                                                		                                                    $this->USER_TYPE  = htmlspecialchars(addslashes(trim($_POST["USER_TYPE"])));
                                                		                                                    $this->JOIN_DATE  = htmlspecialchars(addslashes(trim($_POST["JOIN_DATE"])));
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
			}
	
	function setup_display(){
					 
					 
					 
					 
					 
					 
				
					 
					 
					 
					 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
							"ID" => $this->ID,
							"USERNAME" => $this->USERNAME,
							"PASSWORD" => $this->PASSWORD,
							"EMAIL" => $this->EMAIL,
							"USER_TYPE" => $this->USER_TYPE,
							"JOIN_DATE" => $this->JOIN_DATE,
									 
						 
						 
						 
						 
						 
									 
						 
						 
						 
						 
						 
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