<?php
// includes
require_once ("globals.php");

class phpapps_database_queries_form{
	public $globals;
	public $form_schema = "phpapps";
	public $form_table = "queries";
	public $template = "gen_tpl/phpapps_database_queries_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
	            
	public $ID;
        	            
	public $MODULE_ID;
        	            
	public $QUERY;
        	            
	public $DESCRIPTION;
        		
		 
		 
		 
		 
			
		 
		 
		 
		 
	        
        

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
												MODULE_ID,
												QUERY,
												DESCRIPTION
							
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($sql);
			$this->globals->con->next();
			                                                                $this->ID = stripslashes($this->globals->con->get_field("ID"));
                                			                                                                $this->MODULE_ID = stripslashes($this->globals->con->get_field("MODULE_ID"));
                                			                                                                $this->QUERY = stripslashes($this->globals->con->get_field("QUERY"));
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
																					MODULE_ID,
																						QUERY,
																						DESCRIPTION
										 ) VALUES (
																					:MODULE_ID,
																						:QUERY,
																						:DESCRIPTION
													)",
			array(
																		                                            
                                            ":MODULE_ID" => $this->MODULE_ID,
                                        														                                            
                                            ":QUERY" => $this->QUERY,
                                        														                                            
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
												MODULE_ID = :MODULE_ID,
												QUERY = :QUERY,
												DESCRIPTION = :DESCRIPTION
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
				                                                                                    ":ID" => $this->ID,
                                        				                                                                                    ":MODULE_ID" => $this->MODULE_ID,
                                        				                                                                                    ":QUERY" => $this->QUERY,
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
                        		                                                    $this->MODULE_ID  = addslashes(trim($_POST["MODULE_ID"]));
                        		                                                    $this->QUERY  = addslashes(trim($_POST["QUERY"]));
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
				if($this->MODULE_ID == "") {
			$this->errors[] = "Campul MODULE_ID este obligatoriu!";
		}
				if($this->QUERY == "") {
			$this->errors[] = "Campul QUERY este obligatoriu!";
		}
			}
	
	function setup_display(){
					 
					 
					 
					 
				
					 
					 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
							"ID" => $this->ID,
							"MODULE_ID" => $this->MODULE_ID,
							"QUERY" => $this->QUERY,
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