<?php
// includes
namespace wabdo; require_once ("globals.php");

class phpapps_users_user_profiles_form{
        public $form_com_type = "html"; // html | ajax
	public $globals;
	public $form_schema = "phpapps";
	public $form_table = "user_profiles";
	public $template = "gen_tpl/phpapps_users_user_profiles_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
	            
	public $ID;
        	            
	public $USER_ID;
        	            
	public $SCRIPT_ID;
        	            
	public $PROFILE_NAME;
        	            
	public $THEME_ID;
        		
		 
		 
		 
		 
		 
			
		 
			public $USER_ID_sel;
	 
			public $SCRIPT_ID_sel;
	 
		 
			public $THEME_ID_sel;
	 
	        
        

	public $errors = array();
        
        public $resp_msgs = array();
	
	function __construct(){
		global $GLOBALS_OBJ;
		$this->globals = &$GLOBALS_OBJ;
                
                			 
					 
					 
					 
					 
				
					 
									$this->USER_ID_sel = new DB_select("USER_ID","{$this->globals->PHPAPPS_DB}.users");
                                			 
									$this->SCRIPT_ID_sel = new DB_select("SCRIPT_ID","{$this->globals->PHPAPPS_DB}.scripts");
                                			 
					 
									$this->THEME_ID_sel = new DB_select("THEME_ID","{$this->globals->PHPAPPS_DB}.themes");
                                			 
		                
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
												USER_ID,
												SCRIPT_ID,
												PROFILE_NAME,
												THEME_ID
							
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($sql);
			$this->globals->con->next();
			                                                                $this->ID = stripslashes($this->globals->con->get_field("ID"));
                                			                                                                $this->USER_ID = stripslashes($this->globals->con->get_field("USER_ID"));
                                			                                                                $this->SCRIPT_ID = stripslashes($this->globals->con->get_field("SCRIPT_ID"));
                                			                                                                $this->PROFILE_NAME = stripslashes($this->globals->con->get_field("PROFILE_NAME"));
                                			                                                                $this->THEME_ID = stripslashes($this->globals->con->get_field("THEME_ID"));
                                						
	}
	
	function afterGetRec(){
	}
	
	function beforeAddRec(){
	}
	
	function addRec(){
		$this->beforeAddRec();
	
		$this->check_errors();
		$sql = new DB_query("INSERT INTO ".$this->form_schema.".".$this->form_table." (
																					USER_ID,
																						SCRIPT_ID,
																						PROFILE_NAME,
																						THEME_ID
										 ) VALUES (
																					:USER_ID,
																						:SCRIPT_ID,
																						:PROFILE_NAME,
																						:THEME_ID
													)",
			array(
																		                                            
                                            ":USER_ID" => $this->USER_ID,
                                        														                                            
                                            ":SCRIPT_ID" => $this->SCRIPT_ID,
                                        														                                            
                                            ":PROFILE_NAME" => $this->PROFILE_NAME,
                                        														                                            
                                            ":THEME_ID" => $this->THEME_ID,
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
												USER_ID = :USER_ID,
												SCRIPT_ID = :SCRIPT_ID,
												PROFILE_NAME = :PROFILE_NAME,
												THEME_ID = :THEME_ID
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
				                                                                                    ":ID" => $this->ID,
                                        				                                                                                    ":USER_ID" => $this->USER_ID,
                                        				                                                                                    ":SCRIPT_ID" => $this->SCRIPT_ID,
                                        				                                                                                    ":PROFILE_NAME" => $this->PROFILE_NAME,
                                        				                                                                                    ":THEME_ID" => $this->THEME_ID,
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
                                                		                                                    $this->USER_ID  = htmlspecialchars(addslashes(trim($_POST["USER_ID"])));
                                                		                                                    $this->SCRIPT_ID  = htmlspecialchars(addslashes(trim($_POST["SCRIPT_ID"])));
                                                		                                                    $this->PROFILE_NAME  = htmlspecialchars(addslashes(trim($_POST["PROFILE_NAME"])));
                                                		                                                    $this->THEME_ID  = htmlspecialchars(addslashes(trim($_POST["THEME_ID"])));
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
				if($this->USER_ID == "") {
			$this->errors[] = "Campul USER_ID este obligatoriu!";
		}
				if($this->PROFILE_NAME == "") {
			$this->errors[] = "Campul PROFILE_NAME este obligatoriu!";
		}
			}
	
	function setup_display(){
					 
					 
					 
					 
					 
				
					 
									//$this->USER_ID_sel = new DB_select("USER_ID",".{$this->globals->PHPAPPS_DB}.users");
				$this->USER_ID_sel->db_query = new DB_query("SELECT ID AS VALUE, USERNAME AS LABEL FROM {$this->globals->PHPAPPS_DB}.users ORDER BY USERNAME");
				$this->USER_ID_sel->selected_val = $this->USER_ID;
				$this->USER_ID_sel->setup_select_options();
			 
									//$this->SCRIPT_ID_sel = new DB_select("SCRIPT_ID",".{$this->globals->PHPAPPS_DB}.scripts");
				$this->SCRIPT_ID_sel->db_query = new DB_query("SELECT ID AS VALUE, SCRIPT_NAME AS LABEL FROM {$this->globals->PHPAPPS_DB}.scripts ORDER BY SCRIPT_NAME");
				$this->SCRIPT_ID_sel->selected_val = $this->SCRIPT_ID;
				$this->SCRIPT_ID_sel->setup_select_options();
			 
					 
									//$this->THEME_ID_sel = new DB_select("THEME_ID",".{$this->globals->PHPAPPS_DB}.themes");
				$this->THEME_ID_sel->db_query = new DB_query("SELECT ID AS VALUE, THEME_NAME AS LABEL FROM {$this->globals->PHPAPPS_DB}.themes ORDER BY THEME_NAME");
				$this->THEME_ID_sel->selected_val = $this->THEME_ID;
				$this->THEME_ID_sel->setup_select_options();
			 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
        }
        
        function assign_vars_tpl(){
		$this->globals->sm->assign(array(
							"ID" => $this->ID,
							"USER_ID" => $this->USER_ID,
							"SCRIPT_ID" => $this->SCRIPT_ID,
							"PROFILE_NAME" => $this->PROFILE_NAME,
							"THEME_ID" => $this->THEME_ID,
									 
						 
						 
						 
						 
									 
										"USER_ID_sel" => $this->USER_ID_sel->get_select_str(),
			 
										"SCRIPT_ID_sel" => $this->SCRIPT_ID_sel->get_select_str(),
			 
						 
										"THEME_ID_sel" => $this->THEME_ID_sel->get_select_str(),
			 
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