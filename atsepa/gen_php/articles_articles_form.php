<?php
// includes
require_once ("globals.php");

class articles_articles_form{
	public $globals;
	public $form_schema = "atsepa";
	public $form_table = "articles";
	public $template = "gen_tpl/articles_articles_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
	            
	public $NAME;
        	            
	public $ARTICLE_TAGS;
        	            
	public $BODY;
        	            
	public $CATEG_ID;
        	            
	public $IMAGE;
        	            
	public $USER_ID;
        	            
	public $ARTICLE_DATE;
        	            
	public $INTRO;
        	            
	public $VISIBLE;
        		
		 
		 
		 
			public $CATEG_ID_sel;
	 
		 
		 
		 
		 
			public $VISIBLE_sel;
	 
			
		 
		 
		 
		 
		 
		 
		 
		 
		 
	        
        

	public $errors = array();
	
	function __construct(){
		global $GLOBALS_OBJ;
		$this->globals = &$GLOBALS_OBJ;
                
                			 
					 
					 
								$this->CATEG_ID_sel = new DB_select("CATEG_ID","atsepa.list_article_categories");
                        			 
					 
					 
					 
					 
								$this->VISIBLE_sel = new DB_select("VISIBLE","atsepa.da_nu");
                        			 
				
					 
					 
					 
					 
					 
					 
					 
					 
					 
		                
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
									NAME,
												ARTICLE_TAGS,
												BODY,
												CATEG_ID,
												IMAGE,
												USER_ID,
												ARTICLE_DATE,
												INTRO,
												VISIBLE
							
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($sql);
			$this->globals->con->next();
			                                                                $this->NAME = stripslashes($this->globals->con->get_field("NAME"));
                                			                                                                $this->ARTICLE_TAGS = stripslashes($this->globals->con->get_field("ARTICLE_TAGS"));
                                			                                                                $this->BODY = stripslashes($this->globals->con->get_field("BODY"));
                                			                                                                $this->CATEG_ID = stripslashes($this->globals->con->get_field("CATEG_ID"));
                                			                                                                $this->IMAGE = stripslashes($this->globals->con->get_field("IMAGE"));
                                			                                                                $this->USER_ID = stripslashes($this->globals->con->get_field("USER_ID"));
                                			                                                                $this->ARTICLE_DATE = stripslashes($this->globals->con->get_field("ARTICLE_DATE"));
                                			                                                                $this->INTRO = stripslashes($this->globals->con->get_field("INTRO"));
                                			                                                                $this->VISIBLE = stripslashes($this->globals->con->get_field("VISIBLE"));
                                						
	}
	
	function afterGetRec(){
	}
	
	function beforeAddRec(){
	}
	
