<?php
namespace wabdo;
// includes
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "alerts.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class eshop_admin_clients_form_generated extends template{
        public $form_com_type = "html"; // html | ajax
	public $globals;
	public $form_schema = "eshop";
	public $form_table = "clients";
        
	public $template;// = "gen_tpl/eshop_admin_clients_form_generated.tpl";
        
        public $tpl = "eshop_admin_clients_form_generated";
	
        //get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
        
        public $query;
        
        public $smarty;
        
	            
	public $ID;
        	            
	public $FIRST_NAME;
        	            
	public $LAST_NAME;
        	            
	public $TITLE_ID;
        	            
	public $BIRTH_DATE;
        	            
	public $EMAIL;
        	            
	public $COUNTRY_ID;
        	            
	public $COUNTY_ID;
        	            
	public $CITY;
        	            
	public $POSTAL_CODE;
        	            
	public $ADDRESS_DETAILS;
        	            
	public $REMARKS;
        	            
	public $PHONE;
        		
		 
		 
		 
		 
		 
		 
			public $COUNTRY_ID_sel;
	 
			public $COUNTY_ID_sel;
	 
		 
		 
		 
		 
		 
			
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
	
        public $alerts;
	
	function __construct(){
                parent::__construct();
		global $GLOBALS_OBJ;
		$this->globals = &$GLOBALS_OBJ;
                $this->alerts = new alerts();
                
                //$this->smarty = new Smarty;
                //$this->smarty->template_dir = CURRENT_APP_TPL_DIR . DIR_SEP . "gen_tpl" . DIR_SEP;
                //$this->smarty->compile_dir = SMARTY_COMPILE_DIR;
                $this->smarty = $this->globals->sm;
                
                			 
					 
					 
					 
					 
					 
								$this->COUNTRY_ID_sel = new DB_select("COUNTRY_ID","{$this->globals->CURRENT_APP_DB}.list_countries");
                        			 
								$this->COUNTY_ID_sel = new DB_select("COUNTY_ID","{$this->globals->CURRENT_APP_DB}.list_counties");
                        			 
					 
					 
					 
					 
					 
				
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
		                
	}
		
	function init(){
		if($_SERVER['REQUEST_METHOD'] === 'POST') {
			$this->parse_post_vars();
                        $this->post_actions();
		} else {
			$this->parse_get_vars();
                        $this->get_actions();
		}
	}
	
	function before_get_rec(){
	}
	
	function get_rec(){
		$this->query = new DB_query( "SELECT 
									ID,
												FIRST_NAME,
												LAST_NAME,
												TITLE_ID,
												BIRTH_DATE,
												EMAIL,
												COUNTRY_ID,
												COUNTY_ID,
												CITY,
												POSTAL_CODE,
												ADDRESS_DETAILS,
												REMARKS,
												PHONE
							
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($this->query);
			$this->globals->con->next();
			                                                                $this->ID = stripslashes($this->globals->con->get_field("ID"));
                                			                                                                $this->FIRST_NAME = stripslashes($this->globals->con->get_field("FIRST_NAME"));
                                			                                                                $this->LAST_NAME = stripslashes($this->globals->con->get_field("LAST_NAME"));
                                			                                                                $this->TITLE_ID = stripslashes($this->globals->con->get_field("TITLE_ID"));
                                			                                                                $this->BIRTH_DATE = stripslashes($this->globals->con->get_field("BIRTH_DATE"));
                                			                                                                $this->EMAIL = stripslashes($this->globals->con->get_field("EMAIL"));
                                			                                                                $this->COUNTRY_ID = stripslashes($this->globals->con->get_field("COUNTRY_ID"));
                                			                                                                $this->COUNTY_ID = stripslashes($this->globals->con->get_field("COUNTY_ID"));
                                			                                                                $this->CITY = stripslashes($this->globals->con->get_field("CITY"));
                                			                                                                $this->POSTAL_CODE = stripslashes($this->globals->con->get_field("POSTAL_CODE"));
                                			                                                                $this->ADDRESS_DETAILS = stripslashes($this->globals->con->get_field("ADDRESS_DETAILS"));
                                			                                                                $this->REMARKS = stripslashes($this->globals->con->get_field("REMARKS"));
                                			                                                                $this->PHONE = stripslashes($this->globals->con->get_field("PHONE"));
                                						
	}
	
	function after_get_rec(){
	}
	
	function before_add_rec(){
	}
	
	function add_rec(){
		$this->before_add_rec();
	
		$this->check_errors();
		$this->query = new DB_query("INSERT INTO ".$this->form_schema.".".$this->form_table." (
																					FIRST_NAME,
																						LAST_NAME,
																						TITLE_ID,
																						BIRTH_DATE,
																						EMAIL,
																						COUNTRY_ID,
																						COUNTY_ID,
																						CITY,
																						POSTAL_CODE,
																						ADDRESS_DETAILS,
																						REMARKS,
																						PHONE
										 ) VALUES (
																					:FIRST_NAME,
																						:LAST_NAME,
																						:TITLE_ID,
																						:BIRTH_DATE,
																						:EMAIL,
																						:COUNTRY_ID,
																						:COUNTY_ID,
																						:CITY,
																						:POSTAL_CODE,
																						:ADDRESS_DETAILS,
																						:REMARKS,
																						:PHONE
													)",
			array(
																		                                            
                                            ":FIRST_NAME" => $this->FIRST_NAME,
                                        														                                            
                                            ":LAST_NAME" => $this->LAST_NAME,
                                        														                                            
                                            ":TITLE_ID" => $this->TITLE_ID,
                                        														                                            
                                            ":BIRTH_DATE" => $this->BIRTH_DATE,
                                        														                                            
                                            ":EMAIL" => $this->EMAIL,
                                        														                                            
                                            ":COUNTRY_ID" => $this->COUNTRY_ID,
                                        														                                            
                                            ":COUNTY_ID" => $this->COUNTY_ID,
                                        														                                            
                                            ":CITY" => $this->CITY,
                                        														                                            
                                            ":POSTAL_CODE" => $this->POSTAL_CODE,
                                        														                                            
                                            ":ADDRESS_DETAILS" => $this->ADDRESS_DETAILS,
                                        														                                            
                                            ":REMARKS" => $this->REMARKS,
                                        														                                            
                                            ":PHONE" => $this->PHONE,
                                        												)
			);

                if($this->alerts->get_no_errors() == 0) {	
			if( $this->globals->con->query($this->query) == -1){
                            $this->alerts->add_alert("danger",$this->globals->con->get_error());
                        }else{
                            $this->alerts->add_alert("success","Inregistrare adaugata cu succes");
                        }
		}
		
		$this->after_add_rec();
	}
	
	function after_add_rec(){
		//header("Location:win_close.html");
	}
	
	function before_save_rec(){
	}
	
	function save_rec(){
		$this->before_save_rec();
		
		$this->check_errors();
		
		$this->query = new DB_query("UPDATE ".$this->form_schema.".".$this->form_table." SET 
									ID = :ID,
												FIRST_NAME = :FIRST_NAME,
												LAST_NAME = :LAST_NAME,
												TITLE_ID = :TITLE_ID,
												BIRTH_DATE = :BIRTH_DATE,
												EMAIL = :EMAIL,
												COUNTRY_ID = :COUNTRY_ID,
												COUNTY_ID = :COUNTY_ID,
												CITY = :CITY,
												POSTAL_CODE = :POSTAL_CODE,
												ADDRESS_DETAILS = :ADDRESS_DETAILS,
												REMARKS = :REMARKS,
												PHONE = :PHONE
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
				                                                                                    ":ID" => $this->ID,
                                        				                                                                                    ":FIRST_NAME" => $this->FIRST_NAME,
                                        				                                                                                    ":LAST_NAME" => $this->LAST_NAME,
                                        				                                                                                    ":TITLE_ID" => $this->TITLE_ID,
                                        				                                                                                    ":BIRTH_DATE" => $this->BIRTH_DATE,
                                        				                                                                                    ":EMAIL" => $this->EMAIL,
                                        				                                                                                    ":COUNTRY_ID" => $this->COUNTRY_ID,
                                        				                                                                                    ":COUNTY_ID" => $this->COUNTY_ID,
                                        				                                                                                    ":CITY" => $this->CITY,
                                        				                                                                                    ":POSTAL_CODE" => $this->POSTAL_CODE,
                                        				                                                                                    ":ADDRESS_DETAILS" => $this->ADDRESS_DETAILS,
                                        				                                                                                    ":REMARKS" => $this->REMARKS,
                                        				                                                                                    ":PHONE" => $this->PHONE,
                                        								":".$this->gfield => $this->gfield_value
			)	
			);
				
		if($this->alerts->get_no_errors() == 0) {	
			if( $this->globals->con->query($this->query) == -1){
                            $this->alerts->add_alert("danger",$this->globals->con->get_error());
                        }else{
                            $this->alerts->add_alert("success","Inregistrare salvata cu succes");
                        }
		}
		
		$this->after_save_rec();
	}
	
	function after_save_rec(){
	}

	function before_delete_rec(){
	}
	
	function delete_rec(){
		$this->before_delete_rec();
		
		$this->query = new DB_query("DELETE FROM ".$this->form_schema.".".$this->form_table."
				WHERE ".$this->gfield." = :".$this->gfield, array(":".$this->gfield=>$this->gfield_value) );
				
		if($this->alerts->get_no_errors() == 0) {	
			if( $this->globals->con->query($this->query) == -1){
                            $this->alerts->add_alert("danger",$this->globals->con->get_error());
                        }else{
                            $this->alerts->add_alert("success","Inregistrare stearsa cu succes");
                        }
		}
		
		$this->after_delete_rec();
	}
	
	function after_delete_rec(){
	}
	
	function parse_get_vars(){
		$this->gact = trim($_GET["gact"]);
		$this->gfield = trim($_GET["gfield"]);
		$this->gfield_value = trim($_GET["gfield_value"]);
        }
        
        function get_actions(){
			switch($this->gact){
			case "editRec":
				$this->before_get_rec();
				$this->get_rec();
				$this->after_get_rec();
			break;
			case "deleteRec":
				//$this->deleteRec();
                                $this->alerts->add_alert("warning","Sigur stergeti inregistrarea?",true);
                                $this->before_get_rec();
				$this->get_rec();
				$this->after_get_rec();
			break;
			case "addRec":
                                //$this->addRec();
			break;
		}
	}
	
	function parse_post_vars(){
		$this->pact = $_POST["pact"];
		$this->gact = $_POST["gact"];
		$this->gfield = $_POST["gfield"];
		$this->gfield_value = $_POST["gfield_value"];
		
		                                                    $this->ID  = htmlspecialchars(addslashes(trim($_POST["ID"])));
                                                		                                                    $this->FIRST_NAME  = htmlspecialchars(addslashes(trim($_POST["FIRST_NAME"])));
                                                		                                                    $this->LAST_NAME  = htmlspecialchars(addslashes(trim($_POST["LAST_NAME"])));
                                                		                                                    $this->TITLE_ID  = htmlspecialchars(addslashes(trim($_POST["TITLE_ID"])));
                                                		                                                    $this->BIRTH_DATE  = htmlspecialchars(addslashes(trim($_POST["BIRTH_DATE"])));
                                                		                                                    $this->EMAIL  = htmlspecialchars(addslashes(trim($_POST["EMAIL"])));
                                                		                                                    $this->COUNTRY_ID  = htmlspecialchars(addslashes(trim($_POST["COUNTRY_ID"])));
                                                		                                                    $this->COUNTY_ID  = htmlspecialchars(addslashes(trim($_POST["COUNTY_ID"])));
                                                		                                                    $this->CITY  = htmlspecialchars(addslashes(trim($_POST["CITY"])));
                                                		                                                    $this->POSTAL_CODE  = htmlspecialchars(addslashes(trim($_POST["POSTAL_CODE"])));
                                                		                                                    $this->ADDRESS_DETAILS  = htmlspecialchars(addslashes(trim($_POST["ADDRESS_DETAILS"])));
                                                		                                                    $this->REMARKS  = htmlspecialchars(addslashes(trim($_POST["REMARKS"])));
                                                		                                                    $this->PHONE  = htmlspecialchars(addslashes(trim($_POST["PHONE"])));
                                                		        }
	
        function before_post_actions(){
        }
        
        function post_actions(){
                $this->before_post_actions();
		switch($this->pact){
			case "addRec":
				$this->add_rec();
			break;
			case "saveRec":
				$this->save_rec();
			break;
			case "deleteRec":
				$this->delete_rec();
			break;
		}
                $this->after_post_actions();
	}
        
        function after_post_actions(){
        }
	
	function check_errors(){
			}
	
	function setup_display(){
					 
					 
					 
					 
					 
					 
								//$this->COUNTRY_ID_sel = new DB_select("COUNTRY_ID",".{$this->globals->CURRENT_APP_DB}.list_countries");
			$this->COUNTRY_ID_sel->selected_val = $this->COUNTRY_ID;
			$this->COUNTRY_ID_sel->setup_select_options();
			 
								//$this->COUNTY_ID_sel = new DB_select("COUNTY_ID",".{$this->globals->CURRENT_APP_DB}.list_counties");
			$this->COUNTY_ID_sel->selected_val = $this->COUNTY_ID;
			$this->COUNTY_ID_sel->setup_select_options();
			 
					 
					 
					 
					 
					 
				
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
		        }
        
        function assign_vars_tpl(){
		$this->smarty->assign(array(
							"ID" => $this->ID,
							"FIRST_NAME" => $this->FIRST_NAME,
							"LAST_NAME" => $this->LAST_NAME,
							"TITLE_ID" => $this->TITLE_ID,
							"BIRTH_DATE" => $this->BIRTH_DATE,
							"EMAIL" => $this->EMAIL,
							"COUNTRY_ID" => $this->COUNTRY_ID,
							"COUNTY_ID" => $this->COUNTY_ID,
							"CITY" => $this->CITY,
							"POSTAL_CODE" => $this->POSTAL_CODE,
							"ADDRESS_DETAILS" => $this->ADDRESS_DETAILS,
							"REMARKS" => $this->REMARKS,
							"PHONE" => $this->PHONE,
									 
						 
						 
						 
						 
						 
										"COUNTRY_ID_sel" => $this->COUNTRY_ID_sel->get_select_str(),
			 
										"COUNTY_ID_sel" => $this->COUNTY_ID_sel->get_select_str(),
			 
						 
						 
						 
						 
						 
									 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						"pact" => $this->pact,
			"gact" => $this->gact,
			"gfield" => $this->gfield,
			"gfield_value" => $this->gfield_value,
			"message_block" => $this->alerts->get_message_str(),
		));
	}
	
	function before_display(){	
	}
	
	function display(){
        
                $this->setup_display();
                $this->before_display();
		$this->assign_vars_tpl();
                if($this->form_com_type == "ajax" && $this->pact != ""){
                    $this->ajax_server_resp();
                }else{
                    //$this->smarty->display($this->template);
                    $this->display_template();
                }
		$this->after_display();
	}
	
	function after_display(){	
	}
	
	function get_html_str(){	
                $this->setup_display();
                $this->before_display();
		$this->smarty->fetch($this->template);
                $this->after_display();
	}
        
        function ajax_server_resp(){
            
        }    
            
        
}
?>
