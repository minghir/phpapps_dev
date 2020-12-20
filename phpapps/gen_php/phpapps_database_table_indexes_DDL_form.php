<?php
// includes
namespace wabdo; require_once ("globals.php");

class phpapps_database_table_indexes_DDL_form{
        public $form_com_type = "html"; // html | ajax
	public $globals;
	public $form_schema = "phpapps";
	public $form_table = "table_indexes";
	public $template = "gen_tpl/phpapps_database_table_indexes_DDL_form.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
	            
	public $ID;
        	            
	public $TABLE_ID;
        	            
	public $INDEX_NAME;
        	            
	public $INDEX_TYPE_ID;
        	                public $INDEX_COLUMNS = array();    
        	            
	public $DESCRIPTION;
        		
		 
		 
		 
			public $INDEX_TYPE_ID_sel;
	 
		 
		 
			
		 
		 
		 
		 
			public $INDEX_COLUMNS_sel;
	 
		 
	        
        

	public $errors = array();
        
        public $resp_msgs = array();
	
	function __construct(){
		global $GLOBALS_OBJ;
		$this->globals = &$GLOBALS_OBJ;
                
                			 
					 
					 
								$this->INDEX_TYPE_ID_sel = new DB_select("INDEX_TYPE_ID","{$this->globals->PHPAPPS_DB}.list_index_types");
                        			 
					 
					 
				
					 
					 
					 
					 
									$this->INDEX_COLUMNS_sel = new DB_select("INDEX_COLUMNS","{$this->globals->PHPAPPS_DB}.table_details");
                                                                    $this->INDEX_COLUMNS_sel->set_multiple(TRUE);
                                			 
					 
		                
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
									ID,
												TABLE_ID,
												INDEX_NAME,
												INDEX_TYPE_ID,
												INDEX_COLUMNS,
												DESCRIPTION
							
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($sql);
			$this->globals->con->next();
			                                                                $this->ID = stripslashes($this->globals->con->get_field("ID"));
                                			                                                                $this->TABLE_ID = stripslashes($this->globals->con->get_field("TABLE_ID"));
                                			                                                                $this->INDEX_NAME = stripslashes($this->globals->con->get_field("INDEX_NAME"));
                                			                                                                $this->INDEX_TYPE_ID = stripslashes($this->globals->con->get_field("INDEX_TYPE_ID"));
                                			                                                                $this->INDEX_COLUMNS = explode(",",$this->globals->con->get_field("INDEX_COLUMNS"));    
                                			                                                                $this->DESCRIPTION = stripslashes($this->globals->con->get_field("DESCRIPTION"));
                                						
	}
	
	function afterGetRec(){
	}
	
	function beforeAddRec(){
	}
	
	function addRec(){
		$this->beforeAddRec();
	
		$this->check_errors();
		$sql = new DB_query("INSERT INTO ".$this->form_schema.".".$this->form_table." (
																					TABLE_ID,
																						INDEX_NAME,
																						INDEX_TYPE_ID,
																						INDEX_COLUMNS,
																						DESCRIPTION
										 ) VALUES (
																					:TABLE_ID,
																						:INDEX_NAME,
																						:INDEX_TYPE_ID,
																						:INDEX_COLUMNS,
																						:DESCRIPTION
													)",
			array(
																		                                            
                                            ":TABLE_ID" => $this->TABLE_ID,
                                        														                                            
                                            ":INDEX_NAME" => $this->INDEX_NAME,
                                        														                                            
                                            ":INDEX_TYPE_ID" => $this->INDEX_TYPE_ID,
                                        														                                                                                    ":INDEX_COLUMNS" => implode(",",$this->INDEX_COLUMNS),
                                        														                                            
                                            ":DESCRIPTION" => $this->DESCRIPTION,
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
									ID = :ID,
												TABLE_ID = :TABLE_ID,
												INDEX_NAME = :INDEX_NAME,
												INDEX_TYPE_ID = :INDEX_TYPE_ID,
												INDEX_COLUMNS = :INDEX_COLUMNS,
												DESCRIPTION = :DESCRIPTION
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
				                                                                                    ":ID" => $this->ID,
                                        				                                                                                    ":TABLE_ID" => $this->TABLE_ID,
                                        				                                                                                    ":INDEX_NAME" => $this->INDEX_NAME,
                                        				                                                                                    ":INDEX_TYPE_ID" => $this->INDEX_TYPE_ID,
                                        				                                                                                    ":INDEX_COLUMNS" => implode(",",$this->INDEX_COLUMNS),
                                        				                                                                                    ":DESCRIPTION" => $this->DESCRIPTION,
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
		
		                                                    $this->ID  = htmlspecialchars(addslashes(trim($_POST["ID"])));
                                                		                                                    $this->TABLE_ID  = htmlspecialchars(addslashes(trim($_POST["TABLE_ID"])));
                                                		                                                    $this->INDEX_NAME  = htmlspecialchars(addslashes(trim($_POST["INDEX_NAME"])));
                                                		                                                    $this->INDEX_TYPE_ID  = htmlspecialchars(addslashes(trim($_POST["INDEX_TYPE_ID"])));
                                                		                                                     $this->INDEX_COLUMNS  = $_POST["INDEX_COLUMNS"];
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
				if($this->TABLE_ID == "") {
			$this->errors[] = "Campul TABLE_ID este obligatoriu!";
		}
				if($this->INDEX_NAME == "") {
			$this->errors[] = "Campul INDEX_NAME este obligatoriu!";
		}
				if($this->INDEX_TYPE_ID == "") {
			$this->errors[] = "Campul INDEX_TYPE_ID este obligatoriu!";
		}
				if($this->INDEX_COLUMNS == "") {
			$this->errors[] = "Campul INDEX_COLUMNS este obligatoriu!";
		}
			}
	
	function setup_display(){
					 
					 
					 
								//$this->INDEX_TYPE_ID_sel = new DB_select("INDEX_TYPE_ID",".{$this->globals->PHPAPPS_DB}.list_index_types");
			$this->INDEX_TYPE_ID_sel->selected_val = $this->INDEX_TYPE_ID;
			$this->INDEX_TYPE_ID_sel->setup_select_options();
			 
					 
					 
				
					 
					 
					 
					 
									//$this->INDEX_COLUMNS_sel = new DB_select("INDEX_COLUMNS",".{$this->globals->PHPAPPS_DB}.table_details");
				$this->INDEX_COLUMNS_sel->db_query = new DB_query("SELECT ID AS VALUE, COLUMN_NAME AS LABEL FROM {$this->globals->PHPAPPS_DB}.table_details ORDER BY COLUMN_NAME");
				$this->INDEX_COLUMNS_sel->selected_val = $this->INDEX_COLUMNS;
				$this->INDEX_COLUMNS_sel->setup_select_options();
			 
					 
			
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
        }
        
        function assign_vars_tpl(){
		$this->globals->sm->assign(array(
							"ID" => $this->ID,
							"TABLE_ID" => $this->TABLE_ID,
							"INDEX_NAME" => $this->INDEX_NAME,
							"INDEX_TYPE_ID" => $this->INDEX_TYPE_ID,
							"INDEX_COLUMNS" => $this->INDEX_COLUMNS,
							"DESCRIPTION" => $this->DESCRIPTION,
									 
						 
						 
										"INDEX_TYPE_ID_sel" => $this->INDEX_TYPE_ID_sel->get_select_str(),
			 
						 
						 
									 
						 
						 
						 
										"INDEX_COLUMNS_sel" => $this->INDEX_COLUMNS_sel->get_select_str(),
			 
						 
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