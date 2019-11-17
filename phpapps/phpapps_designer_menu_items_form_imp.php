<?php
require_once ("globals.php");
include ("gen_php/phpapps_designer_menu_items_form.php");
	class phpapps_designer_menu_items_form_impl  extends phpapps_designer_menu_items_form{
		function __construct(){
			parent::__construct();
			$this->template = "phpapps_designer_menu_items_form_imp.tpl";
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
                    echo "ADDERDDDD";
                    echo $this->query->prnt();
                    print_r($this->errors);
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
		}
		
		function afterDisplay(){	
		}
		
	};
	
	$phpapps_designer_menu_items_form_Impl = new phpapps_designer_menu_items_form_impl();
?>