	function addRec(){
		$this->beforeAddRec();
	
		$this->check_errors();
		$sql = new DB_query("INSERT INTO ".$this->form_schema.".".$this->form_table." (
															NAME,
																						ARTICLE_TAGS,
																						BODY,
																						CATEG_ID,
																						IMAGE,
																						USER_ID,
																						ARTICLE_DATE,
																						INTRO,
																						VISIBLE
										 ) VALUES (
															:NAME,
																						:ARTICLE_TAGS,
																						:BODY,
																						:CATEG_ID,
																						:IMAGE,
																						:USER_ID,
																						:ARTICLE_DATE,
																						:INTRO,
																						:VISIBLE
													)",
			array(
									                                            
                                            ":NAME" => $this->NAME,
                                        														                                            
                                            ":ARTICLE_TAGS" => $this->ARTICLE_TAGS,
                                        														                                            
                                            ":BODY" => $this->BODY,
                                        														                                            
                                            ":CATEG_ID" => $this->CATEG_ID,
                                        														                                            
                                            ":IMAGE" => $this->IMAGE,
                                        														                                            
                                            ":USER_ID" => $this->USER_ID,
                                        														                                            
                                            ":ARTICLE_DATE" => $this->ARTICLE_DATE,
                                        														                                            
                                            ":INTRO" => $this->INTRO,
                                        														                                            
                                            ":VISIBLE" => $this->VISIBLE,
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
									NAME = :NAME,
												ARTICLE_TAGS = :ARTICLE_TAGS,
												BODY = :BODY,
												CATEG_ID = :CATEG_ID,
												IMAGE = :IMAGE,
												USER_ID = :USER_ID,
												ARTICLE_DATE = :ARTICLE_DATE,
												INTRO = :INTRO,
												VISIBLE = :VISIBLE
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
				                                                                                    ":NAME" => $this->NAME,
                                        				                                                                                    ":ARTICLE_TAGS" => $this->ARTICLE_TAGS,
                                        				                                                                                    ":BODY" => $this->BODY,
                                        				                                                                                    ":CATEG_ID" => $this->CATEG_ID,
                                        				                                                                                    ":IMAGE" => $this->IMAGE,
                                        				                                                                                    ":USER_ID" => $this->USER_ID,
                                        				                                                                                    ":ARTICLE_DATE" => $this->ARTICLE_DATE,
                                        				                                                                                    ":INTRO" => $this->INTRO,
                                        				                                                                                    ":VISIBLE" => $this->VISIBLE,
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
		
		                                                    $this->NAME  = htmlspecialchars(addslashes(trim($_POST["NAME"])));
                                                		                                                    $this->ARTICLE_TAGS  = htmlspecialchars(addslashes(trim($_POST["ARTICLE_TAGS"])));
                                                		                                                    $this->BODY  = htmlspecialchars(addslashes(trim($_POST["BODY"])));
                                                		                                                    $this->CATEG_ID  = htmlspecialchars(addslashes(trim($_POST["CATEG_ID"])));
                                                		                                                    $this->IMAGE  = htmlspecialchars(addslashes(trim($_POST["IMAGE"])));
                                                                            $tmp_upload = new phpapps_upload(IMAGE);
                            $this->IMAGE = $tmp_upload->getFilePath();
                            unset($tmp_upload);
                        		                                                    $this->USER_ID  = htmlspecialchars(addslashes(trim($_POST["USER_ID"])));
                                                		                                                    $this->ARTICLE_DATE  = htmlspecialchars(addslashes(trim($_POST["ARTICLE_DATE"])));
                                                		                                                    $this->INTRO  = htmlspecialchars(addslashes(trim($_POST["INTRO"])));
                                                		                                                    $this->VISIBLE  = htmlspecialchars(addslashes(trim($_POST["VISIBLE"])));
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
				if($this->CATEG_ID == "") {
			$this->errors[] = "Campul CATEG_ID este obligatoriu!";
		}
				if($this->USER_ID == "") {
			$this->errors[] = "Campul USER_ID este obligatoriu!";
		}
			}
	
	function setup_display(){
					 
					 
					 
								//$this->CATEG_ID_sel = new DB_select("CATEG_ID",".atsepa.list_article_categories");
			$this->CATEG_ID_sel->selected_val = $this->CATEG_ID;
			$this->CATEG_ID_sel->setup_select_options();
			 
					 
					 
					 
					 
								//$this->VISIBLE_sel = new DB_select("VISIBLE",".atsepa.da_nu");
			$this->VISIBLE_sel->selected_val = $this->VISIBLE;
			$this->VISIBLE_sel->setup_select_options();
			 
				
					 
					 
					 
					 
					 
					 
					 
					 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
							"NAME" => $this->NAME,
							"ARTICLE_TAGS" => $this->ARTICLE_TAGS,
							"BODY" => $this->BODY,
							"CATEG_ID" => $this->CATEG_ID,
							"IMAGE" => $this->IMAGE,
							"USER_ID" => $this->USER_ID,
							"ARTICLE_DATE" => $this->ARTICLE_DATE,
							"INTRO" => $this->INTRO,
							"VISIBLE" => $this->VISIBLE,
									 
						 
						 
										"CATEG_ID_sel" => $this->CATEG_ID_sel->get_select_str(),
			 
						 
						 
						 
						 
										"VISIBLE_sel" => $this->VISIBLE_sel->get_select_str(),
			 
									 
						 
						 
						 
						 
						 
						 
						 
						 
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