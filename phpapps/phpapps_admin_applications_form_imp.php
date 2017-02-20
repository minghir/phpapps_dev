<?php
require_once ("globals.php");
include ("gen_php/phpapps_admin_applications_form.php");
	class phpapps_admin_applications_form_impl  extends phpapps_admin_applications_form{
                public function __construct() {
                    parent::__construct();
                //}
                
		//function phpapps_admin_applications_form_impl(){
                    
			$this->template = "phpapps_admin_applications_form_imp.tpl";
			
			if ($_SERVER['REQUEST_METHOD'] === 'POST'){
				if($_POST["BASE_DIR"] != ""){
					$this->create_dir_struct();
				}
			}
			
			$this->init();
			$this->display();
		}
		
		function create_dir_struct(){
			$structures[] = $_POST["BASE_DIR"] . $_POST["APP_NAME"];
			$structures[] = $_POST["BASE_DIR"] . $_POST["APP_NAME"] . DIR_SEP . "gen_php";
			$structures[] = $_POST["BASE_DIR"] . $_POST["APP_NAME"] . DIR_SEP . "tpl/gen_tpl";
			$structures[] = $_POST["BASE_DIR"] . $_POST["APP_NAME"] . DIR_SEP . "css";
			$structures[] = $_POST["BASE_DIR"] . $_POST["APP_NAME"] . DIR_SEP . "js";
			$structures[] = $_POST["BASE_DIR"] . $_POST["APP_NAME"] . DIR_SEP . "imgs";
			$structures[] = $_POST["BASE_DIR"] . $_POST["APP_NAME"] . DIR_SEP . "users_data";
			foreach ($structures as $structure){
				if (!file_exists($structure)) {
					if (!mkdir($structure, 0777, true)) {
						die('Failed to create folders...');
						//echo $structure;
						//exit;
					}
				}
			}
		}
		
	};
	
	$phpapps_admin_applications_form_Impl = new phpapps_admin_applications_form_impl();
	//$phpapps_admin_applications_form_Impl->globals->con->print_log();
?>