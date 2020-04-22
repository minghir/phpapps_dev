<?php
// includes
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class phpapps_designer_display_object_elements_form extends phpapps_display_abs{
        public $form_com_type = "html"; // html | ajax
	public $globals;
	public $form_schema = "phpapps";
	public $form_table = "display_object_elements";
	public $template = "gen_tpl/phpapps_designer_display_object_elements_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
        
        public $query;
        
	            
	public $ID;
        	            
	public $DISPLAY_OBJECT_ID;
        	            
	public $DISPLAY_OBJECT_TYPE_ID;
        	            
	public $ELEMENT_ID;
        	            
	public $ELEMENT_TYPE_ID;
        	            
	public $DESCRIPTION;
        	            
	public $TEMPLATE_VARIABLE_NAME;
        		
		 
		 
		 
		 
			public $ELEMENT_TYPE_ID_sel;
	 
		 
		 
			
		 
		 
		 
			public $ELEMENT_ID_sel;
	 
		 
		 
		 
	        
        

	public $errors = array();
        
        public $resp_msgs = array();
	
	function __construct(){
                parent::__construct();
		global $GLOBALS_OBJ;
		$this->globals = &$GLOBALS_OBJ;
                
                			 
					 
					 
					 
								$this->ELEMENT_TYPE_ID_sel = new DB_select("ELEMENT_TYPE_ID","phpapps.list_display_elements_types");
                        			 
					 
					 
				
					 
					 
					 
									$this->ELEMENT_ID_sel = new DB_select("ELEMENT_ID","view_posible_display_object_elements");
                                			 
					 
					 
					 
		                
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
												DISPLAY_OBJECT_ID,
												DISPLAY_OBJECT_TYPE_ID,
												ELEMENT_ID,
												ELEMENT_TYPE_ID,
												DESCRIPTION,
												TEMPLATE_VARIABLE_NAME
							
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($this->query);
			$this->globals->con->next();
			                                                                $this->ID = stripslashes($this->globals->con->get_field("ID"));
                                			                                                                $this->DISPLAY_OBJECT_ID = stripslashes($this->globals->con->get_field("DISPLAY_OBJECT_ID"));
                                			                                                                $this->DISPLAY_OBJECT_TYPE_ID = stripslashes($this->globals->con->get_field("DISPLAY_OBJECT_TYPE_ID"));
                                			                                                                $this->ELEMENT_ID = stripslashes($this->globals->con->get_field("ELEMENT_ID"));
                                			                                                                $this->ELEMENT_TYPE_ID = stripslashes($this->globals->con->get_field("ELEMENT_TYPE_ID"));
                                			                                                                $this->DESCRIPTION = stripslashes($this->globals->con->get_field("DESCRIPTION"));
                                			                                                                $this->TEMPLATE_VARIABLE_NAME = stripslashes($this->globals->con->get_field("TEMPLATE_VARIABLE_NAME"));
                                						
	}
	
	function afterGetRec(){
	}
	
	function beforeAddRec(){
	}
	
	function addRec(){
		$this->beforeAddRec();
	
		$this->check_errors();
		$this->query = new DB_query("INSERT INTO ".$this->form_schema.".".$this->form_table." (
																					DISPLAY_OBJECT_ID,
																						DISPLAY_OBJECT_TYPE_ID,
																						ELEMENT_ID,
																						ELEMENT_TYPE_ID,
																						DESCRIPTION,
																						TEMPLATE_VARIABLE_NAME
										 ) VALUES (
																					:DISPLAY_OBJECT_ID,
																						:DISPLAY_OBJECT_TYPE_ID,
																						:ELEMENT_ID,
																						:ELEMENT_TYPE_ID,
																						:DESCRIPTION,
																						:TEMPLATE_VARIABLE_NAME
													)",
			array(
																		                                            
                                            ":DISPLAY_OBJECT_ID" => $this->DISPLAY_OBJECT_ID,
                                        														                                            
                                            ":DISPLAY_OBJECT_TYPE_ID" => $this->DISPLAY_OBJECT_TYPE_ID,
                                        														                                            
                                            ":ELEMENT_ID" => $this->ELEMENT_ID,
                                        														                                            
                                            ":ELEMENT_TYPE_ID" => $this->ELEMENT_TYPE_ID,
                                        														                                            
                                            ":DESCRIPTION" => $this->DESCRIPTION,
                                        														                                            
                                            ":TEMPLATE_VARIABLE_NAME" => $this->TEMPLATE_VARIABLE_NAME,
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
												DISPLAY_OBJECT_ID = :DISPLAY_OBJECT_ID,
												DISPLAY_OBJECT_TYPE_ID = :DISPLAY_OBJECT_TYPE_ID,
												ELEMENT_ID = :ELEMENT_ID,
												ELEMENT_TYPE_ID = :ELEMENT_TYPE_ID,
												DESCRIPTION = :DESCRIPTION,
												TEMPLATE_VARIABLE_NAME = :TEMPLATE_VARIABLE_NAME
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
				                                                                                    ":ID" => $this->ID,
                                        				                                                                                    ":DISPLAY_OBJECT_ID" => $this->DISPLAY_OBJECT_ID,
                                        				                                                                                    ":DISPLAY_OBJECT_TYPE_ID" => $this->DISPLAY_OBJECT_TYPE_ID,
                                        				                                                                                    ":ELEMENT_ID" => $this->ELEMENT_ID,
                                        				                                                                                    ":ELEMENT_TYPE_ID" => $this->ELEMENT_TYPE_ID,
                                        				                                                                                    ":DESCRIPTION" => $this->DESCRIPTION,
                                        				                                                                                    ":TEMPLATE_VARIABLE_NAME" => $this->TEMPLATE_VARIABLE_NAME,
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
                                                		                                                    $this->DISPLAY_OBJECT_ID  = htmlspecialchars(addslashes(trim($_POST["DISPLAY_OBJECT_ID"])));
                                                		                                                    $this->DISPLAY_OBJECT_TYPE_ID  = htmlspecialchars(addslashes(trim($_POST["DISPLAY_OBJECT_TYPE_ID"])));
                                                		                                                    $this->ELEMENT_ID  = htmlspecialchars(addslashes(trim($_POST["ELEMENT_ID"])));
                                                		                                                    $this->ELEMENT_TYPE_ID  = htmlspecialchars(addslashes(trim($_POST["ELEMENT_TYPE_ID"])));
                                                		                                                    $this->DESCRIPTION  = htmlspecialchars(addslashes(trim($_POST["DESCRIPTION"])));
                                                		                                                    $this->TEMPLATE_VARIABLE_NAME  = htmlspecialchars(addslashes(trim($_POST["TEMPLATE_VARIABLE_NAME"])));
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
				if($this->DISPLAY_OBJECT_ID == "") {
			$this->errors[] = "Campul DISPLAY_OBJECT_ID este obligatoriu!";
		}
				if($this->DISPLAY_OBJECT_TYPE_ID == "") {
			$this->errors[] = "Campul DISPLAY_OBJECT_TYPE_ID este obligatoriu!";
		}
				if($this->ELEMENT_ID == "") {
			$this->errors[] = "Campul ELEMENT_ID este obligatoriu!";
		}
				if($this->ELEMENT_TYPE_ID == "") {
			$this->errors[] = "Campul ELEMENT_TYPE_ID este obligatoriu!";
		}
			}
	
	function setup_display(){
					 
					 
					 
					 
								//$this->ELEMENT_TYPE_ID_sel = new DB_select("ELEMENT_TYPE_ID",".phpapps.list_display_elements_types");
			$this->ELEMENT_TYPE_ID_sel->selected_val = $this->ELEMENT_TYPE_ID;
			$this->ELEMENT_TYPE_ID_sel->setup_select_options();
			 
					 
					 
				
					 
					 
					 
									//$this->ELEMENT_ID_sel = new DB_select("ELEMENT_ID",".view_posible_display_object_elements");
				$this->ELEMENT_ID_sel->db_query = new DB_query("SELECT ID AS VALUE, ELEMENT_NAME AS LABEL FROM view_posible_display_object_elements ORDER BY ELEMENT_NAME");
				$this->ELEMENT_ID_sel->selected_val = $this->ELEMENT_ID;
				$this->ELEMENT_ID_sel->setup_select_options();
			 
					 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
        }
        
        function assign_vars_tpl(){
		$this->globals->sm->assign(array(
							"ID" => $this->ID,
							"DISPLAY_OBJECT_ID" => $this->DISPLAY_OBJECT_ID,
							"DISPLAY_OBJECT_TYPE_ID" => $this->DISPLAY_OBJECT_TYPE_ID,
							"ELEMENT_ID" => $this->ELEMENT_ID,
							"ELEMENT_TYPE_ID" => $this->ELEMENT_TYPE_ID,
							"DESCRIPTION" => $this->DESCRIPTION,
							"TEMPLATE_VARIABLE_NAME" => $this->TEMPLATE_VARIABLE_NAME,
									 
						 
						 
						 
										"ELEMENT_TYPE_ID_sel" => $this->ELEMENT_TYPE_ID_sel->get_select_str(),
			 
						 
						 
									 
						 
						 
										"ELEMENT_ID_sel" => $this->ELEMENT_ID_sel->get_select_str(),
			 
						 
						 
						 
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
