<?php
// includes
namespace wabdo; require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class phpapps_designer_grid_columns_form extends template{
        public $form_com_type = "html"; // html | ajax
	public $globals;
	public $form_schema = "phpapps";
	public $form_table = "grid_columns";
	public $template = "gen_tpl/phpapps_designer_grid_columns_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
        
        public $query;
        
	            
	public $ID;
        	            
	public $GRID_ID;
        	            
	public $COLUMN_ID;
        	            
	public $LABEL;
        	            
	public $ACTION;
        	            
	public $ALT_COLUMN_TEXT;
        		
		 
		 
		 
		 
		 
		 
			
		 
		 
			public $COLUMN_ID_sel;
	 
		 
		 
		 
	        
        

	public $errors = array();
        
        public $resp_msgs = array();
	
	function __construct(){
                parent::__construct();
		global $GLOBALS_OBJ;
		$this->globals = &$GLOBALS_OBJ;
                
                			 
					 
					 
					 
					 
					 
				
					 
					 
									$this->COLUMN_ID_sel = new DB_select("COLUMN_ID","phpapps.table_details");
                                			 
					 
					 
					 
		                
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
												COLUMN_ID,
												LABEL,
												ACTION,
												ALT_COLUMN_TEXT
							
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($this->query);
			$this->globals->con->next();
			                                                                $this->ID = stripslashes($this->globals->con->get_field("ID"));
                                			                                                                $this->GRID_ID = stripslashes($this->globals->con->get_field("GRID_ID"));
                                			                                                                $this->COLUMN_ID = stripslashes($this->globals->con->get_field("COLUMN_ID"));
                                			                                                                $this->LABEL = stripslashes($this->globals->con->get_field("LABEL"));
                                			                                                                $this->ACTION = stripslashes($this->globals->con->get_field("ACTION"));
                                			                                                                $this->ALT_COLUMN_TEXT = stripslashes($this->globals->con->get_field("ALT_COLUMN_TEXT"));
                                						
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
																						COLUMN_ID,
																						LABEL,
																						ACTION,
																						ALT_COLUMN_TEXT
										 ) VALUES (
																					:GRID_ID,
																						:COLUMN_ID,
																						:LABEL,
																						:ACTION,
																						:ALT_COLUMN_TEXT
													)",
			array(
																		                                            
                                            ":GRID_ID" => $this->GRID_ID,
                                        														                                            
                                            ":COLUMN_ID" => $this->COLUMN_ID,
                                        														                                            
                                            ":LABEL" => $this->LABEL,
                                        														                                            
                                            ":ACTION" => $this->ACTION,
                                        														                                            
                                            ":ALT_COLUMN_TEXT" => $this->ALT_COLUMN_TEXT,
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
												COLUMN_ID = :COLUMN_ID,
												LABEL = :LABEL,
												ACTION = :ACTION,
												ALT_COLUMN_TEXT = :ALT_COLUMN_TEXT
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
				                                                                                    ":ID" => $this->ID,
                                        				                                                                                    ":GRID_ID" => $this->GRID_ID,
                                        				                                                                                    ":COLUMN_ID" => $this->COLUMN_ID,
                                        				                                                                                    ":LABEL" => $this->LABEL,
                                        				                                                                                    ":ACTION" => $this->ACTION,
                                        				                                                                                    ":ALT_COLUMN_TEXT" => $this->ALT_COLUMN_TEXT,
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
                                                		                                                    $this->COLUMN_ID  = htmlspecialchars(addslashes(trim($_POST["COLUMN_ID"])));
                                                		                                                    $this->LABEL  = htmlspecialchars(addslashes(trim($_POST["LABEL"])));
                                                		                                                    $this->ACTION  = htmlspecialchars(addslashes(trim($_POST["ACTION"])));
                                                		                                                    $this->ALT_COLUMN_TEXT  = htmlspecialchars(addslashes(trim($_POST["ALT_COLUMN_TEXT"])));
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
					 
					 
					 
					 
					 
					 
				
					 
					 
									//$this->COLUMN_ID_sel = new DB_select("COLUMN_ID",".phpapps.table_details");
				$this->COLUMN_ID_sel->db_query = new DB_query("SELECT ID AS VALUE, COLUMN_NAME AS LABEL FROM phpapps.table_details ORDER BY COLUMN_NAME");
				$this->COLUMN_ID_sel->selected_val = $this->COLUMN_ID;
				$this->COLUMN_ID_sel->setup_select_options();
			 
					 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
        }
        
        function assign_vars_tpl(){
		$this->globals->sm->assign(array(
							"ID" => $this->ID,
							"GRID_ID" => $this->GRID_ID,
							"COLUMN_ID" => $this->COLUMN_ID,
							"LABEL" => $this->LABEL,
							"ACTION" => $this->ACTION,
							"ALT_COLUMN_TEXT" => $this->ALT_COLUMN_TEXT,
									 
						 
						 
						 
						 
						 
									 
						 
										"COLUMN_ID_sel" => $this->COLUMN_ID_sel->get_select_str(),
			 
						 
						 
						 
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
