<?php
namespace wabdo;
use Smarty;
session_start();
//error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING & ~E_STRICT );
error_reporting(E_ALL & ~E_NOTICE  );
//error_reporting(E_ALL  );
if(!defined('CURRENT_APP')) {
	define('CURRENT_APP', 'phpapps');
}

if(!defined('DIR_SEP')) {
	define('DIR_SEP', DIRECTORY_SEPARATOR);
}

if (!defined('SERVER_HOST_NAME')) { // pt link-uri
        define('SERVER_HOST_NAME', 'http://' . $_SERVER["HTTP_HOST"] );
}	

if (!defined('WEB_BASE_DIR')) { // pt link-uri
        define('WEB_BASE_DIR', 'http://' . $_SERVER["HTTP_HOST"] . '/phpapps_dev/');
}			

if (!defined('WEB_APP_DIR')) { // pt link-uri
        define('WEB_APP_DIR', WEB_BASE_DIR . CURRENT_APP . "/");
}
/*
if (!defined('_3RDPARTY_WEB_DIR')) {
	define('_3RDPARTY_WEB_DIR', WEB_BASE_DIR . 'phpapps/3rd_party/');
}
*/			
if (!defined('GLOBALS_DIR')) { //pt fwrite
	define('GLOBALS_DIR', $_SERVER["DOCUMENT_ROOT"] . DIR_SEP . 'phpapps_dev' . DIR_SEP);
}

if (!defined('PHPAPPS_APP_DIR')) {
	define('PHPAPPS_APP_DIR', GLOBALS_DIR . 'phpapps' . DIR_SEP);
}

if (!defined('CURRENT_APP_DIR')) {
	define('CURRENT_APP_DIR', GLOBALS_DIR . CURRENT_APP . DIR_SEP);
}

if (!defined('CURRENT_APP_TPL_DIR')) {
	define('CURRENT_APP_TPL_DIR', CURRENT_APP_DIR . 'tpl' . DIR_SEP);
}

if (!defined('CURRENT_APP_LAYOUTS_DIR')) {
	define('CURRENT_APP_LAYOUTS_DIR', CURRENT_APP_TPL_DIR . 'layouts' . DIR_SEP);
}

if (!defined('PHPAPPS_TPL_DIR')) {
	define('PHPAPPS_TPL_DIR', PHPAPPS_APP_DIR . 'tpl' . DIR_SEP);
}

if (!defined('PHPAPPS_LAYOUTS_DIR')) {
	define('PHPAPPS_LAYOUTS_DIR', PHPAPPS_TPL_DIR . 'layouts' . DIR_SEP);
}

if (!defined('PHPAPPS_LIBS_DIR')) {
	define('PHPAPPS_LIBS_DIR', PHPAPPS_APP_DIR . 'libs' . DIR_SEP);
}

if (!defined('PHPAPPS_LIBS_TPL_DIR')) {
	define('PHPAPPS_LIBS_TPL_DIR', PHPAPPS_LIBS_DIR . 'tpl' . DIR_SEP);
}

if (!defined('CURRENT_APP_LIBS_DIR')) {
	define('CURRENT_APP_LIBS_DIR', CURRENT_APP_DIR . 'libs' . DIR_SEP);
}

if (!defined('CURRENT_APP_LIBS_TPL_DIR')) {
	define('CURRENT_APP_LIBS_TPL_DIR', CURRENT_APP_LIBS_DIR . 'tpl' . DIR_SEP);
}

if (!defined('DB_LIBS_DIR')) {
	define('DB_LIBS_DIR', PHPAPPS_LIBS_DIR . 'DB' . DIR_SEP);
}

if (!defined('DB_LIBS_TPL_DIR')) {
	define('DB_LIBS_TPL_DIR', DB_LIBS_DIR . 'tpl' . DIR_SEP);
}

if (!defined('PHPAPPS_CSS_DIR')) {
	define('PHPAPPS_CSS_DIR', WEB_BASE_DIR . 'phpapps/css/');
}

if (!defined('PHPAPPS_JS_DIR')) {
	define('PHPAPPS_JS_DIR', WEB_BASE_DIR . 'phpapps/js/');
}

if (!defined('CURRENT_APP_CSS_DIR')) {
	define('CURRENT_APP_CSS_DIR', WEB_BASE_DIR . CURRENT_APP . '/css/');
}

if (!defined('CURRENT_APP_JS_DIR')) {
	define('CURRENT_APP_JS_DIR', WEB_BASE_DIR . CURRENT_APP . '/js/');
}

//if (!defined('CURRENT_APP_USER_DATA_DIR')) {
//	define('CURRENT_APP_USER_DATA_DIR', CURRENT_APP_DIR . '/user_data/');
//}

require_once(PHPAPPS_LIBS_DIR . '3rd_party.php');
//require_once(PHPAPPS_LIBS_DIR . "user_profile.php");

