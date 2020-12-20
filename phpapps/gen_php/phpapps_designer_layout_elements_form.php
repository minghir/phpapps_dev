<?php
// includes
namespace wabdo; require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class phpapps_designer_layout_elements_form extends template{
        public $form_com_type = "html"; // html | ajax
	public $globals;
	public $form_schema = "phpapps";
	public $form_table = "layout_elements";
	public $template = "gen_tpl/phpapps_designer_layout_elements_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
        
        public $query;
        
	            
	public $ID;
        	            
	public $LAYOUT_ID;
        	            
	public $ELEMENT_ID;
        	            
	public $ELEMENT_TYPE;
        	            
	public $LAYOUT_VARIABLE_NAME;
        	            
	public $DESCRIPTION;
        		
		 
		 
		 
			public $ELEMENT_TYPE_sel;
	 
		 
		 
			
		 
			public $LAYOUT_ID_sel;
	 
			public $ELEMENT_ID_sel;
	 
		 
		 
		 
	        
        

	public $errors = array();
        
        public $resp_msgs = array();
	
	function __construct(){
                parent::__construct();
		global $GLOBALS_OBJ;
		$this->globals = &$GLOBALS_OBJ;
                
                			 
					 
					 
								$this->ELEMENT_TYPE_sel = new DB_select("ELEMENT_TYPE","{$this->globals->PHPAPPS_DB}.list_layout_elements_types");
                        			 
					 
					 
				
					 
									$this->LAYOUT_ID_sel = new DB_select("LAYOUT_ID","{$this->globals->PHPAPPS_DB}.layouts");
                                			 
									$this->ELEMENT_ID_sel = new DB_select("ELEMENT_ID","VIEW_POSIBLE_LAYOUT_ELEMENTS");
                                			 
					 
					 
					 
		                
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
												LAYOUT_ID,
												ELEMENT_ID,
												ELEMENT_TYPE,
												LAYOUT_VARIABLE_NAME,
												DESCRIPTION
							
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($this->query);
			$this->globals->con->next();
			                                                                $this->ID = stripslashes($this->globals->con->get_field("ID"));
                                			                                                                $this->LAYOUT_ID = stripslashes($this->globals->con->get_field("LAYOUT_ID"));
                                			                                                                $this->ELEMENT_ID = stripslashes($this->globals->con->get_field("ELEMENT_ID"));
                                			                                                                $this->ELEMENT_TYPE = stripslashes($this->globals->con->get_field("ELEMENT_TYPE"));
                                			                                                                $this->LAYOUT_VARIABLE_NAME = stripslashes($this->globals->con->get_field("LAYOUT_VARIABLE_NAME"));
                                			                                                                $this->DESCRIPTION = stripslashes($this->globals->con->get_field("DESCRIPTION"));
                                						
	}
	
	function afterGetRec(){
	}
	
	function beforeAddRec(){
	}
	
