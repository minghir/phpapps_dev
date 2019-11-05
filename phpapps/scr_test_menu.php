<?php
require_once ("globals.php");
require_once(DB_LIBS_DIR . 'DB_menu.php');
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class scr_test_menu extends phpapps_display_abs{

    private $app_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->layout = PHPAPPS_LAYOUTS_DIR . "default.lay";
        $this->tpl = "scr_test_menu.tpl";        
        $this->app_id = $app_id;
        
       
        
        global $GLOBALS_OBJ;
		$this->globals = $GLOBALS_OBJ;
		$this->globals->con->select_db("phpapps");
		
		$sql = new DB_query("SELECT 	ID, 
						APP_NAME, 
						APP_TITLE, 
						DESCRIPTION, 
						APP_DATE, 
						(SELECT USERNAME FROM users WHERE users.ID = USER_ID) AS USERNAME
						FROM phpapps.applications ORDER BY ID ASC");
				
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
					FROM phpapps.view_modules WHERE APP_ID = :app_id ORDER BY ID ASC",array(':app_id'=>$res["ID"]));
					
				$this->globals->con->query($sql,"modules");	
				while($res_mod=$this->globals->con->fetch_array("modules")){
					$modules[$res["ID"]][] = $res_mod;
				}
		}
		$this->globals->sm->assign("rows",$rows);
		$this->globals->sm->assign("modules",$modules);
        
       
        
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "scr_test_menu: Youre code here."));
        
        $this->displayTpl();
    }
}

new scr_test_menu($_GET["app_id"]);
?>