<?php
	require_once ("globals.php");
	
 	class run_php_script{
		var $globals;
		var $FORM_ID;
		var $script_type; // imp or grid
		
		var $script_name;
		var $script_path;
		
		function __construct(){
			global $GLOBALS_OBJ;
			$this->globals = $GLOBALS_OBJ;
		}
		
		function init(){
			
			switch($this->script_type){
				case "runFormImp":
					$sql = new DB_query("SELECT FORM_PHP_DIR,FORM_NAME,APP_NAME FROM view_forms 
						WHERE ID = :id  AND MODULE_ID = :module_id",
						array(":id"=>$_GET["gfield_value"],":module_id" => $_GET["module_id"]));
					$this->globals->con->query($sql);	
					$this->globals->con->next();
					$this->script_name = $this->globals->con->get_field("FORM_NAME") . "_imp.php";
					$this->script_path = WEB_BASE_DIR  . $this->globals->con->get_field("APP_NAME") . '/' . $this->script_name;
				break;
				case "runScript":
					$sql = new DB_query("SELECT SCRIPT_NAME,APP_NAME FROM phpapps.view_scripts WHERE ID = :id",array(":id"=>$_GET["gfield_value"]));
					$this->globals->con->query($sql);
					$this->globals->con->next();
					$this->script_path = WEB_BASE_DIR . $this->globals->con->get_field("APP_NAME") . '/' .$this->globals->con->get_field("SCRIPT_NAME") . ".php";
				break;
			}
			
			
//			$this->run_script();
			//header("Location:". $this->script_path);
			//exit;
			
			 
			
			
		}
/*		
		function run_php_script($form_id){
				$this->FORM_ID = $form_id;
				//$this->init();
		}
*/		
		function run_script(){
			header("Location:".$this->script_path);
			exit;
		}
			
	};
	//print_r($_GET);
	//$tmp = array_flip($_GET);
	$aa = new run_php_script($_GET["gfield_value"]);
	$aa->script_type = $_GET["gact"];
	$aa->init();
	$aa->run_script();
	
?>