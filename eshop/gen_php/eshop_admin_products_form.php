<?php
// includes
use wabdo\{template,DB_select,DB_query};
//use wabdo\DB_select;

require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");



class eshop_admin_products_form extends template{
        public $form_com_type = "html"; // html | ajax
	public $globals;
	public $form_schema = "eshop";
	public $form_table = "products";
        
	public $template;// = "gen_tpl/eshop_admin_products_form.tpl";
        
        public $tpl = "eshop_admin_products_form";
	
        //get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
        
        public $query;
        
        public $smarty;
        
	            
	public $ID;
        	            
	public $CATEGORY_ID;
        	            
	public $PRODUCT_TITLE;
        	            
	public $DESCRIPTION;
        	            
	public $PRICE;
        	            
	public $CURRENCY_ID;
        	            
	public $STOCK;
        		
		 
		 
		 
		 
		 
			public $CURRENCY_ID_sel;
	 
		 
			
		 
			public $CATEGORY_ID_sel;
	 
		 
		 
		 
		 
		 
	        
        

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
                
                			 
					 
					 
					 
					 
								$this->CURRENCY_ID_sel = new DB_select("CURRENCY_ID","eshop.list_currency");
                        			 
					 
				
					 
									$this->CATEGORY_ID_sel = new DB_select("CATEGORY_ID","eshop.categories");
                                			 
					 
					 
					 
					 
					 
		                
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
												CATEGORY_ID,
												PRODUCT_TITLE,
												DESCRIPTION,
												PRICE,
												CURRENCY_ID,
												STOCK
							
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($this->query);
			$this->globals->con->next();
			                                                                $this->ID = stripslashes($this->globals->con->get_field("ID"));
                                			                                                                $this->CATEGORY_ID = stripslashes($this->globals->con->get_field("CATEGORY_ID"));
                                			                                                                $this->PRODUCT_TITLE = stripslashes($this->globals->con->get_field("PRODUCT_TITLE"));
                                			                                                                $this->DESCRIPTION = stripslashes($this->globals->con->get_field("DESCRIPTION"));
                                			                                                                $this->PRICE = stripslashes($this->globals->con->get_field("PRICE"));
                                			                                                                $this->CURRENCY_ID = stripslashes($this->globals->con->get_field("CURRENCY_ID"));
                                			                                                                $this->STOCK = stripslashes($this->globals->con->get_field("STOCK"));
                                						
	}
	
	function afterGetRec(){
	}
	
	function beforeAddRec(){
	}
	
	function addRec(){
		$this->beforeAddRec();
	
		$this->check_errors();
		$this->query = new DB_query("INSERT INTO ".$this->form_schema.".".$this->form_table." (
																					CATEGORY_ID,
																						PRODUCT_TITLE,
																						DESCRIPTION,
																						PRICE,
																						CURRENCY_ID,
																						STOCK
										 ) VALUES (
																					:CATEGORY_ID,
																						:PRODUCT_TITLE,
																						:DESCRIPTION,
																						:PRICE,
																						:CURRENCY_ID,
																						:STOCK
													)",
			array(
																		                                            
                                            ":CATEGORY_ID" => $this->CATEGORY_ID,
                                        														                                            
                                            ":PRODUCT_TITLE" => $this->PRODUCT_TITLE,
                                        														                                            
                                            ":DESCRIPTION" => $this->DESCRIPTION,
                                        														                                            
                                            ":PRICE" => $this->PRICE,
                                        														                                            
                                            ":CURRENCY_ID" => $this->CURRENCY_ID,
                                        														                                            
                                            ":STOCK" => $this->STOCK,
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
												CATEGORY_ID = :CATEGORY_ID,
												PRODUCT_TITLE = :PRODUCT_TITLE,
												DESCRIPTION = :DESCRIPTION,
												PRICE = :PRICE,
												CURRENCY_ID = :CURRENCY_ID,
												STOCK = :STOCK
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
				                                                                                    ":ID" => $this->ID,
                                        				                                                                                    ":CATEGORY_ID" => $this->CATEGORY_ID,
                                        				                                                                                    ":PRODUCT_TITLE" => $this->PRODUCT_TITLE,
                                        				                                                                                    ":DESCRIPTION" => $this->DESCRIPTION,
                                        				                                                                                    ":PRICE" => $this->PRICE,
                                        				                                                                                    ":CURRENCY_ID" => $this->CURRENCY_ID,
                                        				                                                                                    ":STOCK" => $this->STOCK,
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
                                                		                                                    $this->CATEGORY_ID  = htmlspecialchars(addslashes(trim($_POST["CATEGORY_ID"])));
                                                		                                                    $this->PRODUCT_TITLE  = htmlspecialchars(addslashes(trim($_POST["PRODUCT_TITLE"])));
                                                		                                                    $this->DESCRIPTION  = htmlspecialchars(addslashes(trim($_POST["DESCRIPTION"])));
                                                		                                                    $this->PRICE  = htmlspecialchars(addslashes(trim($_POST["PRICE"])));
                                                		                                                    $this->CURRENCY_ID  = htmlspecialchars(addslashes(trim($_POST["CURRENCY_ID"])));
                                                		                                                    $this->STOCK  = htmlspecialchars(addslashes(trim($_POST["STOCK"])));
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
					 
					 
					 
					 
					 
								//$this->CURRENCY_ID_sel = new DB_select("CURRENCY_ID",".eshop.list_currency");
			$this->CURRENCY_ID_sel->selected_val = $this->CURRENCY_ID;
			$this->CURRENCY_ID_sel->setup_select_options();
			 
					 
				
					 
									//$this->CATEGORY_ID_sel = new DB_select("CATEGORY_ID",".eshop.categories");
				$this->CATEGORY_ID_sel->db_query = new DB_query("SELECT ID AS VALUE, NAME AS LABEL FROM eshop.categories ORDER BY NAME");
				$this->CATEGORY_ID_sel->selected_val = $this->CATEGORY_ID;
				$this->CATEGORY_ID_sel->setup_select_options();
			 
					 
					 
					 
					 
					 
		                
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
                
                //$this->setup_display();
        }
        
        function assign_vars_tpl(){
		$this->smarty->assign(array(
							"ID" => $this->ID,
							"CATEGORY_ID" => $this->CATEGORY_ID,
							"PRODUCT_TITLE" => $this->PRODUCT_TITLE,
							"DESCRIPTION" => $this->DESCRIPTION,
							"PRICE" => $this->PRICE,
							"CURRENCY_ID" => $this->CURRENCY_ID,
							"STOCK" => $this->STOCK,
									 
						 
						 
						 
						 
										"CURRENCY_ID_sel" => $this->CURRENCY_ID_sel->get_select_str(),
			 
						 
									 
										"CATEGORY_ID_sel" => $this->CATEGORY_ID_sel->get_select_str(),
			 
						 
						 
						 
						 
						 
						"pact" => $this->pact,
			"gact" => $this->gact,
			"gfield" => $this->gfield,
			"gfield_value" => $this->gfield_value,
			"error_msg" => $error_msg,
                        "errors"=>$this->errors
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
                    $this->display_template();
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
