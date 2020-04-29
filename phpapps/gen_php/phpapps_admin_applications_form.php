<?php
// includes
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class phpapps_admin_applications_form extends phpapps_display_abs{
        public $form_com_type = "html"; // html | ajax
	public $globals;
	public $form_schema = "phpapps";
	public $form_table = "applications";
        
	public $template;// = "gen_tpl/phpapps_admin_applications_form.tpl";
        
        public $tpl = "phpapps_admin_applications_form";
	
        //get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
        
        public $query;
        
        public $smarty;
        
	            
	public $ID;
        	            
	public $USER_ID;
        	            
	public $APP_NAME;
        	            
	public $APP_TITLE;
        	            
	public $APP_SCHEMA;
        	            
	public $APPLICATION_TYPE_ID;
        	            
	public $DESCRIPTION;
        		
		 
		 
		 
		 
			public $APP_SCHEMA_sel;
	 
			public $APPLICATION_TYPE_ID_sel;
	 
		 
			
		 
		 
		 
		 
		 
		 
		 
	        
        

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
                
                			 
					 
					 
					 
								$this->APP_SCHEMA_sel = new DB_select("APP_SCHEMA","phpapps.list_databases");
                        			 
								$this->APPLICATION_TYPE_ID_sel = new DB_select("APPLICATION_TYPE_ID","phpapps.list_application_types");
                        			 
					 
				
					 
					 
					 
					 
					 
					 
					 
		                
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
												USER_ID,
												APP_NAME,
												APP_TITLE,
												APP_SCHEMA,
												APPLICATION_TYPE_ID,
												DESCRIPTION
							
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($this->query);
			$this->globals->con->next();
			                                                                $this->ID = stripslashes($this->globals->con->get_field("ID"));
                                			                                                                $this->USER_ID = stripslashes($this->globals->con->get_field("USER_ID"));
                                			                                                                $this->APP_NAME = stripslashes($this->globals->con->get_field("APP_NAME"));
                                			                                                                $this->APP_TITLE = stripslashes($this->globals->con->get_field("APP_TITLE"));
                                			                                                                $this->APP_SCHEMA = stripslashes($this->globals->con->get_field("APP_SCHEMA"));
                                			                                                                $this->APPLICATION_TYPE_ID = stripslashes($this->globals->con->get_field("APPLICATION_TYPE_ID"));
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
																					USER_ID,
																						APP_NAME,
																						APP_TITLE,
																						APP_SCHEMA,
																						APPLICATION_TYPE_ID,
																						DESCRIPTION
										 ) VALUES (
																					:USER_ID,
																						:APP_NAME,
																						:APP_TITLE,
																						:APP_SCHEMA,
																						:APPLICATION_TYPE_ID,
																						:DESCRIPTION
													)",
			array(
																		                                            
                                            ":USER_ID" => $this->USER_ID,
                                        														                                            
                                            ":APP_NAME" => $this->APP_NAME,
                                        														                                            
                                            ":APP_TITLE" => $this->APP_TITLE,
                                        														                                            
                                            ":APP_SCHEMA" => $this->APP_SCHEMA,
                                        														                                            
                                            ":APPLICATION_TYPE_ID" => $this->APPLICATION_TYPE_ID,
                                        														                                            
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
												USER_ID = :USER_ID,
												APP_NAME = :APP_NAME,
												APP_TITLE = :APP_TITLE,
												APP_SCHEMA = :APP_SCHEMA,
												APPLICATION_TYPE_ID = :APPLICATION_TYPE_ID,
												DESCRIPTION = :DESCRIPTION
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
				                                                                                    ":ID" => $this->ID,
                                        				                                                                                    ":USER_ID" => $this->USER_ID,
                                        				                                                                                    ":APP_NAME" => $this->APP_NAME,
                                        				                                                                                    ":APP_TITLE" => $this->APP_TITLE,
                                        				                                                                                    ":APP_SCHEMA" => $this->APP_SCHEMA,
                                        				                                                                                    ":APPLICATION_TYPE_ID" => $this->APPLICATION_TYPE_ID,
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
                                                		                                                    $this->USER_ID  = htmlspecialchars(addslashes(trim($_POST["USER_ID"])));
                                                		                                                    $this->APP_NAME  = htmlspecialchars(addslashes(trim($_POST["APP_NAME"])));
                                                		                                                    $this->APP_TITLE  = htmlspecialchars(addslashes(trim($_POST["APP_TITLE"])));
                                                		                                                    $this->APP_SCHEMA  = htmlspecialchars(addslashes(trim($_POST["APP_SCHEMA"])));
                                                		                                                    $this->APPLICATION_TYPE_ID  = htmlspecialchars(addslashes(trim($_POST["APPLICATION_TYPE_ID"])));
                                                		                                                    $this->DESCRIPTION  = htmlspecialchars(addslashes(trim($_POST["DESCRIPTION"])));
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
				if($this->APP_NAME == "") {
			$this->errors[] = "Campul APP_NAME este obligatoriu!";
		}
				if($this->APP_TITLE == "") {
			$this->errors[] = "Campul APP_TITLE este obligatoriu!";
		}
				if($this->APP_SCHEMA == "") {
			$this->errors[] = "Campul APP_SCHEMA este obligatoriu!";
		}
				if($this->APPLICATION_TYPE_ID == "") {
			$this->errors[] = "Campul APPLICATION_TYPE_ID este obligatoriu!";
		}
			}
	
	function setup_display(){
					 
					 
					 
					 
								//$this->APP_SCHEMA_sel = new DB_select("APP_SCHEMA",".phpapps.list_databases");
			$this->APP_SCHEMA_sel->selected_val = $this->APP_SCHEMA;
			$this->APP_SCHEMA_sel->setup_select_options();
			 
								//$this->APPLICATION_TYPE_ID_sel = new DB_select("APPLICATION_TYPE_ID",".phpapps.list_application_types");
			$this->APPLICATION_TYPE_ID_sel->selected_val = $this->APPLICATION_TYPE_ID;
			$this->APPLICATION_TYPE_ID_sel->setup_select_options();
			 
					 
				
					 
					 
					 
					 
					 
					 
					 
		                
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
                
                $this->setupDisplay();
        }
        
        function assign_vars_tpl(){
		$this->smarty->assign(array(
							"ID" => $this->ID,
							"USER_ID" => $this->USER_ID,
							"APP_NAME" => $this->APP_NAME,
							"APP_TITLE" => $this->APP_TITLE,
							"APP_SCHEMA" => $this->APP_SCHEMA,
							"APPLICATION_TYPE_ID" => $this->APPLICATION_TYPE_ID,
							"DESCRIPTION" => $this->DESCRIPTION,
									 
						 
						 
						 
										"APP_SCHEMA_sel" => $this->APP_SCHEMA_sel->get_select_str(),
			 
										"APPLICATION_TYPE_ID_sel" => $this->APPLICATION_TYPE_ID_sel->get_select_str(),
			 
						 
									 
						 
						 
						 
						 
						 
						 
						"pact" => $this->pact,
			"gact" => $this->gact,
			"gfield" => $this->gfield,
			"gfield_value" => $this->gfield_value,
			"error_msg" => $error_msg,
                        "errors"=>$this->errors
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
                    $this->displayTpl();
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
