<?php
// includes
require_once ("globals.php");

class php_quiz_questions_questions_form{
	public $globals;
	public $form_schema = "php_quiz";
	public $form_table = "questions";
	public $template = "gen_tpl/php_quiz_questions_questions_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
	            
	public $NO;
        	            
	public $CATEG_ID;
        	            
	public $QUESTION;
        	            
	public $ANSWER_1;
        	            
	public $CORRECT_1;
        	            
	public $ANSWER_2;
        	            
	public $CORRECT_2;
        	            
	public $ANSWER_3;
        	            
	public $CORRECT_3;
        		
		 
		 
		 
		 
			public $CORRECT_1_sel;
	 
		 
			public $CORRECT_2_sel;
	 
		 
			public $CORRECT_3_sel;
	 
			
		 
			public $CATEG_ID_sel;
	 
		 
		 
		 
		 
		 
		 
		 
	        
        

	public $errors = array();
	
	function __construct(){
		global $GLOBALS_OBJ;
		$this->globals = &$GLOBALS_OBJ;
                
                			 
					 
					 
					 
								$this->CORRECT_1_sel = new DB_select("CORRECT_1","php_quiz.list_da_nu");
                        			 
					 
								$this->CORRECT_2_sel = new DB_select("CORRECT_2","php_quiz.list_da_nu");
                        			 
					 
								$this->CORRECT_3_sel = new DB_select("CORRECT_3","php_quiz.list_da_nu");
                        			 
				
					 
									$this->CATEG_ID_sel = new DB_select("CATEG_ID","php_quiz.categories");
                                			 
					 
					 
					 
					 
					 
					 
					 
		                
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
									NO,
												CATEG_ID,
												QUESTION,
												ANSWER_1,
												CORRECT_1,
												ANSWER_2,
												CORRECT_2,
												ANSWER_3,
												CORRECT_3
							
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($sql);
			$this->globals->con->next();
			                                                                $this->NO = stripslashes($this->globals->con->get_field("NO"));
                                			                                                                $this->CATEG_ID = stripslashes($this->globals->con->get_field("CATEG_ID"));
                                			                                                                $this->QUESTION = stripslashes($this->globals->con->get_field("QUESTION"));
                                			                                                                $this->ANSWER_1 = stripslashes($this->globals->con->get_field("ANSWER_1"));
                                			                                                                $this->CORRECT_1 = stripslashes($this->globals->con->get_field("CORRECT_1"));
                                			                                                                $this->ANSWER_2 = stripslashes($this->globals->con->get_field("ANSWER_2"));
                                			                                                                $this->CORRECT_2 = stripslashes($this->globals->con->get_field("CORRECT_2"));
                                			                                                                $this->ANSWER_3 = stripslashes($this->globals->con->get_field("ANSWER_3"));
                                			                                                                $this->CORRECT_3 = stripslashes($this->globals->con->get_field("CORRECT_3"));
                                						
	}
	
	function afterGetRec(){
	}
	
	function beforeAddRec(){
	}
	
