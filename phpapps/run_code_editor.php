<?php
	require_once ("globals.php");
	require_once ("libs/code_editor.php");
	class run_code_editor{
		
		private $globals;
		private $file_path;
		
		function __construct(){
		
			global $GLOBALS_OBJ;
			$this->globals = $GLOBALS_OBJ;
			
			
			switch($_GET["gact"]){
				case "editImpPhp":
					$sql = new DB_query("SELECT FORM_NAME,APP_NAME FROM phpapps.view_forms WHERE ID  = :id ",array(":id"=>$_GET["gfield_value"]));
					$this->globals->con->query($sql);
					$this->globals->con->next();
					$this->file_path = GLOBALS_DIR . $this->globals->con->get_field("APP_NAME") . DIR_SEP .$this->globals->con->get_field("FORM_NAME") . "_imp.php";
				break;
				case "editImpTpl":
					$sql = new DB_query("SELECT FORM_NAME,APP_NAME FROM phpapps.view_forms WHERE ID = :id ",array(":id"=>$_GET["gfield_value"]));
					$this->globals->con->query($sql);
					$this->globals->con->next();
					$this->file_path = GLOBALS_DIR . $this->globals->con->get_field("APP_NAME") . DIR_SEP ."tpl" . DIR_SEP . $this->globals->con->get_field("FORM_NAME") . "_imp.tpl";
				break;
				
				case "editScriptPhp":
					$sql = new DB_query("SELECT SCRIPT_NAME,APP_NAME FROM phpapps.view_scripts WHERE ID = :id ",array(":id"=>$_GET["gfield_value"]));
					$this->globals->con->query($sql);
					$this->globals->con->next();
					$this->file_path = GLOBALS_DIR . $this->globals->con->get_field("APP_NAME") . DIR_SEP .$this->globals->con->get_field("SCRIPT_NAME") . ".php";
				break;
				case "editScriptTpl":
					$sql = new DB_query("SELECT SCRIPT_NAME,APP_NAME FROM phpapps.view_scripts WHERE ID = :id ",array(":id"=>$_GET["gfield_value"]));
					$this->globals->con->query($sql);
					$this->globals->con->next();
					$this->file_path = GLOBALS_DIR . $this->globals->con->get_field("APP_NAME") . DIR_SEP ."tpl" . DIR_SEP . $this->globals->con->get_field("SCRIPT_NAME") . ".tpl";
				break;
			}
			$ce = new code_editor($this->file_path);
			$ce->display();
		}
	}	

	$ce = new run_code_editor();
	
?>