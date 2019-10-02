<?php
// includes
require_once ("globals.php");

class emanag_lol_lol_vars_form{
        public $form_com_type = "html"; // html | ajax
	public $globals;
	public $form_schema = "emanag";
	public $form_table = "lol_vars";
	public $template = "gen_tpl/emanag_lol_lol_vars_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
	            
	public $NR_VENITURI;
        	            
	public $CASS;
        	            
	public $IMPOZIT;
        	            
	public $CIAS;
        	            
	public $ZILE_LUNA_MEDIE;
        	            
	public $DATA_START;
        	            
	public $DATA_END;
        		
		 
		 
		 
		 
		 
		 
		 
			
		 
		 
		 
		 
		 
		 
		 
	        
        

	public $errors = array();
        
        public $resp_msgs = array();
	
	function __construct(){
		global $GLOBALS_OBJ;
		$this->globals = &$GLOBALS_OBJ;
                
                			 
					 
					 
					 
					 
					 
					 
				
					 
					 
					 
					 
					 
					 
					 
		                
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
									NR_VENITURI,
												CASS,
												IMPOZIT,
												CIAS,
												ZILE_LUNA_MEDIE,
												DATA_START,
												DATA_END
							
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($sql);
			$this->globals->con->next();
			                                                                $this->NR_VENITURI = stripslashes($this->globals->con->get_field("NR_VENITURI"));
                                			                                                                $this->CASS = stripslashes($this->globals->con->get_field("CASS"));
                                			                                                                $this->IMPOZIT = stripslashes($this->globals->con->get_field("IMPOZIT"));
                                			                                                                $this->CIAS = stripslashes($this->globals->con->get_field("CIAS"));
                                			                                                                $this->ZILE_LUNA_MEDIE = stripslashes($this->globals->con->get_field("ZILE_LUNA_MEDIE"));
                                			                                                                $this->DATA_START = stripslashes($this->globals->con->get_field("DATA_START"));
                                			                                                                $this->DATA_END = stripslashes($this->globals->con->get_field("DATA_END"));
                                						
	}
	
	function afterGetRec(){
	}
	
	function beforeAddRec(){
	}
	
	function addRec(){
		$this->beforeAddRec();
	
		$this->check_errors();
		$sql = new DB_query("INSERT INTO ".$this->form_schema.".".$this->form_table." (
															NR_VENITURI,
																						CASS,
																						IMPOZIT,
																						CIAS,
																						ZILE_LUNA_MEDIE,
																						DATA_START,
																						DATA_END
										 ) VALUES (
															:NR_VENITURI,
																						:CASS,
																						:IMPOZIT,
																						:CIAS,
																						:ZILE_LUNA_MEDIE,
																						:DATA_START,
																						:DATA_END
													)",
			array(
									                                            
                                            ":NR_VENITURI" => $this->NR_VENITURI,
                                        														                                            
                                            ":CASS" => $this->CASS,
                                        														                                            
                                            ":IMPOZIT" => $this->IMPOZIT,
                                        														                                            
                                            ":CIAS" => $this->CIAS,
                                        														                                            
                                            ":ZILE_LUNA_MEDIE" => $this->ZILE_LUNA_MEDIE,
                                        														                                            
                                            ":DATA_START" => $this->DATA_START,
                                        														                                            
                                            ":DATA_END" => $this->DATA_END,
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
									NR_VENITURI = :NR_VENITURI,
												CASS = :CASS,
												IMPOZIT = :IMPOZIT,
												CIAS = :CIAS,
												ZILE_LUNA_MEDIE = :ZILE_LUNA_MEDIE,
												DATA_START = :DATA_START,
												DATA_END = :DATA_END
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
				                                                                                    ":NR_VENITURI" => $this->NR_VENITURI,
                                        				                                                                                    ":CASS" => $this->CASS,
                                        				                                                                                    ":IMPOZIT" => $this->IMPOZIT,
                                        				                                                                                    ":CIAS" => $this->CIAS,
                                        				                                                                                    ":ZILE_LUNA_MEDIE" => $this->ZILE_LUNA_MEDIE,
                                        				                                                                                    ":DATA_START" => $this->DATA_START,
                                        				                                                                                    ":DATA_END" => $this->DATA_END,
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
		
		                                                    $this->NR_VENITURI  = htmlspecialchars(addslashes(trim($_POST["NR_VENITURI"])));
                                                		                                                    $this->CASS  = htmlspecialchars(addslashes(trim($_POST["CASS"])));
                                                		                                                    $this->IMPOZIT  = htmlspecialchars(addslashes(trim($_POST["IMPOZIT"])));
                                                		                                                    $this->CIAS  = htmlspecialchars(addslashes(trim($_POST["CIAS"])));
                                                		                                                    $this->ZILE_LUNA_MEDIE  = htmlspecialchars(addslashes(trim($_POST["ZILE_LUNA_MEDIE"])));
                                                		                                                    $this->DATA_START  = htmlspecialchars(addslashes(trim($_POST["DATA_START"])));
                                                		                                                    $this->DATA_END  = htmlspecialchars(addslashes(trim($_POST["DATA_END"])));
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
				if($this->NR_VENITURI == "") {
			$this->errors[] = "Campul NR_VENITURI este obligatoriu!";
		}
				if($this->CASS == "") {
			$this->errors[] = "Campul CASS este obligatoriu!";
		}
			}
	
	function setup_display(){
					 
					 
					 
					 
					 
					 
					 
				
					 
					 
					 
					 
					 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
							"NR_VENITURI" => $this->NR_VENITURI,
							"CASS" => $this->CASS,
							"IMPOZIT" => $this->IMPOZIT,
							"CIAS" => $this->CIAS,
							"ZILE_LUNA_MEDIE" => $this->ZILE_LUNA_MEDIE,
							"DATA_START" => $this->DATA_START,
							"DATA_END" => $this->DATA_END,
									 
						 
						 
						 
						 
						 
						 
									 
						 
						 
						 
						 
						 
						 
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
                $this->beforeDisplay();
		$this->setup_display();
		$this->globals->sm->fetch($this->template);
                $this->afterDisplay();
	}
        
        function ajax_server_resp(){
            return implode($this->errors,"<br>") ."<br>" . implode($this->resp_msgs,"<br>");
        }    
            
        
}
?>