class Globals_obj{
	//public $JQUERY_PATH = "js\jquery-ui-1.10.3";
	public $con; // mysql
	public $con2; // oracle
	public $sm;
	public $DB_sm;
	public $schema;
	public $APP_NAME;
	public $__APP_DIR;
	public $__JS_DIR;
	public $__CSS_DIR;
	public $__LIBS_DIR;
	public $__LIBS_TPL_DIR;
	public $__SMARTY_TPL_DIR;
        
        //Directories vars
        public $PHPAPPS_APP_DIR = PHPAPPS_APP_DIR;
        
               
        public $ath;
        public $USER_ID;
        public $USER_PROFILE_ID;
        public $USER_PROFILE;

	function __construct($APP_NM){
                
                
                
                
                //$this->$USER_PROFILE = new user_profile($this);
            
		$this->APP_NAME = $APP_NM;

		//$this->set_paths();
		
		require_once(PHPAPPS_LIBS_DIR . 'phpapps_upload.php');
                require_once(PHPAPPS_LIBS_DIR . 'user_profile.php');
		require_once(DB_LIBS_DIR . 'DB_PDO.php');
		require_once(SMARTY_LIBS_DIR . 'Smarty.class.php');
                require_once(PHPAPPS_LIBS_DIR . 'auth.php');
		
		date_default_timezone_set('UTC');
		
		$this->con = new DB(DB_LIBS_DIR . "DB_cfg.php");
		$this->con->set_log($log_type="file",$log_dir="tmp/aa.html",$debug=false);
		$this->con->clear_log();
                
		if(!$this->con->connect("mysql")){
                    echo "CHECK DB CONNECTION!";
                    echo $this->con->get_error();
                    exit();
                }
                
                $this->con->query(new DB_query("SELECT 7 + 3 AS TEST FROM dual"));
                $this->con->next();
                if( $this->con->get_field("TEST") != 10 ){
                    echo "SQL TEST NOT ok<br>";
                    echo $this->con->get_error();
                    exit();
                }

                $sql = new DB_query('SET character_set_client="utf8",character_set_connection="utf8",character_set_results="utf8";');
                $this->con->query($sql);
		
		/*
		$this->con2 = new DB(DB_LIBS_DIR . "DB_cfg.php");
		$this->con2->set_log($log_type="file",$log_dir="tmp/aa.html",$debug=false);
		$this->con2->clear_log();
		if(!$this->con2->connect("oracle")){
                    echo "CHECK DB CONNECTION!";
                    echo $this->con->get_error();
                    exit();
                }
                $this->con2->query(new DB_query("SELECT 7 + 3 AS TEST FROM dual"));
                $this->con2->next();
                if( $this->con2->get_field("TEST") != 10 ){
                    echo "SQL TEST NOT ok<br>";
                    echo $this->con2->get_error();
                    exit();
                }
                */
                 
	//print_r($this->con2);
	//print_r($this->con);	
		$this->sm = new Smarty;
		//$this->sm->template_dir = PHPAPPS_SMARTY_TPL_DIR;
                $this->sm->template_dir = CURRENT_APP_TPL_DIR;
		$this->sm->compile_dir = SMARTY_COMPILE_DIR;
		//$this->sm->config_dir = 'configs/';
		//$this->sm->cache_dir = 'cache/';
		//$this->smarty_assign();
		
		$this->DB_sm = new Smarty;
		$this->DB_sm->template_dir = DB_LIBS_TPL_DIR;
		$this->DB_sm->compile_dir = SMARTY_COMPILE_DIR;
		//$this->DB_sm->config_dir = 'configs/';
		//$this->DB_sm->cache_dir = 'cache/';
		//$this->DB_smarty_assign();
                
                $this->ath = new auth($this);
                $this->ath->authenticate();
	}
	
        /*
	function set_paths(){
            
		$this->__APP_DIR = GLOBALS_DIR . $this->APP_NAME . DIR_SEP;
		$this->__JS_DIR = $this->__APP_DIR . 'js' . DIR_SEP;
		$this->__CSS_DIR = $this->__APP_DIR . 'css' . DIR_SEP;
		$this->__LIBS_DIR = $this->__APP_DIR . 'libs' . DIR_SEP;
		$this->__LIBS_TPL_DIR =  $this->__LIBS_DIR . 'tpl' . DIR_SEP;
		$this->__SMARTY_TPL_DIR = $this->__APP_DIR . 'tpl' . DIR_SEP;
	}
         * 
         */
        
	/*
	function smarty_assign(){
		$this->sm->assign(array(
				//"JQUERY_PATH" => $this->JQUERY_PATH,
			));
	}
	
	function set_schema($schm){
		$this->schema = $schm;
		$this->con->select_db($schm);
	}
         * 
         */
};

?>
