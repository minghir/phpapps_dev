<?php
namespace wabdo;
// includes
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "alerts.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class test_22_generated extends template{
        public $form_com_type = "html"; // html | ajax
	public $globals;
	public $form_schema = "phpapps";
	public $form_table = "modules";
        
	public $template;// = "gen_tpl/test_22_generated.tpl";
        
        public $tpl = "test_22_generated";
	
        //get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
        
        public $query;
        
        public $smarty;
        
	            
	public $ID;
        	            
	public $APP_ID;
        	            
	public $SCRIPT_ID;
        	            
	public $MODULE_NAME;
        	            
	public $MODULE_TITLE;
        	            
	public $MODULE_LABEL;
        	            
	public $MODULE_DATE;
        	            
	public $DESCRIPTION;
        	            
	public $MODIFY_UID;
        	            
	public $CREATE_UID;
        	            
	public $MODIFY_DATE;
        	            
	public $CREATE_DATE;
        		
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
			
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
	
        public $alerts;
	
	function __construct(){
                parent::__construct();
		global $GLOBALS_OBJ;
		$this->globals = &$GLOBALS_OBJ;
                $this->alerts = new alerts();
                
                //$this->smarty = new Smarty;
                //$this->smarty->template_dir = CURRENT_APP_TPL_DIR . DIR_SEP . "gen_tpl" . DIR_SEP;
                //$this->smarty->compile_dir = SMARTY_COMPILE_DIR;
                $this->smarty = $this->globals->sm;
                
                			 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
				
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
		                
	}
		
	function init(){
		if($_SERVER['REQUEST_METHOD'] === 'POST') {
			$this->parse_post_vars();
                        $this->post_actions();
		} else {
			$this->parse_get_vars();
                        $this->get_actions();
		}
	}
	
	function before_get_rec(){
	}
	
	function get_rec(){
		$this->query = new DB_query( "SELECT 
									ID,
												APP_ID,
												SCRIPT_ID,
												MODULE_NAME,
												MODULE_TITLE,
												MODULE_LABEL,
												MODULE_DATE,
												DESCRIPTION,
												MODIFY_UID,
												CREATE_UID,
												MODIFY_DATE,
												CREATE_DATE
							
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($this->query);
			$this->globals->con->next();
			                                                                $this->ID = stripslashes($this->globals->con->get_field("ID"));
                                			                                                                $this->APP_ID = stripslashes($this->globals->con->get_field("APP_ID"));
                                			                                                                $this->SCRIPT_ID = stripslashes($this->globals->con->get_field("SCRIPT_ID"));
                                			                                                                $this->MODULE_NAME = stripslashes($this->globals->con->get_field("MODULE_NAME"));
                                			                                                                $this->MODULE_TITLE = stripslashes($this->globals->con->get_field("MODULE_TITLE"));
                                			                                                                $this->MODULE_LABEL = stripslashes($this->globals->con->get_field("MODULE_LABEL"));
                                			                                                                $this->MODULE_DATE = stripslashes($this->globals->con->get_field("MODULE_DATE"));
                                			                                                                $this->DESCRIPTION = stripslashes($this->globals->con->get_field("DESCRIPTION"));
                                			                                                                $this->MODIFY_UID = stripslashes($this->globals->con->get_field("MODIFY_UID"));
                                			                                                                $this->CREATE_UID = stripslashes($this->globals->con->get_field("CREATE_UID"));
                                			                                                                $this->MODIFY_DATE = stripslashes($this->globals->con->get_field("MODIFY_DATE"));
                                			                                                                $this->CREATE_DATE = stripslashes($this->globals->con->get_field("CREATE_DATE"));
                                						
	}
	
	function after_get_rec(){
	}
	
	function before_add_rec(){
	}
	
	function add_rec(){
		$this->before_add_rec();
	
		$this->check_errors();
		$this->query = new DB_query("INSERT INTO ".$this->form_schema.".".$this->form_table." (
																					APP_ID,
																						SCRIPT_ID,
																						MODULE_NAME,
																						MODULE_TITLE,
																						MODULE_LABEL,
																						MODULE_DATE,
																						DESCRIPTION,
																						MODIFY_UID,
																						CREATE_UID,
																						MODIFY_DATE,
																						CREATE_DATE
										 ) VALUES (
																					:APP_ID,
																						:SCRIPT_ID,
																						:MODULE_NAME,
																						:MODULE_TITLE,
																						:MODULE_LABEL,
																						:MODULE_DATE,
																						:DESCRIPTION,
																						:MODIFY_UID,
																						:CREATE_UID,
																						:MODIFY_DATE,
																						:CREATE_DATE
													)",
			array(
																		                                            
                                            ":APP_ID" => $this->APP_ID,
                                        														                                            
                                            ":SCRIPT_ID" => $this->SCRIPT_ID,
                                        														                                            
                                            ":MODULE_NAME" => $this->MODULE_NAME,
                                        														                                            
                                            ":MODULE_TITLE" => $this->MODULE_TITLE,
                                        														                                            
                                            ":MODULE_LABEL" => $this->MODULE_LABEL,
                                        														                                            
                                            ":MODULE_DATE" => $this->MODULE_DATE,
                                        														                                            
                                            ":DESCRIPTION" => $this->DESCRIPTION,
                                        														                                            
                                            ":MODIFY_UID" => $this->MODIFY_UID,
                                        														                                            
                                            ":CREATE_UID" => $this->CREATE_UID,
                                        														                                            
                                            ":MODIFY_DATE" => $this->MODIFY_DATE,
                                        														                                            
                                            ":CREATE_DATE" => $this->CREATE_DATE,
                                        												)
			);

                if($this->alerts->get_no_errors() == 0) {	
			if( $this->globals->con->query($this->query) == -1){
                            $this->alerts->add_alert("danger",$this->globals->con->get_error());
                        }else{
                            $this->alerts->add_alert("success","Inregistrare adaugata cu succes");
                        }
		}
		
		$this->after_add_rec();
	}
	
	function after_add_rec(){
		//header("Location:win_close.html");
	}
	
	function before_save_rec(){
	}
	
	function save_rec(){
		$this->before_save_rec();
		
		$this->check_errors();
		
		$this->query = new DB_query("UPDATE ".$this->form_schema.".".$this->form_table." SET 
									ID = :ID,
												APP_ID = :APP_ID,
												SCRIPT_ID = :SCRIPT_ID,
												MODULE_NAME = :MODULE_NAME,
												MODULE_TITLE = :MODULE_TITLE,
												MODULE_LABEL = :MODULE_LABEL,
												MODULE_DATE = :MODULE_DATE,
												DESCRIPTION = :DESCRIPTION,
												MODIFY_UID = :MODIFY_UID,
												CREATE_UID = :CREATE_UID,
												MODIFY_DATE = :MODIFY_DATE,
												CREATE_DATE = :CREATE_DATE
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
				                                                                                    ":ID" => $this->ID,
                                        				                                                                                    ":APP_ID" => $this->APP_ID,
                                        				                                                                                    ":SCRIPT_ID" => $this->SCRIPT_ID,
                                        				                                                                                    ":MODULE_NAME" => $this->MODULE_NAME,
                                        				                                                                                    ":MODULE_TITLE" => $this->MODULE_TITLE,
                                        				                                                                                    ":MODULE_LABEL" => $this->MODULE_LABEL,
                                        				                                                                                    ":MODULE_DATE" => $this->MODULE_DATE,
                                        				                                                                                    ":DESCRIPTION" => $this->DESCRIPTION,
                                        				                                                                                    ":MODIFY_UID" => $this->MODIFY_UID,
                                        				                                                                                    ":CREATE_UID" => $this->CREATE_UID,
                                        				                                                                                    ":MODIFY_DATE" => $this->MODIFY_DATE,
                                        				                                                                                    ":CREATE_DATE" => $this->CREATE_DATE,
                                        								":".$this->gfield => $this->gfield_value
			)	
			);
				
		if($this->alerts->get_no_errors() == 0) {	
			if( $this->globals->con->query($this->query) == -1){
                            $this->alerts->add_alert("danger",$this->globals->con->get_error());
                        }else{
                            $this->alerts->add_alert("success","Inregistrare salvata cu succes");
                        }
		}
		
		$this->after_save_rec();
	}
	
	function after_save_rec(){
	}

	function before_delete_rec(){
	}
	
	function delete_rec(){
		$this->before_delete_rec();
		
		$this->query = new DB_query("DELETE FROM ".$this->form_schema.".".$this->form_table."
				WHERE ".$this->gfield." = :".$this->gfield, array(":".$this->gfield=>$this->gfield_value) );
				
		if($this->alerts->get_no_errors() == 0) {	
			if( $this->globals->con->query($this->query) == -1){
                            $this->alerts->add_alert("danger",$this->globals->con->get_error());
                        }else{
                            $this->alerts->add_alert("success","Inregistrare stearsa cu succes");
                        }
		}
		
		$this->after_delete_rec();
	}
	
	function after_delete_rec(){
	}
	
	function parse_get_vars(){
		$this->gact = trim($_GET["gact"]);
		$this->gfield = trim($_GET["gfield"]);
		$this->gfield_value = trim($_GET["gfield_value"]);
        }
        
        function get_actions(){
			switch($this->gact){
			case "editRec":
				$this->before_get_rec();
				$this->get_rec();
				$this->after_get_rec();
			break;
			case "deleteRec":
				//$this->deleteRec();
                                $this->alerts->add_alert("warning","Sigur stergeti inregistrarea?",true);
                                $this->before_get_rec();
				$this->get_rec();
				$this->after_get_rec();
			break;
			case "addRec":
                                //$this->addRec();
			break;
		}
	}
	
	function parse_post_vars(){
		$this->pact = $_POST["pact"];
		$this->gact = $_POST["gact"];
		$this->gfield = $_POST["gfield"];
		$this->gfield_value = $_POST["gfield_value"];
		
		                                                    $this->ID  = htmlspecialchars(addslashes(trim($_POST["ID"])));
                                                		                                                    $this->APP_ID  = htmlspecialchars(addslashes(trim($_POST["APP_ID"])));
                                                		                                                    $this->SCRIPT_ID  = htmlspecialchars(addslashes(trim($_POST["SCRIPT_ID"])));
                                                		                                                    $this->MODULE_NAME  = htmlspecialchars(addslashes(trim($_POST["MODULE_NAME"])));
                                                		                                                    $this->MODULE_TITLE  = htmlspecialchars(addslashes(trim($_POST["MODULE_TITLE"])));
                                                		                                                    $this->MODULE_LABEL  = htmlspecialchars(addslashes(trim($_POST["MODULE_LABEL"])));
                                                		                                                    $this->MODULE_DATE  = htmlspecialchars(addslashes(trim($_POST["MODULE_DATE"])));
                                                		                                                    $this->DESCRIPTION  = htmlspecialchars(addslashes(trim($_POST["DESCRIPTION"])));
                                                		                                                    $this->MODIFY_UID  = htmlspecialchars(addslashes(trim($_POST["MODIFY_UID"])));
                                                		                                                    $this->CREATE_UID  = htmlspecialchars(addslashes(trim($_POST["CREATE_UID"])));
                                                		                                                    $this->MODIFY_DATE  = htmlspecialchars(addslashes(trim($_POST["MODIFY_DATE"])));
                                                		                                                    $this->CREATE_DATE  = htmlspecialchars(addslashes(trim($_POST["CREATE_DATE"])));
                                                		        }
	
        function before_post_actions(){
        }
        
        function post_actions(){
                $this->before_post_actions();
		switch($this->pact){
			case "addRec":
				$this->add_rec();
			break;
			case "saveRec":
				$this->save_rec();
			break;
			case "deleteRec":
				$this->delete_rec();
			break;
		}
                $this->after_post_actions();
	}
        
        function after_post_actions(){
        }
	
	function check_errors(){
			}
	
	function setup_display(){
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
				
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
		        }
        
        function assign_vars_tpl(){
		$this->smarty->assign(array(
							"ID" => $this->ID,
							"APP_ID" => $this->APP_ID,
							"SCRIPT_ID" => $this->SCRIPT_ID,
							"MODULE_NAME" => $this->MODULE_NAME,
							"MODULE_TITLE" => $this->MODULE_TITLE,
							"MODULE_LABEL" => $this->MODULE_LABEL,
							"MODULE_DATE" => $this->MODULE_DATE,
							"DESCRIPTION" => $this->DESCRIPTION,
							"MODIFY_UID" => $this->MODIFY_UID,
							"CREATE_UID" => $this->CREATE_UID,
							"MODIFY_DATE" => $this->MODIFY_DATE,
							"CREATE_DATE" => $this->CREATE_DATE,
									 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
									 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						"pact" => $this->pact,
			"gact" => $this->gact,
			"gfield" => $this->gfield,
			"gfield_value" => $this->gfield_value,
			"message_block" => $this->alerts->get_message_str(),
		));
	}
	
	function before_display(){	
	}
	
	function display(){
        
                $this->setup_display();
                $this->before_display();
		$this->assign_vars_tpl();
                if($this->form_com_type == "ajax" && $this->pact != ""){
                    $this->ajax_server_resp();
                }else{
                    //$this->smarty->display($this->template);
                    $this->display_template();
                }
		$this->after_display();
	}
	
	function after_display(){	
	}
	
	function get_html_str(){	
                $this->setup_display();
                $this->before_display();
		$this->smarty->fetch($this->template);
                $this->after_display();
	}
        
        function ajax_server_resp(){
            
        }    
            
        
}
?>