	function addRec(){
		$this->beforeAddRec();
	
		$this->check_errors();
		$sql = new DB_query("INSERT INTO ".$this->form_schema.".".$this->form_table." (
															NO,
																						CATEG_ID,
																						QUESTION,
																						ANSWER_1,
																						CORRECT_1,
																						ANSWER_2,
																						CORRECT_2,
																						ANSWER_3,
																						CORRECT_3
										 ) VALUES (
															:NO,
																						:CATEG_ID,
																						:QUESTION,
																						:ANSWER_1,
																						:CORRECT_1,
																						:ANSWER_2,
																						:CORRECT_2,
																						:ANSWER_3,
																						:CORRECT_3
													)",
			array(
									                                            
                                            ":NO" => $this->NO,
                                        														                                            
                                            ":CATEG_ID" => $this->CATEG_ID,
                                        														                                            
                                            ":QUESTION" => $this->QUESTION,
                                        														                                            
                                            ":ANSWER_1" => $this->ANSWER_1,
                                        														                                            
                                            ":CORRECT_1" => $this->CORRECT_1,
                                        														                                            
                                            ":ANSWER_2" => $this->ANSWER_2,
                                        														                                            
                                            ":CORRECT_2" => $this->CORRECT_2,
                                        														                                            
                                            ":ANSWER_3" => $this->ANSWER_3,
                                        														                                            
                                            ":CORRECT_3" => $this->CORRECT_3,
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
									NO = :NO,
												CATEG_ID = :CATEG_ID,
												QUESTION = :QUESTION,
												ANSWER_1 = :ANSWER_1,
												CORRECT_1 = :CORRECT_1,
												ANSWER_2 = :ANSWER_2,
												CORRECT_2 = :CORRECT_2,
												ANSWER_3 = :ANSWER_3,
												CORRECT_3 = :CORRECT_3
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
				                                                                                    ":NO" => $this->NO,
                                        				                                                                                    ":CATEG_ID" => $this->CATEG_ID,
                                        				                                                                                    ":QUESTION" => $this->QUESTION,
                                        				                                                                                    ":ANSWER_1" => $this->ANSWER_1,
                                        				                                                                                    ":CORRECT_1" => $this->CORRECT_1,
                                        				                                                                                    ":ANSWER_2" => $this->ANSWER_2,
                                        				                                                                                    ":CORRECT_2" => $this->CORRECT_2,
                                        				                                                                                    ":ANSWER_3" => $this->ANSWER_3,
                                        				                                                                                    ":CORRECT_3" => $this->CORRECT_3,
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
		
		                                                    $this->NO  = addslashes(trim($_POST["NO"]));
                        		                                                    $this->CATEG_ID  = addslashes(trim($_POST["CATEG_ID"]));
                        		                                                    $this->QUESTION  = addslashes(trim($_POST["QUESTION"]));
                        		                                                    $this->ANSWER_1  = addslashes(trim($_POST["ANSWER_1"]));
                        		                                                    $this->CORRECT_1  = addslashes(trim($_POST["CORRECT_1"]));
                        		                                                    $this->ANSWER_2  = addslashes(trim($_POST["ANSWER_2"]));
                        		                                                    $this->CORRECT_2  = addslashes(trim($_POST["CORRECT_2"]));
                        		                                                    $this->ANSWER_3  = addslashes(trim($_POST["ANSWER_3"]));
                        		                                                    $this->CORRECT_3  = addslashes(trim($_POST["CORRECT_3"]));
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
				if($this->NO == "") {
			$this->errors[] = "Campul NO este obligatoriu!";
		}
				if($this->CATEG_ID == "") {
			$this->errors[] = "Campul CATEG_ID este obligatoriu!";
		}
				if($this->QUESTION == "") {
			$this->errors[] = "Campul QUESTION este obligatoriu!";
		}
			}
	
	function setup_display(){
					 
					 
					 
					 
								//$this->CORRECT_1_sel = new DB_select("CORRECT_1",".php_quiz.list_da_nu");
			$this->CORRECT_1_sel->selected_val = $this->CORRECT_1;
			$this->CORRECT_1_sel->setup_select_options();
			 
					 
								//$this->CORRECT_2_sel = new DB_select("CORRECT_2",".php_quiz.list_da_nu");
			$this->CORRECT_2_sel->selected_val = $this->CORRECT_2;
			$this->CORRECT_2_sel->setup_select_options();
			 
					 
								//$this->CORRECT_3_sel = new DB_select("CORRECT_3",".php_quiz.list_da_nu");
			$this->CORRECT_3_sel->selected_val = $this->CORRECT_3;
			$this->CORRECT_3_sel->setup_select_options();
			 
				
					 
									//$this->CATEG_ID_sel = new DB_select("CATEG_ID",".php_quiz.categories");
				$this->CATEG_ID_sel->db_query = new DB_query("SELECT ID AS VALUE, NAME AS LABEL FROM php_quiz.categories ORDER BY NAME");
				$this->CATEG_ID_sel->selected_val = $this->CATEG_ID;
				$this->CATEG_ID_sel->setup_select_options();
			 
					 
					 
					 
					 
					 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
							"NO" => $this->NO,
							"CATEG_ID" => $this->CATEG_ID,
							"QUESTION" => $this->QUESTION,
							"ANSWER_1" => $this->ANSWER_1,
							"CORRECT_1" => $this->CORRECT_1,
							"ANSWER_2" => $this->ANSWER_2,
							"CORRECT_2" => $this->CORRECT_2,
							"ANSWER_3" => $this->ANSWER_3,
							"CORRECT_3" => $this->CORRECT_3,
									 
						 
						 
						 
										"CORRECT_1_sel" => $this->CORRECT_1_sel->get_select_str(),
			 
						 
										"CORRECT_2_sel" => $this->CORRECT_2_sel->get_select_str(),
			 
						 
										"CORRECT_3_sel" => $this->CORRECT_3_sel->get_select_str(),
			 
									 
										"CATEG_ID_sel" => $this->CATEG_ID_sel->get_select_str(),
			 
						 
						 
						 
						 
						 
						 
						 
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