<?php
require_once ("globals.php");
//include ("libs/code_editor.php");
include ("gen_php/phpapps_admin_scripts_form.php");
	class phpapps_admin_scripts_form_impl  extends phpapps_admin_scripts_form{
		public $app_name;
	
		function __construct(){
			global $GLOBALS_OBJ;
			$this->globals = $GLOBALS_OBJ;
			$this->MODULE_ID = $_GET["module_id"];
			$sql = new DB_query("SELECT 
						APP_NAME 
						FROM phpapps.view_modules 
						WHERE ID = :module_id", array(":module_id" => $this->MODULE_ID));
			$this->globals->con->query($sql);
			$this->globals->con->next();
			$this->app_name = $this->globals->con->get_field("APP_NAME");
			$this->template = "phpapps_admin_scripts_form_imp.tpl";
			$this->init();
			$this->display();
		}
		
		function afterAddRec(){
			$this->globals->sm->assign(array(
				"CLASS_NAME" => $this->SCRIPT_NAME,
			));
			
			$php_content = $this->globals->sm->fetch('php_new_script_template.tpl');
			$php_file_name = $this->SCRIPT_NAME . ".php";
			$php_file_path = GLOBALS_DIR . $this->app_name . DIR_SEP . $php_file_name;
			if(!file_exists($php_file_path)){
				$fp = fopen($php_file_path, 'w');
				fwrite($fp, $php_content);
				fclose($fp);
			}else{
				$this->errors[] = "PHP SCRIPT FILE EXISTS!";
			}
			
			$tpl_content = $this->globals->sm->fetch('tpl_new_script_template.tpl');
			$tpl_file_name = $this->SCRIPT_NAME . ".tpl";
			$tpl_file_path = GLOBALS_DIR . $this->app_name . DIR_SEP . "tpl" . DIR_SEP . $tpl_file_name;
			if(!file_exists($tpl_file_path)){
				$ft = fopen($tpl_file_path, 'w');
				fwrite($ft, $tpl_content);
				fclose($ft);
			}else{
				$this->errors[] = "TPL SCRIPT FILE EXISTS!";
			}
		}
		
		function beforeDeleteRec(){
                        $this->getRec();
                        if( !( unlink($this->SCRIPT_NAME . ".php") && unlink("tpl" . DIR_SEP . $this->SCRIPT_NAME . ".tpl") ) ){
                            $this->errors[] = "FILES UNLINK FAILD !!!!";
                        }
		}
	}
	$phpapps_admin_scripts_form_Impl = new phpapps_admin_scripts_form_impl();
?>