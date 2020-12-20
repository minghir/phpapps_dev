<?php
// includes
namespace wabdo; require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class phpapps_designer_layout_variables_form extends template{
        public $form_com_type = "html"; // html | ajax
	public $globals;
	public $form_schema = "phpapps";
	public $form_table = "layout_variables";
	public $template = "gen_tpl/phpapps_designer_layout_variables_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
        
        public $query;
        
	            
	public $ID;
        	            
	public $LAYOUT_ID;
        	            
	public $VARIABLE_NAME;
        	            
	public $VARIABLE_CONTENT;
        		
		 
		 
		 
		 
			
		 
			public $LAYOUT_ID_sel;
	 
		 
		 
	        
        

	public $errors = array();
        
        public $resp_msgs = array();
	
	function __construct(){
                parent::__construct();
		global $GLOBALS_OBJ;
		$this->globals = &$GLOBALS_OBJ;
                
                			 
					 
					 
					 
				
					 
									$this->LAYOUT_ID_sel = new DB_select("LAYOUT_ID","{$this->globals->PHPAPPS_DB}.layouts");
                                			 
					 
					 
		                
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
												VARIABLE_NAME,
												VARIABLE_CONTENT
							
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($this->query);
			$this->globals->con->next();
			                                                                $this->ID = stripslashes($this->globals->con->get_field("ID"));
                                			                                                                $this->LAYOUT_ID = stripslashes($this->globals->con->get_field("LAYOUT_ID"));
                                			                                                                $this->VARIABLE_NAME = stripslashes($this->globals->con->get_field("VARIABLE_NAME"));
                                			                                                                $this->VARIABLE_CONTENT = stripslashes($this->globals->con->get_field("VARIABLE_CONTENT"));
                                						
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
																						VARIABLE_NAME,
																						VARIABLE_CONTENT
										 ) VALUES (
																					:LAYOUT_ID,
																						:VARIABLE_NAME,
																						:VARIABLE_CONTENT
													)",
			array(
																		                                            
                                            ":LAYOUT_ID" => $this->LAYOUT_ID,
                                        														                                            
                                            ":VARIABLE_NAME" => $this->VARIABLE_NAME,
                                        														                                            
                                            ":VARIABLE_CONTENT" => $this->VARIABLE_CONTENT,
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
												VARIABLE_NAME = :VARIABLE_NAME,
												VARIABLE_CONTENT = :VARIABLE_CONTENT
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
				                                                                                    ":ID" => $this->ID,
                                        				                                                                                    ":LAYOUT_ID" => $this->LAYOUT_ID,
                                        				                                                                                    ":VARIABLE_NAME" => $this->VARIABLE_NAME,
                                        				                                                                                    ":VARIABLE_CONTENT" => $this->VARIABLE_CONTENT,
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
                                                		                                                    $this->VARIABLE_NAME  = htmlspecialchars(addslashes(trim($_POST["VARIABLE_NAME"])));
                                                		                                                    $this->VARIABLE_CONTENT  = htmlspecialchars(addslashes(trim($_POST["VARIABLE_CONTENT"])));
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
				if($this->LAYOUT_ID == "") {
			$this->errors[] = "Campul LAYOUT_ID este obligatoriu!";
		}
				if($this->VARIABLE_NAME == "") {
			$this->errors[] = "Campul VARIABLE_NAME este obligatoriu!";
		}
			}
	
	function setup_display(){
					 
					 
					 
					 
				
					 
									//$this->LAYOUT_ID_sel = new DB_select("LAYOUT_ID",".{$this->globals->PHPAPPS_DB}.layouts");
				$this->LAYOUT_ID_sel->db_query = new DB_query("SELECT ID AS VALUE, NAME AS LABEL FROM {$this->globals->PHPAPPS_DB}.layouts ORDER BY NAME");
				$this->LAYOUT_ID_sel->selected_val = $this->LAYOUT_ID;
				$this->LAYOUT_ID_sel->setup_select_options();
			 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
        }
        
        function assign_vars_tpl(){
		$this->globals->sm->assign(array(
							"ID" => $this->ID,
							"LAYOUT_ID" => $this->LAYOUT_ID,
							"VARIABLE_NAME" => $this->VARIABLE_NAME,
							"VARIABLE_CONTENT" => $this->VARIABLE_CONTENT,
									 
						 
						 
						 
									 
										"LAYOUT_ID_sel" => $this->LAYOUT_ID_sel->get_select_str(),
			 
						 
						 
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
