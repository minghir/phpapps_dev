<?php
// includes
namespace wabdo; require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class phpapps_users_users_form extends template{
        public $form_com_type = "html"; // html | ajax
	public $globals;
	public $form_schema = "phpapps";
	public $form_table = "users";
	public $template = "gen_tpl/phpapps_users_users_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
        
        public $query;
        
	            
	public $ID;
        	            
	public $USERNAME;
        	            
	public $PASSWORD;
        	            
	public $FIRSTNAME;
        	            
	public $LASTNAME;
        	            
	public $EMAIL;
        	            
	public $USER_TYPE;
        	            
	public $DESCRIPTION;
        	            
	public $PROFILE_ID;
        		
		 
		 
		 
		 
		 
		 
			public $USER_TYPE_sel;
	 
		 
		 
			
		 
		 
		 
		 
		 
		 
		 
		 
		 
	        
        

	public $errors = array();
        
        public $resp_msgs = array();
	
	function __construct(){
                parent::__construct();
		global $GLOBALS_OBJ;
		$this->globals = &$GLOBALS_OBJ;
                
                			 
					 
					 
					 
					 
					 
								$this->USER_TYPE_sel = new DB_select("USER_TYPE","phpapps.list_user_types");
                        			 
					 
					 
				
					 
					 
					 
					 
					 
					 
					 
					 
					 
		                
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
		$this->query = new DB_query( "SELECT 
									ID,
												USERNAME,
												PASSWORD,
												FIRSTNAME,
												LASTNAME,
												EMAIL,
												USER_TYPE,
												DESCRIPTION,
												PROFILE_ID
							
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($this->query);
			$this->globals->con->next();
			                                                                $this->ID = stripslashes($this->globals->con->get_field("ID"));
                                			                                                                $this->USERNAME = stripslashes($this->globals->con->get_field("USERNAME"));
                                			                                                                $this->PASSWORD = stripslashes($this->globals->con->get_field("PASSWORD"));
                                			                                                                $this->FIRSTNAME = stripslashes($this->globals->con->get_field("FIRSTNAME"));
                                			                                                                $this->LASTNAME = stripslashes($this->globals->con->get_field("LASTNAME"));
                                			                                                                $this->EMAIL = stripslashes($this->globals->con->get_field("EMAIL"));
                                			                                                                $this->USER_TYPE = stripslashes($this->globals->con->get_field("USER_TYPE"));
                                			                                                                $this->DESCRIPTION = stripslashes($this->globals->con->get_field("DESCRIPTION"));
                                			                                                                $this->PROFILE_ID = stripslashes($this->globals->con->get_field("PROFILE_ID"));
                                						
	}
	
	function afterGetRec(){
	}
	
	function beforeAddRec(){
	}
	
	function addRec(){
		$this->beforeAddRec();
	
		$this->check_errors();
		$this->query = new DB_query("INSERT INTO ".$this->form_schema.".".$this->form_table." (
																					USERNAME,
																						PASSWORD,
																						FIRSTNAME,
																						LASTNAME,
																						EMAIL,
																						USER_TYPE,
																						DESCRIPTION,
																						PROFILE_ID
										 ) VALUES (
																					:USERNAME,
																						:PASSWORD,
																						:FIRSTNAME,
																						:LASTNAME,
																						:EMAIL,
																						:USER_TYPE,
																						:DESCRIPTION,
																						:PROFILE_ID
													)",
			array(
																		                                            
                                            ":USERNAME" => $this->USERNAME,
                                        														                                            
                                            ":PASSWORD" => $this->PASSWORD,
                                        														                                            
                                            ":FIRSTNAME" => $this->FIRSTNAME,
                                        														                                            
                                            ":LASTNAME" => $this->LASTNAME,
                                        														                                            
                                            ":EMAIL" => $this->EMAIL,
                                        														                                            
                                            ":USER_TYPE" => $this->USER_TYPE,
                                        														                                            
                                            ":DESCRIPTION" => $this->DESCRIPTION,
                                        														                                            
                                            ":PROFILE_ID" => $this->PROFILE_ID,
                                        												)
			);

		if(count($this->errors) == 0) {	
			if( $this->globals->con->query($this->query) == -1){
                            $this->errors[] = $this->globals->con->get_error();
                        }else{
                            $this->resp_msgs[] = "Inregistrare adaugata cu succes";
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
		
		$this->query = new DB_query("UPDATE ".$this->form_schema.".".$this->form_table." SET 
									ID = :ID,
												USERNAME = :USERNAME,
												PASSWORD = :PASSWORD,
												FIRSTNAME = :FIRSTNAME,
												LASTNAME = :LASTNAME,
												EMAIL = :EMAIL,
												USER_TYPE = :USER_TYPE,
												DESCRIPTION = :DESCRIPTION,
												PROFILE_ID = :PROFILE_ID
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
				                                                                                    ":ID" => $this->ID,
                                        				                                                                                    ":USERNAME" => $this->USERNAME,
                                        				                                                                                    ":PASSWORD" => $this->PASSWORD,
                                        				                                                                                    ":FIRSTNAME" => $this->FIRSTNAME,
                                        				                                                                                    ":LASTNAME" => $this->LASTNAME,
                                        				                                                                                    ":EMAIL" => $this->EMAIL,
                                        				                                                                                    ":USER_TYPE" => $this->USER_TYPE,
                                        				                                                                                    ":DESCRIPTION" => $this->DESCRIPTION,
                                        				                                                                                    ":PROFILE_ID" => $this->PROFILE_ID,
                                        								":".$this->gfield => $this->gfield_value
			)	
			);
				
		if(count($this->errors) == 0) {	
			if( $this->globals->con->query($this->query) == -1){
                            $this->errors[] = $this->globals->con->get_error();
                        }else{
                            $this->resp_msgs[] = "Inregistrare salvata cu succes";
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
		
		$this->query = new DB_query("DELETE FROM ".$this->form_schema.".".$this->form_table."
				WHERE ".$this->gfield." = :".$this->gfield, array(":".$this->gfield=>$this->gfield_value) );
				
		if(count($this->errors) == 0) {
			if( $this->globals->con->query($this->query) == -1){
                            $this->errors[] = $this->globals->con->get_error();
                        }else{
                            $this->resp_msgs[] = "Inregistrare stearsa cu succes";
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
                                                		                                                    $this->FIRSTNAME  = htmlspecialchars(addslashes(trim($_POST["FIRSTNAME"])));
                                                		                                                    $this->LASTNAME  = htmlspecialchars(addslashes(trim($_POST["LASTNAME"])));
                                                		                                                    $this->EMAIL  = htmlspecialchars(addslashes(trim($_POST["EMAIL"])));
                                                		                                                    $this->USER_TYPE  = htmlspecialchars(addslashes(trim($_POST["USER_TYPE"])));
                                                		                                                    $this->DESCRIPTION  = htmlspecialchars(addslashes(trim($_POST["DESCRIPTION"])));
                                                		                                                    $this->PROFILE_ID  = htmlspecialchars(addslashes(trim($_POST["PROFILE_ID"])));
                                                		        }
	
        function beforePostActions(){
        }
        
        function takePostActions(){
                $this->beforePostActions();
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
                $this->afterPostActions();
	}
        
        function afterPostActions(){
        }
	
	function check_errors(){
				if($this->USERNAME == "") {
			$this->errors[] = "Campul USERNAME este obligatoriu!";
		}
				if($this->PASSWORD == "") {
			$this->errors[] = "Campul PASSWORD este obligatoriu!";
		}
			}
	
	function setup_display(){
					 
					 
					 
					 
					 
					 
								//$this->USER_TYPE_sel = new DB_select("USER_TYPE",".phpapps.list_user_types");
			$this->USER_TYPE_sel->selected_val = $this->USER_TYPE;
			$this->USER_TYPE_sel->setup_select_options();
			 
					 
					 
				
					 
					 
					 
					 
					 
					 
					 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
        }
        
        function assign_vars_tpl(){
		$this->globals->sm->assign(array(
							"ID" => $this->ID,
							"USERNAME" => $this->USERNAME,
							"PASSWORD" => $this->PASSWORD,
							"FIRSTNAME" => $this->FIRSTNAME,
							"LASTNAME" => $this->LASTNAME,
							"EMAIL" => $this->EMAIL,
							"USER_TYPE" => $this->USER_TYPE,
							"DESCRIPTION" => $this->DESCRIPTION,
							"PROFILE_ID" => $this->PROFILE_ID,
									 
						 
						 
						 
						 
						 
										"USER_TYPE_sel" => $this->USER_TYPE_sel->get_select_str(),
			 
						 
						 
									 
						 
						 
						 
						 
						 
						 
						 
						 
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
		$this->assign_vars_tpl();
                if($this->form_com_type == "ajax" && $this->pact != ""){
                    $this->ajax_server_resp();
                }else{
                    $this->globals->sm->display($this->template);
                }
		$this->afterDisplay();
	}
	
	function afterDisplay(){	
	}
	
	function get_html_str(){	
                $this->setup_display();
                $this->beforeDisplay();
		$this->globals->sm->fetch($this->template);
                $this->afterDisplay();
	}
        
        function ajax_server_resp(){
            return implode($this->errors,"<br>") ."<br>" . implode($this->resp_msgs,"<br>");
        }    
            
        
}
?>
