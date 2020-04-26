<?php
// includes
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class phpapps_designer_grids_form extends phpapps_display_abs{
        public $form_com_type = "html"; // html | ajax
	public $globals;
	public $form_schema = "phpapps";
	public $form_table = "grids";
        
	public $template;// = "gen_tpl/phpapps_designer_grids_form.tpl";
        
        public $tpl = "phpapps_designer_grids_form";
	
        //get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
        
        public $query;
        
        public $smarty;
        
	            
	public $ID;
        	            
	public $GRID_NAME;
        	            
	public $GRID_TYPE;
        	            
	public $TABLE_ID;
        	            
	public $QUERY_ID;
        	            
	public $EDITABLE;
        	            
	public $FILTERABLE;
        	            
	public $PAGINABLE;
        	            
	public $EXPORTABLE;
        	            
	public $EDIT_FORM_ID;
        	            
	public $ROWS_ON_PAGE;
        	            
	public $ELEMENT_TEMPLATE_ID;
        	            
	public $GRID_TITLE;
        		
		 
		 
			public $GRID_TYPE_sel;
	 
		 
		 
			public $EDITABLE_sel;
	 
			public $FILTERABLE_sel;
	 
			public $PAGINABLE_sel;
	 
			public $EXPORTABLE_sel;
	 
		 
		 
		 
		 
			
		 
		 
		 
			public $TABLE_ID_sel;
	 
			public $QUERY_ID_sel;
	 
		 
		 
		 
		 
			public $EDIT_FORM_ID_sel;
	 
		 
			public $ELEMENT_TEMPLATE_ID_sel;
	 
		 
	        
        

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
                
                			 
					 
								$this->GRID_TYPE_sel = new DB_select("GRID_TYPE","phpapps.list_grid_types");
                        			 
					 
					 
								$this->EDITABLE_sel = new DB_select("EDITABLE","phpapps.list_true_false");
                        			 
								$this->FILTERABLE_sel = new DB_select("FILTERABLE","phpapps.list_true_false");
                        			 
								$this->PAGINABLE_sel = new DB_select("PAGINABLE","phpapps.list_true_false");
                        			 
								$this->EXPORTABLE_sel = new DB_select("EXPORTABLE","phpapps.list_true_false");
                        			 
					 
					 
					 
					 
				
					 
					 
					 
									$this->TABLE_ID_sel = new DB_select("TABLE_ID","phpapps.tables");
                                			 
									$this->QUERY_ID_sel = new DB_select("QUERY_ID","phpapps.queries");
                                			 
					 
					 
					 
					 
									$this->EDIT_FORM_ID_sel = new DB_select("EDIT_FORM_ID","phpapps.scripts");
                                			 
					 
									$this->ELEMENT_TEMPLATE_ID_sel = new DB_select("ELEMENT_TEMPLATE_ID","phpapps.templates");
                                			 
					 
		                
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
												GRID_NAME,
												GRID_TYPE,
												TABLE_ID,
												QUERY_ID,
												EDITABLE,
												FILTERABLE,
												PAGINABLE,
												EXPORTABLE,
												EDIT_FORM_ID,
												ROWS_ON_PAGE,
												ELEMENT_TEMPLATE_ID,
												GRID_TITLE
							
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($this->query);
			$this->globals->con->next();
			                                                                $this->ID = stripslashes($this->globals->con->get_field("ID"));
                                			                                                                $this->GRID_NAME = stripslashes($this->globals->con->get_field("GRID_NAME"));
                                			                                                                $this->GRID_TYPE = stripslashes($this->globals->con->get_field("GRID_TYPE"));
                                			                                                                $this->TABLE_ID = stripslashes($this->globals->con->get_field("TABLE_ID"));
                                			                                                                $this->QUERY_ID = stripslashes($this->globals->con->get_field("QUERY_ID"));
                                			                                                                $this->EDITABLE = stripslashes($this->globals->con->get_field("EDITABLE"));
                                			                                                                $this->FILTERABLE = stripslashes($this->globals->con->get_field("FILTERABLE"));
                                			                                                                $this->PAGINABLE = stripslashes($this->globals->con->get_field("PAGINABLE"));
                                			                                                                $this->EXPORTABLE = stripslashes($this->globals->con->get_field("EXPORTABLE"));
                                			                                                                $this->EDIT_FORM_ID = stripslashes($this->globals->con->get_field("EDIT_FORM_ID"));
                                			                                                                $this->ROWS_ON_PAGE = stripslashes($this->globals->con->get_field("ROWS_ON_PAGE"));
                                			                                                                $this->ELEMENT_TEMPLATE_ID = stripslashes($this->globals->con->get_field("ELEMENT_TEMPLATE_ID"));
                                			                                                                $this->GRID_TITLE = stripslashes($this->globals->con->get_field("GRID_TITLE"));
                                						
	}
	
	function afterGetRec(){
	}
	
	function beforeAddRec(){
	}
	
	function addRec(){
		$this->beforeAddRec();
	
		$this->check_errors();
		$this->query = new DB_query("INSERT INTO ".$this->form_schema.".".$this->form_table." (
																					GRID_NAME,
																						GRID_TYPE,
																						TABLE_ID,
																						QUERY_ID,
																						EDITABLE,
																						FILTERABLE,
																						PAGINABLE,
																						EXPORTABLE,
																						EDIT_FORM_ID,
																						ROWS_ON_PAGE,
																						ELEMENT_TEMPLATE_ID,
																						GRID_TITLE
										 ) VALUES (
																					:GRID_NAME,
																						:GRID_TYPE,
																						:TABLE_ID,
																						:QUERY_ID,
																						:EDITABLE,
																						:FILTERABLE,
																						:PAGINABLE,
																						:EXPORTABLE,
																						:EDIT_FORM_ID,
																						:ROWS_ON_PAGE,
																						:ELEMENT_TEMPLATE_ID,
																						:GRID_TITLE
													)",
			array(
																		                                            
                                            ":GRID_NAME" => $this->GRID_NAME,
                                        														                                            
                                            ":GRID_TYPE" => $this->GRID_TYPE,
                                        														                                            
                                            ":TABLE_ID" => $this->TABLE_ID,
                                        														                                            
                                            ":QUERY_ID" => $this->QUERY_ID,
                                        														                                            
                                            ":EDITABLE" => $this->EDITABLE,
                                        														                                            
                                            ":FILTERABLE" => $this->FILTERABLE,
                                        														                                            
                                            ":PAGINABLE" => $this->PAGINABLE,
                                        														                                            
                                            ":EXPORTABLE" => $this->EXPORTABLE,
                                        														                                            
                                            ":EDIT_FORM_ID" => $this->EDIT_FORM_ID,
                                        														                                            
                                            ":ROWS_ON_PAGE" => $this->ROWS_ON_PAGE,
                                        														                                            
                                            ":ELEMENT_TEMPLATE_ID" => $this->ELEMENT_TEMPLATE_ID,
                                        														                                            
                                            ":GRID_TITLE" => $this->GRID_TITLE,
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
												GRID_NAME = :GRID_NAME,
												GRID_TYPE = :GRID_TYPE,
												TABLE_ID = :TABLE_ID,
												QUERY_ID = :QUERY_ID,
												EDITABLE = :EDITABLE,
												FILTERABLE = :FILTERABLE,
												PAGINABLE = :PAGINABLE,
												EXPORTABLE = :EXPORTABLE,
												EDIT_FORM_ID = :EDIT_FORM_ID,
												ROWS_ON_PAGE = :ROWS_ON_PAGE,
												ELEMENT_TEMPLATE_ID = :ELEMENT_TEMPLATE_ID,
												GRID_TITLE = :GRID_TITLE
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
				                                                                                    ":ID" => $this->ID,
                                        				                                                                                    ":GRID_NAME" => $this->GRID_NAME,
                                        				                                                                                    ":GRID_TYPE" => $this->GRID_TYPE,
                                        				                                                                                    ":TABLE_ID" => $this->TABLE_ID,
                                        				                                                                                    ":QUERY_ID" => $this->QUERY_ID,
                                        				                                                                                    ":EDITABLE" => $this->EDITABLE,
                                        				                                                                                    ":FILTERABLE" => $this->FILTERABLE,
                                        				                                                                                    ":PAGINABLE" => $this->PAGINABLE,
                                        				                                                                                    ":EXPORTABLE" => $this->EXPORTABLE,
                                        				                                                                                    ":EDIT_FORM_ID" => $this->EDIT_FORM_ID,
                                        				                                                                                    ":ROWS_ON_PAGE" => $this->ROWS_ON_PAGE,
                                        				                                                                                    ":ELEMENT_TEMPLATE_ID" => $this->ELEMENT_TEMPLATE_ID,
                                        				                                                                                    ":GRID_TITLE" => $this->GRID_TITLE,
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
                                                		                                                    $this->GRID_NAME  = htmlspecialchars(addslashes(trim($_POST["GRID_NAME"])));
                                                		                                                    $this->GRID_TYPE  = htmlspecialchars(addslashes(trim($_POST["GRID_TYPE"])));
                                                		                                                    $this->TABLE_ID  = htmlspecialchars(addslashes(trim($_POST["TABLE_ID"])));
                                                		                                                    $this->QUERY_ID  = htmlspecialchars(addslashes(trim($_POST["QUERY_ID"])));
                                                		                                                    $this->EDITABLE  = htmlspecialchars(addslashes(trim($_POST["EDITABLE"])));
                                                		                                                    $this->FILTERABLE  = htmlspecialchars(addslashes(trim($_POST["FILTERABLE"])));
                                                		                                                    $this->PAGINABLE  = htmlspecialchars(addslashes(trim($_POST["PAGINABLE"])));
                                                		                                                    $this->EXPORTABLE  = htmlspecialchars(addslashes(trim($_POST["EXPORTABLE"])));
                                                		                                                    $this->EDIT_FORM_ID  = htmlspecialchars(addslashes(trim($_POST["EDIT_FORM_ID"])));
                                                		                                                    $this->ROWS_ON_PAGE  = htmlspecialchars(addslashes(trim($_POST["ROWS_ON_PAGE"])));
                                                		                                                    $this->ELEMENT_TEMPLATE_ID  = htmlspecialchars(addslashes(trim($_POST["ELEMENT_TEMPLATE_ID"])));
                                                		                                                    $this->GRID_TITLE  = htmlspecialchars(addslashes(trim($_POST["GRID_TITLE"])));
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
				if($this->GRID_NAME == "") {
			$this->errors[] = "Campul GRID_NAME este obligatoriu!";
		}
				if($this->GRID_TITLE == "") {
			$this->errors[] = "Campul GRID_TITLE este obligatoriu!";
		}
			}
	
	function setup_display(){
					 
					 
								//$this->GRID_TYPE_sel = new DB_select("GRID_TYPE",".phpapps.list_grid_types");
			$this->GRID_TYPE_sel->selected_val = $this->GRID_TYPE;
			$this->GRID_TYPE_sel->setup_select_options();
			 
					 
					 
								//$this->EDITABLE_sel = new DB_select("EDITABLE",".phpapps.list_true_false");
			$this->EDITABLE_sel->selected_val = $this->EDITABLE;
			$this->EDITABLE_sel->setup_select_options();
			 
								//$this->FILTERABLE_sel = new DB_select("FILTERABLE",".phpapps.list_true_false");
			$this->FILTERABLE_sel->selected_val = $this->FILTERABLE;
			$this->FILTERABLE_sel->setup_select_options();
			 
								//$this->PAGINABLE_sel = new DB_select("PAGINABLE",".phpapps.list_true_false");
			$this->PAGINABLE_sel->selected_val = $this->PAGINABLE;
			$this->PAGINABLE_sel->setup_select_options();
			 
								//$this->EXPORTABLE_sel = new DB_select("EXPORTABLE",".phpapps.list_true_false");
			$this->EXPORTABLE_sel->selected_val = $this->EXPORTABLE;
			$this->EXPORTABLE_sel->setup_select_options();
			 
					 
					 
					 
					 
				
					 
					 
					 
									//$this->TABLE_ID_sel = new DB_select("TABLE_ID",".phpapps.tables");
				$this->TABLE_ID_sel->db_query = new DB_query("SELECT ID AS VALUE, TABLE_NAME AS LABEL FROM phpapps.tables ORDER BY TABLE_NAME");
				$this->TABLE_ID_sel->selected_val = $this->TABLE_ID;
				$this->TABLE_ID_sel->setup_select_options();
			 
									//$this->QUERY_ID_sel = new DB_select("QUERY_ID",".phpapps.queries");
				$this->QUERY_ID_sel->db_query = new DB_query("SELECT ID AS VALUE, QUERY_NAME AS LABEL FROM phpapps.queries ORDER BY QUERY_NAME");
				$this->QUERY_ID_sel->selected_val = $this->QUERY_ID;
				$this->QUERY_ID_sel->setup_select_options();
			 
					 
					 
					 
					 
									//$this->EDIT_FORM_ID_sel = new DB_select("EDIT_FORM_ID",".phpapps.scripts");
				$this->EDIT_FORM_ID_sel->db_query = new DB_query("SELECT ID AS VALUE, SCRIPT_NAME AS LABEL FROM phpapps.scripts ORDER BY SCRIPT_NAME");
				$this->EDIT_FORM_ID_sel->selected_val = $this->EDIT_FORM_ID;
				$this->EDIT_FORM_ID_sel->setup_select_options();
			 
					 
									//$this->ELEMENT_TEMPLATE_ID_sel = new DB_select("ELEMENT_TEMPLATE_ID",".phpapps.templates");
				$this->ELEMENT_TEMPLATE_ID_sel->db_query = new DB_query("SELECT ID AS VALUE, TEMPLATE_NAME AS LABEL FROM phpapps.templates ORDER BY TEMPLATE_NAME");
				$this->ELEMENT_TEMPLATE_ID_sel->selected_val = $this->ELEMENT_TEMPLATE_ID;
				$this->ELEMENT_TEMPLATE_ID_sel->setup_select_options();
			 
					 
		                
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
                
                $this->setupDisplay();
        }
        
        function assign_vars_tpl(){
		$this->smarty->assign(array(
							"ID" => $this->ID,
							"GRID_NAME" => $this->GRID_NAME,
							"GRID_TYPE" => $this->GRID_TYPE,
							"TABLE_ID" => $this->TABLE_ID,
							"QUERY_ID" => $this->QUERY_ID,
							"EDITABLE" => $this->EDITABLE,
							"FILTERABLE" => $this->FILTERABLE,
							"PAGINABLE" => $this->PAGINABLE,
							"EXPORTABLE" => $this->EXPORTABLE,
							"EDIT_FORM_ID" => $this->EDIT_FORM_ID,
							"ROWS_ON_PAGE" => $this->ROWS_ON_PAGE,
							"ELEMENT_TEMPLATE_ID" => $this->ELEMENT_TEMPLATE_ID,
							"GRID_TITLE" => $this->GRID_TITLE,
									 
						 
										"GRID_TYPE_sel" => $this->GRID_TYPE_sel->get_select_str(),
			 
						 
						 
										"EDITABLE_sel" => $this->EDITABLE_sel->get_select_str(),
			 
										"FILTERABLE_sel" => $this->FILTERABLE_sel->get_select_str(),
			 
										"PAGINABLE_sel" => $this->PAGINABLE_sel->get_select_str(),
			 
										"EXPORTABLE_sel" => $this->EXPORTABLE_sel->get_select_str(),
			 
						 
						 
						 
						 
									 
						 
						 
										"TABLE_ID_sel" => $this->TABLE_ID_sel->get_select_str(),
			 
										"QUERY_ID_sel" => $this->QUERY_ID_sel->get_select_str(),
			 
						 
						 
						 
						 
										"EDIT_FORM_ID_sel" => $this->EDIT_FORM_ID_sel->get_select_str(),
			 
						 
										"ELEMENT_TEMPLATE_ID_sel" => $this->ELEMENT_TEMPLATE_ID_sel->get_select_str(),
			 
						 
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
