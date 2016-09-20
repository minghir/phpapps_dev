<?php
require_once ("globals.php");

class phpapps_applications{
	
	public function phpapps_applications($uid){
		global $GLOBALS_OBJ;
		$this->globals = $GLOBALS_OBJ;
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
						SCRIPT_NAME
					FROM phpapps.view_modules WHERE APP_ID = :app_id",array(':app_id'=>$res["ID"]));
					
				$this->globals->con->query($sql,"modules");	
				while($res_mod=$this->globals->con->fetch_array("modules")){
					$modules[$res["ID"]][] = $res_mod;
				}
		}
		$this->globals->sm->assign("rows",$rows);
		$this->globals->sm->assign("modules",$modules);
	}
	
	public function displayTpl(){
		$this->globals->sm->display("phpapps_admin_applications.tpl");
	}
};

$aa  = new phpapps_applications('1');
$aa->displayTpl();
?>