	function addRec(){
		$this->beforeAddRec();
	
		$this->check_errors();
		$this->query = new DB_query("INSERT INTO ".$this->form_schema.".".$this->form_table." (
																					LAYOUT_ID,
																						ELEMENT_ID,
																						ELEMENT_TYPE,
																						LAYOUT_VARIABLE_NAME,
																						DESCRIPTION
										 ) VALUES (
																					:LAYOUT_ID,
																						:ELEMENT_ID,
																						:ELEMENT_TYPE,
																						:LAYOUT_VARIABLE_NAME,
																						:DESCRIPTION
													)",
			array(
																		                                            
                                            ":LAYOUT_ID" => $this->LAYOUT_ID,
                                        														                                            
                                            ":ELEMENT_ID" => $this->ELEMENT_ID,
                                        														                                            
                                            ":ELEMENT_TYPE" => $this->ELEMENT_TYPE,
                                        														                                            
                                            ":LAYOUT_VARIABLE_NAME" => $this->LAYOUT_VARIABLE_NAME,
                                        														                                            
                                            ":DESCRIPTION" => $this->DESCRIPTION,
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
												LAYOUT_ID = :LAYOUT_ID,
												ELEMENT_ID = :ELEMENT_ID,
												ELEMENT_TYPE = :ELEMENT_TYPE,
												LAYOUT_VARIABLE_NAME = :LAYOUT_VARIABLE_NAME,
												DESCRIPTION = :DESCRIPTION
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
				                                                                                    ":ID" => $this->ID,
                                        				                                                                                    ":LAYOUT_ID" => $this->LAYOUT_ID,
                                        				                                                                                    ":ELEMENT_ID" => $this->ELEMENT_ID,
                                        				                                                                                    ":ELEMENT_TYPE" => $this->ELEMENT_TYPE,
                                        				                                                                                    ":LAYOUT_VARIABLE_NAME" => $this->LAYOUT_VARIABLE_NAME,
                                        				                                                                                    ":DESCRIPTION" => $this->DESCRIPTION,
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
                                                		                                                    $this->LAYOUT_ID  = htmlspecialchars(addslashes(trim($_POST["LAYOUT_ID"])));
                                                		                                                    $this->ELEMENT_ID  = htmlspecialchars(addslashes(trim($_POST["ELEMENT_ID"])));
                                                		                                                    $this->ELEMENT_TYPE  = htmlspecialchars(addslashes(trim($_POST["ELEMENT_TYPE"])));
                                                		                                                    $this->LAYOUT_VARIABLE_NAME  = htmlspecialchars(addslashes(trim($_POST["LAYOUT_VARIABLE_NAME"])));
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
			}
	
	function setup_display(){
					 
					 
					 
								//$this->ELEMENT_TYPE_sel = new DB_select("ELEMENT_TYPE",".{$this->globals->PHPAPPS_DB}.list_layout_elements_types");
			$this->ELEMENT_TYPE_sel->selected_val = $this->ELEMENT_TYPE;
			$this->ELEMENT_TYPE_sel->setup_select_options();
			 
					 
					 
				
					 
									//$this->LAYOUT_ID_sel = new DB_select("LAYOUT_ID",".{$this->globals->PHPAPPS_DB}.layouts");
				$this->LAYOUT_ID_sel->db_query = new DB_query("SELECT ID AS VALUE, NAME AS LABEL FROM {$this->globals->PHPAPPS_DB}.layouts ORDER BY NAME");
				$this->LAYOUT_ID_sel->selected_val = $this->LAYOUT_ID;
				$this->LAYOUT_ID_sel->setup_select_options();
			 
									//$this->ELEMENT_ID_sel = new DB_select("ELEMENT_ID",".VIEW_POSIBLE_LAYOUT_ELEMENTS");
				$this->ELEMENT_ID_sel->db_query = new DB_query("SELECT ID AS VALUE, ELEMENT_NAME AS LABEL FROM VIEW_POSIBLE_LAYOUT_ELEMENTS ORDER BY ELEMENT_NAME");
				$this->ELEMENT_ID_sel->selected_val = $this->ELEMENT_ID;
				$this->ELEMENT_ID_sel->setup_select_options();
			 
					 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
        }
        
        function assign_vars_tpl(){
		$this->globals->sm->assign(array(
							"ID" => $this->ID,
							"LAYOUT_ID" => $this->LAYOUT_ID,
							"ELEMENT_ID" => $this->ELEMENT_ID,
							"ELEMENT_TYPE" => $this->ELEMENT_TYPE,
							"LAYOUT_VARIABLE_NAME" => $this->LAYOUT_VARIABLE_NAME,
							"DESCRIPTION" => $this->DESCRIPTION,
									 
						 
						 
										"ELEMENT_TYPE_sel" => $this->ELEMENT_TYPE_sel->get_select_str(),
			 
						 
						 
									 
										"LAYOUT_ID_sel" => $this->LAYOUT_ID_sel->get_select_str(),
			 
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
