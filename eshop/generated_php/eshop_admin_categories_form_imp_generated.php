<?php
namespace wabdo;
// includes
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "alerts.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class eshop_admin_categories_form_imp_generated extends template{
        public $form_com_type = "html"; // html | ajax
	public $globals;
	public $form_schema = "eshop";
	public $form_table = "categories";
        
	public $template;// = "gen_tpl/eshop_admin_categories_form_imp_generated.tpl";
        
        public $tpl = "eshop_admin_categories_form_imp_generated";
	
        //get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
        
        public $query;
        
        public $smarty;
        
	            
	public $ID;
        	            
	public $PID;
        	            
	public $NAME;
        	            
	public $TITLE;
        	            
	public $DESCRIPTION;
        		
		 
		 
		 
		 
		 
			
		 
			public $PID_sel;
	 
		 
		 
		 
	
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
                
                			 
					 
					 
					 
					 
				
					 
									$this->PID_sel = new DB_select("PID","eshop.categories");
                                			 
					 
					 
					 
		                
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
												PID,
												NAME,
												TITLE,
												DESCRIPTION
							
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($this->query);
			$this->globals->con->next();
			                                                                $this->ID = stripslashes($this->globals->con->get_field("ID"));
                                			                                                                $this->PID = stripslashes($this->globals->con->get_field("PID"));
                                			                                                                $this->NAME = stripslashes($this->globals->con->get_field("NAME"));
                                			                                                                $this->TITLE = stripslashes($this->globals->con->get_field("TITLE"));
                                			                                                                $this->DESCRIPTION = stripslashes($this->globals->con->get_field("DESCRIPTION"));
                                						
	}
	
	function after_get_rec(){
	}
	
	function before_add_rec(){
	}
	
	function add_rec(){
		$this->before_add_rec();
	
		$this->check_errors();
		$this->query = new DB_query("INSERT INTO ".$this->form_schema.".".$this->form_table." (
																					PID,
																						NAME,
																						TITLE,
																						DESCRIPTION
										 ) VALUES (
																					:PID,
																						:NAME,
																						:TITLE,
																						:DESCRIPTION
													)",
			array(
																		                                            
                                            ":PID" => $this->PID,
                                        														                                            
                                            ":NAME" => $this->NAME,
                                        														                                            
                                            ":TITLE" => $this->TITLE,
                                        														                                            
                                            ":DESCRIPTION" => $this->DESCRIPTION,
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
												PID = :PID,
												NAME = :NAME,
												TITLE = :TITLE,
												DESCRIPTION = :DESCRIPTION
							
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
				                                                                                    ":ID" => $this->ID,
                                        				                                                                                    ":PID" => $this->PID,
                                        				                                                                                    ":NAME" => $this->NAME,
                                        				                                                                                    ":TITLE" => $this->TITLE,
                                        				                                                                                    ":DESCRIPTION" => $this->DESCRIPTION,
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
                                                		                                                    $this->PID  = htmlspecialchars(addslashes(trim($_POST["PID"])));
                                                		                                                    $this->NAME  = htmlspecialchars(addslashes(trim($_POST["NAME"])));
                                                		                                                    $this->TITLE  = htmlspecialchars(addslashes(trim($_POST["TITLE"])));
                                                		                                                    $this->DESCRIPTION  = htmlspecialchars(addslashes(trim($_POST["DESCRIPTION"])));
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
					 
					 
					 
					 
					 
				
					 
									//$this->PID_sel = new DB_select("PID",".eshop.categories");
				//$this->PID_sel->db_query = new DB_query("SELECT ID AS VALUE, NAME AS LABEL FROM eshop.categories ORDER BY NAME");
                                
                                $this->PID_sel->table = "eshop.categories";
                                $this->PID_sel->value_col = "ID";
                                $this->PID_sel->label_col = "NAME";
                                
				$this->PID_sel->selected_val = $this->PID;
				$this->PID_sel->setup_select_options();
			 
					 
					 
					 
		        }
        
        function assign_vars_tpl(){
		$this->smarty->assign(array(
							"ID" => $this->ID,
							"PID" => $this->PID,
							"NAME" => $this->NAME,
							"TITLE" => $this->TITLE,
							"DESCRIPTION" => $this->DESCRIPTION,
									 
						 
						 
						 
						 
									 
										"PID_sel" => $this->PID_sel->get_select_str(),
			 
						 
						 
						 
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
