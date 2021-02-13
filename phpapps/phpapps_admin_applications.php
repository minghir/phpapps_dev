<?php
namespace wabdo;

require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");
require_once(DB_LIBS_DIR . 'DB_menu.php');

class phpapps_applications extends template{
	
         protected $display_objects_id = 163;
        protected $display_objects_type_id = '2';
    	protected $display_objects_type = 'SCRIPT';
	//public $script_id = 163;
	public function __construct($uid){
             parent::__construct();
               // $this->layout = PHPAPPS_LAYOUTS_DIR . "{$this->globals->PHPAPPS_DB}.lay";
		//global $GLOBALS_OBJ;
		//$this->globals = $GLOBALS_OBJ;
		$this->globals->con->select_db($this->globals->PHPAPPS_DB);
		
		$sql = new DB_query("SELECT 	ID, 
						APP_NAME, 
						APP_TITLE, 
						DESCRIPTION, 
						APP_DATE, 
						(SELECT USERNAME FROM users WHERE users.ID = USER_ID) AS USERNAME
						FROM {$this->globals->PHPAPPS_DB}.applications");
				
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
					FROM {$this->globals->PHPAPPS_DB}.view_modules WHERE APP_ID = :app_id ORDER BY MODULE_NAME",array(':app_id'=>$res["ID"]));
				
				$this->globals->con->query($sql,"modules");	
				while($res_mod=$this->globals->con->fetch_array("modules")){
					$modules[$res["ID"]][] = $res_mod;
				}
		}
		$this->globals->sm->assign("rows",$rows);
		$this->globals->sm->assign("modules",$modules);
		$this->load_elements();
	}
	
	public function display_tpl(){
            
               // $this->setupLayoutElements();
               
		$this->globals->sm->display("phpapps_admin_applications.tpl");
	}
};

$aa  = new phpapps_applications('1');
$aa->display_tpl();
?>