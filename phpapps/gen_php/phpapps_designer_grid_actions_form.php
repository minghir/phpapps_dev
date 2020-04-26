<?php
// includes
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class phpapps_designer_grid_actions_form extends phpapps_display_abs{
        public $form_com_type = "html"; // html | ajax
	public $globals;
	public $form_schema = "phpapps";
	public $form_table = "grid_actions";
        
	public $template;// = "gen_tpl/phpapps_designer_grid_actions_form.tpl";
        
        public $tpl = "phpapps_designer_grid_actions_form";
	
        //get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
        
        public $query;
        
        public $smarty;
        
	            
	public $ID;
        	            
	public $GRID_ID;
        	            
	public $NAME;
        	            
	public $LABEL;
        	            
	public $ACTION;
        	            
	public $ACTION_SCRIPT;
        	            
	public $POPUP_PAGE;
        	            
	public $DESCRIPTION;
        		
		 
		 
		 
		 
		 
		 
			public $POPUP_PAGE_sel;
	 
		 
			
		 
		 
		 
		 
		 
		 
		 
		 
	        
        

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
                
                			 
					 
					 
					 
					 
					 
								$this->POPUP_PAGE_sel = new DB_select("POPUP_PAGE","phpapps.list_true_false");
                        			 
					 
				
					 
					 
					 
					 
					 
					 
					 
					 
		                
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
												GRID_ID,
												NAME,
												LABEL,
												ACTION,
												ACTION_SCRIPT,
												POPUP_PAGE,
												DESCRIPTION
							
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($this->query);
			$this->globals->con->next();
			                                                                $this->ID = stripslashes($this->globals->con->get_field("ID"));
                                			                                                                $this->GRID_ID = stripslashes($this->globals->con->get_field("GRID_ID"));
                                			                                                                $this->NAME = stripslashes($this->globals->con->get_field("NAME"));
                                			                                                                $this->LABEL = stripslashes($this->globals->con->get_field("LABEL"));
                                			                                                                $this->ACTION = stripslashes($this->globals->con->get_field("ACTION"));
                                			                                                                $this->ACTION_SCRIPT = stripslashes($this->globals->con->get_field("ACTION_SCRIPT"));
                                			                                                                $this->POPUP_PAGE = stripslashes($this->globals->con->get_field("POPUP_PAGE"));
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
																					GRID_ID,
																						NAME,
																						LABEL,
																						ACTION,
																						ACTION_SCRIPT,
																						POPUP_PAGE,
																						DESCRIPTION
										 ) VALUES (
																					:GRID_ID,
																						:NAME,
																						:LABEL,
																						:ACTION,
																						:ACTION_SCRIPT,
																						:POPUP_PAGE,
																						:DESCRIPTION
													)",
			array(
																		                                            
                                            ":GRID_ID" => $this->GRID_ID,
                                        														                                            
                                            ":NAME" => $this->NAME,
                                        														                                            
                                            ":LABEL" => $this->LABEL,
                                        														                                            
                                            ":ACTION" => $this->ACTION,
                                        														                                            
                                            ":ACTION_SCRIPT" => $this->ACTION_SCRIPT,
                                        														                                            
                                            ":POPUP_PAGE" => $this->POPUP_PAGE,
                                        														                                            
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
												GRID_ID = :GRID_ID,
												NAME = :NAME,
												LABEL = :LABEL,
												ACTION = :ACTION,
												ACTION_SCRIPT = :ACTION_SCRIPT,
												POPUP_PAGE = :POPUP_PAGE,
												DESCRIPTION = :DESCRIPTION
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
				                                                                                    ":ID" => $this->ID,
                                        				                                                                                    ":GRID_ID" => $this->GRID_ID,
                                        				                                                                                    ":NAME" => $this->NAME,
                                        				                                                                                    ":LABEL" => $this->LABEL,
                                        				                                                                                    ":ACTION" => $this->ACTION,
                                        				                                                                                    ":ACTION_SCRIPT" => $this->ACTION_SCRIPT,
                                        				                                                                                    ":POPUP_PAGE" => $this->POPUP_PAGE,
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
                                                		                                                    $this->GRID_ID  = htmlspecialchars(addslashes(trim($_POST["GRID_ID"])));
                                                		                                                    $this->NAME  = htmlspecialchars(addslashes(trim($_POST["NAME"])));
                                                		                                                    $this->LABEL  = htmlspecialchars(addslashes(trim($_POST["LABEL"])));
                                                		                                                    $this->ACTION  = htmlspecialchars(addslashes(trim($_POST["ACTION"])));
                                                		                                                    $this->ACTION_SCRIPT  = htmlspecialchars(addslashes(trim($_POST["ACTION_SCRIPT"])));
                                                		                                                    $this->POPUP_PAGE  = htmlspecialchars(addslashes(trim($_POST["POPUP_PAGE"])));
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
			}
	
	function setup_display(){
					 
					 
					 
					 
					 
					 
								//$this->POPUP_PAGE_sel = new DB_select("POPUP_PAGE",".phpapps.list_true_false");
			$this->POPUP_PAGE_sel->selected_val = $this->POPUP_PAGE;
			$this->POPUP_PAGE_sel->setup_select_options();
			 
					 
				
					 
					 
					 
					 
					 
					 
					 
					 
		                
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
                
                $this->setupDisplay();
        }
        
        function assign_vars_tpl(){
		$this->smarty->assign(array(
							"ID" => $this->ID,
							"GRID_ID" => $this->GRID_ID,
							"NAME" => $this->NAME,
							"LABEL" => $this->LABEL,
							"ACTION" => $this->ACTION,
							"ACTION_SCRIPT" => $this->ACTION_SCRIPT,
							"POPUP_PAGE" => $this->POPUP_PAGE,
							"DESCRIPTION" => $this->DESCRIPTION,
									 
						 
						 
						 
						 
						 
										"POPUP_PAGE_sel" => $this->POPUP_PAGE_sel->get_select_str(),
			 
						 
									 
						 
						 
						 
						 
						 
						 
						 
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
