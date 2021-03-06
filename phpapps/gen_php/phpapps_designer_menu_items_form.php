<?php
// includes
namespace wabdo; require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class phpapps_designer_menu_items_form extends template{
        public $form_com_type = "html"; // html | ajax
	public $globals;
	public $form_schema = "phpapps";
	public $form_table = "menu_items";
	public $template = "gen_tpl/phpapps_designer_menu_items_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
        
        public $query;
        
	            
	public $ID;
        	            
	public $PID;
        	            
	public $MENU_ID;
        	            
	public $ACTION;
        	            
	public $LABEL;
        		
		 
		 
		 
		 
		 
			
		 
			public $PID_sel;
	 
			public $MENU_ID_sel;
	 
		 
		 
	        
        

	public $errors = array();
        
        public $resp_msgs = array();
	
	function __construct(){
                parent::__construct();
		global $GLOBALS_OBJ;
		$this->globals = &$GLOBALS_OBJ;
                
                			 
					 
					 
					 
					 
				
					 
									$this->PID_sel = new DB_select("PID","{$this->globals->PHPAPPS_DB}.menu_items");
                                			 
									$this->MENU_ID_sel = new DB_select("MENU_ID","{$this->globals->PHPAPPS_DB}.menus");
                                			 
					 
					 
		                
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
												PID,
												MENU_ID,
												ACTION,
												LABEL
							
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($this->query);
			$this->globals->con->next();
			                                                                $this->ID = stripslashes($this->globals->con->get_field("ID"));
                                			                                                                $this->PID = stripslashes($this->globals->con->get_field("PID"));
                                			                                                                $this->MENU_ID = stripslashes($this->globals->con->get_field("MENU_ID"));
                                			                                                                $this->ACTION = stripslashes($this->globals->con->get_field("ACTION"));
                                			                                                                $this->LABEL = stripslashes($this->globals->con->get_field("LABEL"));
                                						
	}
	
	function afterGetRec(){
	}
	
	function beforeAddRec(){
	}
	
	function addRec(){
		$this->beforeAddRec();
	
		$this->check_errors();
		$this->query = new DB_query("INSERT INTO ".$this->form_schema.".".$this->form_table." (
																					PID,
																						MENU_ID,
																						ACTION,
																						LABEL
										 ) VALUES (
																					:PID,
																						:MENU_ID,
																						:ACTION,
																						:LABEL
													)",
			array(
																		                                            
                                            ":PID" => $this->PID,
                                        														                                            
                                            ":MENU_ID" => $this->MENU_ID,
                                        														                                            
                                            ":ACTION" => $this->ACTION,
                                        														                                            
                                            ":LABEL" => $this->LABEL,
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
												PID = :PID,
												MENU_ID = :MENU_ID,
												ACTION = :ACTION,
												LABEL = :LABEL
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
				                                                                                    ":ID" => $this->ID,
                                        				                                                                                    ":PID" => $this->PID,
                                        				                                                                                    ":MENU_ID" => $this->MENU_ID,
                                        				                                                                                    ":ACTION" => $this->ACTION,
                                        				                                                                                    ":LABEL" => $this->LABEL,
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
                                                		                                                    $this->PID  = htmlspecialchars(addslashes(trim($_POST["PID"])));
                                                		                                                    $this->MENU_ID  = htmlspecialchars(addslashes(trim($_POST["MENU_ID"])));
                                                		                                                    $this->ACTION  = htmlspecialchars(addslashes(trim($_POST["ACTION"])));
                                                		                                                    $this->LABEL  = htmlspecialchars(addslashes(trim($_POST["LABEL"])));
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
					 
					 
					 
					 
					 
				
					 
									//$this->PID_sel = new DB_select("PID",".{$this->globals->PHPAPPS_DB}.menu_items");
				$this->PID_sel->db_query = new DB_query("SELECT ID AS VALUE, LABEL AS LABEL FROM {$this->globals->PHPAPPS_DB}.menu_items ORDER BY LABEL");
				$this->PID_sel->selected_val = $this->PID;
				$this->PID_sel->setup_select_options();
			 
									//$this->MENU_ID_sel = new DB_select("MENU_ID",".{$this->globals->PHPAPPS_DB}.menus");
				$this->MENU_ID_sel->db_query = new DB_query("SELECT ID AS VALUE, NAME AS LABEL FROM {$this->globals->PHPAPPS_DB}.menus ORDER BY NAME");
				$this->MENU_ID_sel->selected_val = $this->MENU_ID;
				$this->MENU_ID_sel->setup_select_options();
			 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
        }
        
        function assign_vars_tpl(){
		$this->globals->sm->assign(array(
							"ID" => $this->ID,
							"PID" => $this->PID,
							"MENU_ID" => $this->MENU_ID,
							"ACTION" => $this->ACTION,
							"LABEL" => $this->LABEL,
									 
						 
						 
						 
						 
									 
										"PID_sel" => $this->PID_sel->get_select_str(),
			 
										"MENU_ID_sel" => $this->MENU_ID_sel->get_select_str(),
			 
						 
						 
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
