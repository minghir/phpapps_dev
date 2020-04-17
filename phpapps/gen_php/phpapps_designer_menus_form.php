<?php
// includes
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class phpapps_designer_menus_form extends phpapps_display_abs{
        public $form_com_type = "html"; // html | ajax
	public $globals;
	public $form_schema = "phpapps";
	public $form_table = "menus";
	public $template = "gen_tpl/phpapps_designer_menus_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
        
        public $query;
        
	            
	public $ID;
        	            
	public $NAME;
        	            
	public $MENU_TITLE;
        	            
	public $MENU_TYPE;
        	            
	public $ORIENTATION;
        	            
	public $QUERY_ID;
        	            
	public $DESCRIPTION;
        		
		 
		 
		 
			public $MENU_TYPE_sel;
	 
			public $ORIENTATION_sel;
	 
		 
		 
			
		 
		 
		 
		 
		 
			public $QUERY_ID_sel;
	 
		 
	        
        

	public $errors = array();
        
        public $resp_msgs = array();
	
	function __construct(){
                parent::__construct();
		global $GLOBALS_OBJ;
		$this->globals = &$GLOBALS_OBJ;
                
                			 
					 
					 
								$this->MENU_TYPE_sel = new DB_select("MENU_TYPE","phpapps.list_menu_types");
                        			 
								$this->ORIENTATION_sel = new DB_select("ORIENTATION","phpapps.list_menu_orientation");
                        			 
					 
					 
				
					 
					 
					 
					 
					 
									$this->QUERY_ID_sel = new DB_select("QUERY_ID","phpapps.queries");
                                			 
					 
		                
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
												NAME,
												MENU_TITLE,
												MENU_TYPE,
												ORIENTATION,
												QUERY_ID,
												DESCRIPTION
							
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($this->query);
			$this->globals->con->next();
			                                                                $this->ID = stripslashes($this->globals->con->get_field("ID"));
                                			                                                                $this->NAME = stripslashes($this->globals->con->get_field("NAME"));
                                			                                                                $this->MENU_TITLE = stripslashes($this->globals->con->get_field("MENU_TITLE"));
                                			                                                                $this->MENU_TYPE = stripslashes($this->globals->con->get_field("MENU_TYPE"));
                                			                                                                $this->ORIENTATION = stripslashes($this->globals->con->get_field("ORIENTATION"));
                                			                                                                $this->QUERY_ID = stripslashes($this->globals->con->get_field("QUERY_ID"));
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
																					NAME,
																						MENU_TITLE,
																						MENU_TYPE,
																						ORIENTATION,
																						QUERY_ID,
																						DESCRIPTION
										 ) VALUES (
																					:NAME,
																						:MENU_TITLE,
																						:MENU_TYPE,
																						:ORIENTATION,
																						:QUERY_ID,
																						:DESCRIPTION
													)",
			array(
																		                                            
                                            ":NAME" => $this->NAME,
                                        														                                            
                                            ":MENU_TITLE" => $this->MENU_TITLE,
                                        														                                            
                                            ":MENU_TYPE" => $this->MENU_TYPE,
                                        														                                            
                                            ":ORIENTATION" => $this->ORIENTATION,
                                        														                                            
                                            ":QUERY_ID" => $this->QUERY_ID,
                                        														                                            
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
												NAME = :NAME,
												MENU_TITLE = :MENU_TITLE,
												MENU_TYPE = :MENU_TYPE,
												ORIENTATION = :ORIENTATION,
												QUERY_ID = :QUERY_ID,
												DESCRIPTION = :DESCRIPTION
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
				                                                                                    ":ID" => $this->ID,
                                        				                                                                                    ":NAME" => $this->NAME,
                                        				                                                                                    ":MENU_TITLE" => $this->MENU_TITLE,
                                        				                                                                                    ":MENU_TYPE" => $this->MENU_TYPE,
                                        				                                                                                    ":ORIENTATION" => $this->ORIENTATION,
                                        				                                                                                    ":QUERY_ID" => $this->QUERY_ID,
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
                                                		                                                    $this->NAME  = htmlspecialchars(addslashes(trim($_POST["NAME"])));
                                                		                                                    $this->MENU_TITLE  = htmlspecialchars(addslashes(trim($_POST["MENU_TITLE"])));
                                                		                                                    $this->MENU_TYPE  = htmlspecialchars(addslashes(trim($_POST["MENU_TYPE"])));
                                                		                                                    $this->ORIENTATION  = htmlspecialchars(addslashes(trim($_POST["ORIENTATION"])));
                                                		                                                    $this->QUERY_ID  = htmlspecialchars(addslashes(trim($_POST["QUERY_ID"])));
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
				if($this->NAME == "") {
			$this->errors[] = "Campul NAME este obligatoriu!";
		}
				if($this->MENU_TYPE == "") {
			$this->errors[] = "Campul MENU_TYPE este obligatoriu!";
		}
				if($this->ORIENTATION == "") {
			$this->errors[] = "Campul ORIENTATION este obligatoriu!";
		}
			}
	
	function setup_display(){
					 
					 
					 
								//$this->MENU_TYPE_sel = new DB_select("MENU_TYPE",".phpapps.list_menu_types");
			$this->MENU_TYPE_sel->selected_val = $this->MENU_TYPE;
			$this->MENU_TYPE_sel->setup_select_options();
			 
								//$this->ORIENTATION_sel = new DB_select("ORIENTATION",".phpapps.list_menu_orientation");
			$this->ORIENTATION_sel->selected_val = $this->ORIENTATION;
			$this->ORIENTATION_sel->setup_select_options();
			 
					 
					 
				
					 
					 
					 
					 
					 
									//$this->QUERY_ID_sel = new DB_select("QUERY_ID",".phpapps.queries");
				$this->QUERY_ID_sel->db_query = new DB_query("SELECT ID AS VALUE, QUERY_NAME AS LABEL FROM phpapps.queries ORDER BY QUERY_NAME");
				$this->QUERY_ID_sel->selected_val = $this->QUERY_ID;
				$this->QUERY_ID_sel->setup_select_options();
			 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
        }
        
        function assign_vars_tpl(){
		$this->globals->sm->assign(array(
							"ID" => $this->ID,
							"NAME" => $this->NAME,
							"MENU_TITLE" => $this->MENU_TITLE,
							"MENU_TYPE" => $this->MENU_TYPE,
							"ORIENTATION" => $this->ORIENTATION,
							"QUERY_ID" => $this->QUERY_ID,
							"DESCRIPTION" => $this->DESCRIPTION,
									 
						 
						 
										"MENU_TYPE_sel" => $this->MENU_TYPE_sel->get_select_str(),
			 
										"ORIENTATION_sel" => $this->ORIENTATION_sel->get_select_str(),
			 
						 
						 
									 
						 
						 
						 
						 
										"QUERY_ID_sel" => $this->QUERY_ID_sel->get_select_str(),
			 
						 
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
