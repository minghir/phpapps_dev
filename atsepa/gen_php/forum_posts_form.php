<?php
// includes
require_once ("globals.php");

class forum_posts_form{
	public $globals;
	public $form_schema = "atsepa";
	public $form_table = "posts";
	public $template = "gen_tpl/forum_posts_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
	            
	public $TOPIC_ID;
        	            
	public $USER_ID;
        	            
	public $CONTENT;
        		
		 
		 
		 
			
			public $TOPIC_ID_sel;
	 
		 
		 
	        
        

	public $errors = array();
	
	function __construct(){
		global $GLOBALS_OBJ;
		$this->globals = &$GLOBALS_OBJ;
                
                			 
					 
					 
				
									$this->TOPIC_ID_sel = new DB_select("TOPIC_ID","atsepa.topics");
                                			 
					 
					 
		                
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
									TOPIC_ID,
												USER_ID,
												CONTENT
							
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($sql);
			$this->globals->con->next();
			                                                                $this->TOPIC_ID = stripslashes($this->globals->con->get_field("TOPIC_ID"));
                                			                                                                $this->USER_ID = stripslashes($this->globals->con->get_field("USER_ID"));
                                			                                                                $this->CONTENT = stripslashes($this->globals->con->get_field("CONTENT"));
                                						
	}
	
	function afterGetRec(){
	}
	
	function beforeAddRec(){
	}
	
	function addRec(){
		$this->beforeAddRec();
	
		$this->check_errors();
		$sql = new DB_query("INSERT INTO ".$this->form_schema.".".$this->form_table." (
															TOPIC_ID,
																						USER_ID,
																						CONTENT
										 ) VALUES (
															:TOPIC_ID,
																						:USER_ID,
																						:CONTENT
													)",
			array(
									                                            
                                            ":TOPIC_ID" => $this->TOPIC_ID,
                                        														                                            
                                            ":USER_ID" => $this->USER_ID,
                                        														                                            
                                            ":CONTENT" => $this->CONTENT,
                                        												)
			);

		if(count($this->errors) == 0) {	
			if( $this->globals->con->query($sql) == -1){
                            $this->errors[] = $this->globals->con->get_error();
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
									TOPIC_ID = :TOPIC_ID,
												USER_ID = :USER_ID,
												CONTENT = :CONTENT
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
				                                                                                    ":TOPIC_ID" => $this->TOPIC_ID,
                                        				                                                                                    ":USER_ID" => $this->USER_ID,
                                        				                                                                                    ":CONTENT" => $this->CONTENT,
                                        								":".$this->gfield => $this->gfield_value
			)	
			);
				
		if(count($this->errors) == 0) {	
			if( $this->globals->con->query($sql) == -1){
                            $this->errors[] = $this->globals->con->get_error();
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
		
		                                                    $this->TOPIC_ID  = htmlspecialchars(addslashes(trim($_POST["TOPIC_ID"])));
                                                		                                                    $this->USER_ID  = htmlspecialchars(addslashes(trim($_POST["USER_ID"])));
                                                		                                                    $this->CONTENT  = htmlspecialchars(addslashes(trim($_POST["CONTENT"])));
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
			}
	
	function setup_display(){
					 
					 
					 
				
									//$this->TOPIC_ID_sel = new DB_select("TOPIC_ID",".atsepa.topics");
				$this->TOPIC_ID_sel->db_query = new DB_query("SELECT ID AS VALUE, SUBJECT AS LABEL FROM atsepa.topics ORDER BY SUBJECT");
				$this->TOPIC_ID_sel->selected_val = $this->TOPIC_ID;
				$this->TOPIC_ID_sel->setup_select_options();
			 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
							"TOPIC_ID" => $this->TOPIC_ID,
							"USER_ID" => $this->USER_ID,
							"CONTENT" => $this->CONTENT,
									 
						 
						 
													"TOPIC_ID_sel" => $this->TOPIC_ID_sel->get_select_str(),
			 
						 
						 
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
                $this->beforeDisplay();
		$this->setup_display();
		$this->globals->sm->display($this->template);
		$this->afterDisplay();
	}
	
	function afterDisplay(){	
	}
	
	function get_html_str(){	
                $this->beforeDisplay();
		$this->setup_display();
		$this->globals->sm->fetch($this->template);
                $this->afterDisplay();
	}
}
?>