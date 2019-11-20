<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");
require_once(DB_LIBS_DIR . 'DB_menu.php');
class phpapps_applications extends phpapps_display_abs{
	
	public function __construct($uid){
             parent::__construct();
               // $this->layout = PHPAPPS_LAYOUTS_DIR . "phpapps.lay";
		//global $GLOBALS_OBJ;
		//$this->globals = $GLOBALS_OBJ;
		$this->globals->con->select_db("phpapps");
		
		$sql = new DB_query("SELECT 	ID, 
						APP_NAME, 
						APP_TITLE, 
						DESCRIPTION, 
						APP_DATE, 
						(SELECT USERNAME FROM users WHERE users.ID = USER_ID) AS USERNAME
						FROM phpapps.applications");
				
		//$this->globals->con->query($sql->sql());	
		$this->globals->con->query($sql);	
		while($res=$this->globals->con->fetch_array()){
			$rows[] = $res;
			$sql = new DB_query("SELECT 
						ID,
						MODULE_NAME,
						MODULE_TITLE,
						DESCRIPTION,
						SCRIPT_NAME,
                                                CONCAT('".WEB_BASE_DIR."' ,APP_NAME,'/',SCRIPT_NAME) AS SCRIPT_PATH
					FROM phpapps.view_modules WHERE APP_ID = :app_id ORDER BY MODULE_NAME",array(':app_id'=>$res["ID"]));
				
				$this->globals->con->query($sql,"modules");	
				while($res_mod=$this->globals->con->fetch_array("modules")){
					$modules[$res["ID"]][] = $res_mod;
				}
		}
		$this->globals->sm->assign("rows",$rows);
		$this->globals->sm->assign("modules",$modules);
	}
	
	public function displayTpl(){
                $this->setupLayoutElements();
		$this->globals->sm->display("phpapps_admin_applications.tpl");
	}
};

$aa  = new phpapps_applications('1');
$aa->displayTpl();
?>