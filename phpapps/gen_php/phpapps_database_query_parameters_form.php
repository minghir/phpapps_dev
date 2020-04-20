<?php
// includes
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class phpapps_database_query_parameters_form extends phpapps_display_abs{
        public $form_com_type = "html"; // html | ajax
	public $globals;
	public $form_schema = "phpapps";
	public $form_table = "query_parameters";
	public $template = "gen_tpl/phpapps_database_query_parameters_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
        
        public $query;
        
	            
	public $ID;
        	            
	public $QUERY_ID;
        	            
	public $PARAMETER_NAME;
        	            
	public $PARAMETER_VALUE;
        	            
	public $PARAMETER_TYPE;
        		
		 
		 
		 
		 
			public $PARAMETER_TYPE_sel;
	 
			
		 
		 
		 
		 
		 
	        
        

	public $errors = array();
        
        public $resp_msgs = array();
	
	function __construct(){
                parent::__construct();
		global $GLOBALS_OBJ;
		$this->globals = &$GLOBALS_OBJ;
                
                			 
					 
					 
					 
								$this->PARAMETER_TYPE_sel = new DB_select("PARAMETER_TYPE","phpapps.list_query_parameter_type");
                        			 
				
					 
					 
					 
					 
					 
		                
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
												QUERY_ID,
												PARAMETER_NAME,
												PARAMETER_VALUE,
												PARAMETER_TYPE
							
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($this->query);
			$this->globals->con->next();
			                                                                $this->ID = stripslashes($this->globals->con->get_field("ID"));
                                			                                                                $this->QUERY_ID = stripslashes($this->globals->con->get_field("QUERY_ID"));
                                			                                                                $this->PARAMETER_NAME = stripslashes($this->globals->con->get_field("PARAMETER_NAME"));
                                			                                                                $this->PARAMETER_VALUE = stripslashes($this->globals->con->get_field("PARAMETER_VALUE"));
                                			                                                                $this->PARAMETER_TYPE = stripslashes($this->globals->con->get_field("PARAMETER_TYPE"));
                                						
	}
	
	function afterGetRec(){
	}
	
	function beforeAddRec(){
	}
	
	function addRec(){
		$this->beforeAddRec();
	
		$this->check_errors();
		$this->query = new DB_query("INSERT INTO ".$this->form_schema.".".$this->form_table." (
																					QUERY_ID,
																						PARAMETER_NAME,
																						PARAMETER_VALUE,
																						PARAMETER_TYPE
										 ) VALUES (
																					:QUERY_ID,
																						:PARAMETER_NAME,
																						:PARAMETER_VALUE,
																						:PARAMETER_TYPE
													)",
			array(
																		                                            
                                            ":QUERY_ID" => $this->QUERY_ID,
                                        														                                            
                                            ":PARAMETER_NAME" => $this->PARAMETER_NAME,
                                        														                                            
                                            ":PARAMETER_VALUE" => $this->PARAMETER_VALUE,
                                        														                                            
                                            ":PARAMETER_TYPE" => $this->PARAMETER_TYPE,
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
												QUERY_ID = :QUERY_ID,
												PARAMETER_NAME = :PARAMETER_NAME,
												PARAMETER_VALUE = :PARAMETER_VALUE,
												PARAMETER_TYPE = :PARAMETER_TYPE
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
				                                                                                    ":ID" => $this->ID,
                                        				                                                                                    ":QUERY_ID" => $this->QUERY_ID,
                                        				                                                                                    ":PARAMETER_NAME" => $this->PARAMETER_NAME,
                                        				                                                                                    ":PARAMETER_VALUE" => $this->PARAMETER_VALUE,
                                        				                                                                                    ":PARAMETER_TYPE" => $this->PARAMETER_TYPE,
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
                                                		                                                    $this->QUERY_ID  = htmlspecialchars(addslashes(trim($_POST["QUERY_ID"])));
                                                		                                                    $this->PARAMETER_NAME  = htmlspecialchars(addslashes(trim($_POST["PARAMETER_NAME"])));
                                                		                                                    $this->PARAMETER_VALUE  = htmlspecialchars(addslashes(trim($_POST["PARAMETER_VALUE"])));
                                                		                                                    $this->PARAMETER_TYPE  = htmlspecialchars(addslashes(trim($_POST["PARAMETER_TYPE"])));
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
				if($this->PARAMETER_NAME == "") {
			$this->errors[] = "Campul PARAMETER_NAME este obligatoriu!";
		}
				if($this->PARAMETER_VALUE == "") {
			$this->errors[] = "Campul PARAMETER_VALUE este obligatoriu!";
		}
				if($this->PARAMETER_TYPE == "") {
			$this->errors[] = "Campul PARAMETER_TYPE este obligatoriu!";
		}
			}
	
	function setup_display(){
					 
					 
					 
					 
								//$this->PARAMETER_TYPE_sel = new DB_select("PARAMETER_TYPE",".phpapps.list_query_parameter_type");
			$this->PARAMETER_TYPE_sel->selected_val = $this->PARAMETER_TYPE;
			$this->PARAMETER_TYPE_sel->setup_select_options();
			 
				
					 
					 
					 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
        }
        
        function assign_vars_tpl(){
		$this->globals->sm->assign(array(
							"ID" => $this->ID,
							"QUERY_ID" => $this->QUERY_ID,
							"PARAMETER_NAME" => $this->PARAMETER_NAME,
							"PARAMETER_VALUE" => $this->PARAMETER_VALUE,
							"PARAMETER_TYPE" => $this->PARAMETER_TYPE,
									 
						 
						 
						 
										"PARAMETER_TYPE_sel" => $this->PARAMETER_TYPE_sel->get_select_str(),
			 
									 
						 
						 
						 
						 
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
