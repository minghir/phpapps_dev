<?php
namespace wabdo;
require_once ("globals.php");
include ("gen_php/phpapps_designer_layout_elements_form.php");
	class phpapps_designer_layout_elements_form_impl  extends phpapps_designer_layout_elements_form{
		function __construct(){
			parent::__construct();
                        $this->layout = PHPAPPS_LAYOUTS_DIR . "default_form.tpl";
			$this->tpl = "phpapps_designer_layout_elements_form_imp.tpl";
			$this->init();
			$this->load_elements();
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
		}
		
		function afterDisplay(){	
		}
		
	};
	
	$phpapps_designer_layout_elements_form_Impl = new phpapps_designer_layout_elements_form_impl();
?>