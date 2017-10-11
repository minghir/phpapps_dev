<?php
require_once ("globals.php");
include ("gen_php/admin_contact_form.php");
	class admin_contact_form_impl  extends admin_contact_form{
		function __construct(){
			parent::__construct();
			$this->template = "contact.tpl";
			$this->init();
			$this->display();
		}
		
		function beforeGetRec(){
		}
		
		function afterGetRec(){
		}
	
		function beforeAddRec(){
		}
		
		function afterAddRec(){
			//header("Location:win_close.html");
		}
		
		function beforeSaveRec(){
		}
		
		function afterSaveRec(){
			//header("Location:win_close.html");
		}

		function beforeDeleteRec(){
		}
		
		function afterDeleteRec(){
		//	header("Location:win_close.html");
		}
		
		function beforeDisplay(){	
                    if(isset($this->pact) && $this->NAME == ""){
                        $this->errors = array();
                        $this->errors[] = "Campul NUME este obligatoriu!";
                    }
                    if(isset($this->pact) && count($this->errors) == 0){
                        $this->globals->sm->assign("succes_msg","Mesajul dvs. a fost trimis cu succes.");
                    }
		}
		
		function afterDisplay(){	
		}
		
	};
	
	//$admin_contact_form_Impl = new admin_contact_form_impl();
?>