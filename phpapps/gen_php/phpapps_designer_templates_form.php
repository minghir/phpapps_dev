<?php
// includes
namespace wabdo; require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class phpapps_designer_templates_form extends template{
        public $form_com_type = "html"; // html | ajax
	public $globals;
	public $form_schema = "phpapps";
	public $form_table = "templates";
        
	public $template;// = "gen_tpl/phpapps_designer_templates_form.tpl";
        
        public $tpl = "phpapps_designer_templates_form";
	
        //get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
        
        public $query;
        
        public $smarty;
        
	            
	public $ID;
        	            
	public $TEMPLATE_NAME;
        	            
	public $APP_ID;
        	            
	public $DESCRIPTION;
        	            
	public $ELEMENT_TYPE_ID;
        		
		 
		 
		 
		 
			public $ELEMENT_TYPE_ID_sel;
	 
			
		 
		 
			public $APP_ID_sel;
	 
		 
		 
	        
        

	public $errors = array();
        
        public $resp_msgs = array();
	
	function __construct(){
                parent::__construct();
		global $GLOBALS_OBJ;
		$this->globals = &$GLOBALS_OBJ;
                
                //$this->smarty = new Smarty;
                //$this->smarty->template_dir = CURRENT_APP_TPL_DIR . DIR_SEP . "gen_tpl" . DIR_SEP;
                //$this->smarty->compile_dir = SMARTY_COMPILE_DIR;
                $this->smarty = $this->globals->sm;
                
                			 
					 
					 
					 
								$this->ELEMENT_TYPE_ID_sel = new DB_select("ELEMENT_TYPE_ID","phpapps.list_template_types");
                        			 
				
					 
					 
									$this->APP_ID_sel = new DB_select("APP_ID","phpapps.applications");
                                			 
					 
					 
		                
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
												TEMPLATE_NAME,
												APP_ID,
												DESCRIPTION,
												ELEMENT_TYPE_ID
							
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($this->query);
			$this->globals->con->next();
			                                                                $this->ID = stripslashes($this->globals->con->get_field("ID"));
                                			                                                                $this->TEMPLATE_NAME = stripslashes($this->globals->con->get_field("TEMPLATE_NAME"));
                                			                                                                $this->APP_ID = stripslashes($this->globals->con->get_field("APP_ID"));
                                			                                                                $this->DESCRIPTION = stripslashes($this->globals->con->get_field("DESCRIPTION"));
                                			                                                                $this->ELEMENT_TYPE_ID = stripslashes($this->globals->con->get_field("ELEMENT_TYPE_ID"));
                                						
	}
	
	function afterGetRec(){
	}
	
	function beforeAddRec(){
	}
	
	function addRec(){
		$this->beforeAddRec();
	
		$this->check_errors();
		$this->query = new DB_query("INSERT INTO ".$this->form_schema.".".$this->form_table." (
																					TEMPLATE_NAME,
																						APP_ID,
																						DESCRIPTION,
																						ELEMENT_TYPE_ID
										 ) VALUES (
																					:TEMPLATE_NAME,
																						:APP_ID,
																						:DESCRIPTION,
																						:ELEMENT_TYPE_ID
													)",
			array(
																		                                            
                                            ":TEMPLATE_NAME" => $this->TEMPLATE_NAME,
                                        														                                            
                                            ":APP_ID" => $this->APP_ID,
                                        														                                            
                                            ":DESCRIPTION" => $this->DESCRIPTION,
                                        														                                            
                                            ":ELEMENT_TYPE_ID" => $this->ELEMENT_TYPE_ID,
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
												TEMPLATE_NAME = :TEMPLATE_NAME,
												APP_ID = :APP_ID,
												DESCRIPTION = :DESCRIPTION,
												ELEMENT_TYPE_ID = :ELEMENT_TYPE_ID
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
				                                                                                    ":ID" => $this->ID,
                                        				                                                                                    ":TEMPLATE_NAME" => $this->TEMPLATE_NAME,
                                        				                                                                                    ":APP_ID" => $this->APP_ID,
                                        				                                                                                    ":DESCRIPTION" => $this->DESCRIPTION,
                                        				                                                                                    ":ELEMENT_TYPE_ID" => $this->ELEMENT_TYPE_ID,
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
                                                		                                                    $this->TEMPLATE_NAME  = htmlspecialchars(addslashes(trim($_POST["TEMPLATE_NAME"])));
                                                		                                                    $this->APP_ID  = htmlspecialchars(addslashes(trim($_POST["APP_ID"])));
                                                		                                                    $this->DESCRIPTION  = htmlspecialchars(addslashes(trim($_POST["DESCRIPTION"])));
                                                		                                                    $this->ELEMENT_TYPE_ID  = htmlspecialchars(addslashes(trim($_POST["ELEMENT_TYPE_ID"])));
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
				if($this->TEMPLATE_NAME == "") {
			$this->errors[] = "Campul TEMPLATE_NAME este obligatoriu!";
		}
				if($this->APP_ID == "") {
			$this->errors[] = "Campul APP_ID este obligatoriu!";
		}
				if($this->ELEMENT_TYPE_ID == "") {
			$this->errors[] = "Campul ELEMENT_TYPE_ID este obligatoriu!";
		}
			}
	
	function setup_display(){
					 
					 
					 
					 
								//$this->ELEMENT_TYPE_ID_sel = new DB_select("ELEMENT_TYPE_ID",".phpapps.list_template_types");
			$this->ELEMENT_TYPE_ID_sel->selected_val = $this->ELEMENT_TYPE_ID;
			$this->ELEMENT_TYPE_ID_sel->setup_select_options();
			 
				
					 
					 
									//$this->APP_ID_sel = new DB_select("APP_ID",".phpapps.applications");
				$this->APP_ID_sel->db_query = new DB_query("SELECT ID AS VALUE, APP_NAME AS LABEL FROM phpapps.applications ORDER BY APP_NAME");
				$this->APP_ID_sel->selected_val = $this->APP_ID;
				$this->APP_ID_sel->setup_select_options();
			 
					 
					 
		                
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
                
                //$this->setup_display();
        }
        
        function assign_vars_tpl(){
		$this->smarty->assign(array(
							"ID" => $this->ID,
							"TEMPLATE_NAME" => $this->TEMPLATE_NAME,
							"APP_ID" => $this->APP_ID,
							"DESCRIPTION" => $this->DESCRIPTION,
							"ELEMENT_TYPE_ID" => $this->ELEMENT_TYPE_ID,
									 
						 
						 
						 
										"ELEMENT_TYPE_ID_sel" => $this->ELEMENT_TYPE_ID_sel->get_select_str(),
			 
									 
						 
										"APP_ID_sel" => $this->APP_ID_sel->get_select_str(),
			 
						 
						 
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
                    //$this->smarty->display($this->template);
                    $this->display_template();
                }
		$this->afterDisplay();
	}
	
	function afterDisplay(){	
	}
	
	function get_html_str(){	
                $this->setup_display();
                $this->beforeDisplay();
		$this->smarty->fetch($this->template);
                $this->afterDisplay();
	}
        
        function ajax_server_resp(){
            return implode($this->errors,"<br>") ."<br>" . implode($this->resp_msgs,"<br>");
        }    
            
        
}
?>
