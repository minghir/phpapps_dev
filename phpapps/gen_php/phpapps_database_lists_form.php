<?php
// includes
namespace wabdo; require_once ("globals.php");

class phpapps_database_lists_form{
        public $form_com_type = "html"; // html | ajax
	public $globals;
	public $form_schema = "phpapps";
	public $form_table = "tables";
	public $template = "gen_tpl/phpapps_database_lists_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
	            
	public $ID;
        	            
	public $ORIGIN_ID;
        	            
	public $MODULE_ID;
        	            
	public $SCHEMA_ID;
        	            
	public $TABLE_NAME;
        	            
	public $TABLE_TYPE;
        	            
	public $DESCRIPTION;
        		
		 
		 
		 
		 
		 
		 
		 
			
		 
		 
		 
		 
		 
		 
		 
	        
        

	public $errors = array();
        
        public $resp_msgs = array();
	
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
												ORIGIN_ID,
												MODULE_ID,
												SCHEMA_ID,
												TABLE_NAME,
												TABLE_TYPE,
												DESCRIPTION
							
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($sql);
			$this->globals->con->next();
			                                                                $this->ID = stripslashes($this->globals->con->get_field("ID"));
                                			                                                                $this->ORIGIN_ID = stripslashes($this->globals->con->get_field("ORIGIN_ID"));
                                			                                                                $this->MODULE_ID = stripslashes($this->globals->con->get_field("MODULE_ID"));
                                			                                                                $this->SCHEMA_ID = stripslashes($this->globals->con->get_field("SCHEMA_ID"));
                                			                                                                $this->TABLE_NAME = stripslashes($this->globals->con->get_field("TABLE_NAME"));
                                			                                                                $this->TABLE_TYPE = stripslashes($this->globals->con->get_field("TABLE_TYPE"));
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
																					ORIGIN_ID,
																						MODULE_ID,
																						SCHEMA_ID,
																						TABLE_NAME,
																						TABLE_TYPE,
																						DESCRIPTION
										 ) VALUES (
																					:ORIGIN_ID,
																						:MODULE_ID,
																						:SCHEMA_ID,
																						:TABLE_NAME,
																						:TABLE_TYPE,
																						:DESCRIPTION
													)",
			array(
																		                                            
                                            ":ORIGIN_ID" => $this->ORIGIN_ID,
                                        														                                            
                                            ":MODULE_ID" => $this->MODULE_ID,
                                        														                                            
                                            ":SCHEMA_ID" => $this->SCHEMA_ID,
                                        														                                            
                                            ":TABLE_NAME" => $this->TABLE_NAME,
                                        														                                            
                                            ":TABLE_TYPE" => $this->TABLE_TYPE,
                                        														                                            
                                            ":DESCRIPTION" => $this->DESCRIPTION,
                                        												)
			);

		if(count($this->errors) == 0) {	
			if( $this->globals->con->query($sql) == -1){
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
		
		$sql = new DB_query("UPDATE ".$this->form_schema.".".$this->form_table." SET 
									ID = :ID,
												ORIGIN_ID = :ORIGIN_ID,
												MODULE_ID = :MODULE_ID,
												SCHEMA_ID = :SCHEMA_ID,
												TABLE_NAME = :TABLE_NAME,
												TABLE_TYPE = :TABLE_TYPE,
												DESCRIPTION = :DESCRIPTION
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
				                                                                                    ":ID" => $this->ID,
                                        				                                                                                    ":ORIGIN_ID" => $this->ORIGIN_ID,
                                        				                                                                                    ":MODULE_ID" => $this->MODULE_ID,
                                        				                                                                                    ":SCHEMA_ID" => $this->SCHEMA_ID,
                                        				                                                                                    ":TABLE_NAME" => $this->TABLE_NAME,
                                        				                                                                                    ":TABLE_TYPE" => $this->TABLE_TYPE,
                                        				                                                                                    ":DESCRIPTION" => $this->DESCRIPTION,
                                        								":".$this->gfield => $this->gfield_value
			)	
			);
				
		if(count($this->errors) == 0) {	
			if( $this->globals->con->query($sql) == -1){
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
		
		$sql = new DB_query("DELETE FROM ".$this->form_schema.".".$this->form_table."
				WHERE ".$this->gfield." = :".$this->gfield, array(":".$this->gfield=>$this->gfield_value) );
				
		if(count($this->errors) == 0) {
			if( $this->globals->con->query($sql) == -1){
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
                                                		                                                    $this->ORIGIN_ID  = htmlspecialchars(addslashes(trim($_POST["ORIGIN_ID"])));
                                                		                                                    $this->MODULE_ID  = htmlspecialchars(addslashes(trim($_POST["MODULE_ID"])));
                                                		                                                    $this->SCHEMA_ID  = htmlspecialchars(addslashes(trim($_POST["SCHEMA_ID"])));
                                                		                                                    $this->TABLE_NAME  = htmlspecialchars(addslashes(trim($_POST["TABLE_NAME"])));
                                                		                                                    $this->TABLE_TYPE  = htmlspecialchars(addslashes(trim($_POST["TABLE_TYPE"])));
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
				if($this->TABLE_NAME == "") {
			$this->errors[] = "Campul TABLE_NAME este obligatoriu!";
		}
			}
	
	function setup_display(){
					 
					 
					 
					 
					 
					 
					 
				
					 
					 
					 
					 
					 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
        }
        
        function assign_vars_tpl(){
		$this->globals->sm->assign(array(
							"ID" => $this->ID,
							"ORIGIN_ID" => $this->ORIGIN_ID,
							"MODULE_ID" => $this->MODULE_ID,
							"SCHEMA_ID" => $this->SCHEMA_ID,
							"TABLE_NAME" => $this->TABLE_NAME,
							"TABLE_TYPE" => $this->TABLE_TYPE,
							"DESCRIPTION" => $this->DESCRIPTION,
									 
						 
						 
						 
						 
						 
						 
									 
						 
						 
						 
						 
						 
						 
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