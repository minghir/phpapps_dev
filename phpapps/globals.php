<?php

if(!defined('DIR_SEP')) {
	define('DIR_SEP', DIRECTORY_SEPARATOR);
}
			
if (!defined('WEB_BASE_DIR')) { // pt link-uri
        define('WEB_BASE_DIR', 'http://' . $_SERVER["HTTP_HOST"] . '/phpapps_dev/');
}			
			
if (!defined('GLOBALS_DIR')) { //pt fwrite
	define('GLOBALS_DIR', $_SERVER["DOCUMENT_ROOT"] . DIR_SEP . 'phpapps_dev' . DIR_SEP);
}


if (!defined('PHPAPPS_APP_DIR')) {
	define('PHPAPPS_APP_DIR', GLOBALS_DIR . 'phpapps' . DIR_SEP);
}

if (!defined('PHPAPPS_TPL_DIR')) {
	define('PHPAPPS_TPL_DIR', PHPAPPS_APP_DIR . 'tpl' . DIR_SEP);
}

if (!defined('PHPAPPS_LIBS_DIR')) {
	define('PHPAPPS_LIBS_DIR', PHPAPPS_APP_DIR . 'libs' . DIR_SEP);
}

if (!defined('PHPAPPS_LIBS_TPL_DIR')) {
	define('PHPAPPS_LIBS_TPL_DIR', PHPAPPS_LIBS_DIR . 'tpl' . DIR_SEP);
}

if (!defined('DB_LIBS_DIR')) {
	define('DB_LIBS_DIR', PHPAPPS_LIBS_DIR . 'DB' . DIR_SEP);
}

if (!defined('DB_LIBS_TPL_DIR')) {
	define('DB_LIBS_TPL_DIR', DB_LIBS_DIR . 'tpl' . DIR_SEP);
}

if (!defined('_3RDPARTY_DIR')) {
	define('_3RDPARTY_DIR', PHPAPPS_APP_DIR . '3rd_party' . DIR_SEP);
}

if (!defined('SMARTY_LIBS_DIR')) {
	define('SMARTY_LIBS_DIR', _3RDPARTY_DIR . 'smarty-3.1.30'. DIR_SEP .'libs'  . DIR_SEP);
}

if (!defined('PHPAPPS_SMARTY_TPL_DIR')) {
	define('PHPAPPS_SMARTY_TPL_DIR', PHPAPPS_APP_DIR . 'tpl' . DIR_SEP);
}

if (!defined('SMARTY_COMPILE_DIR')) {
	define('SMARTY_COMPILE_DIR', PHPAPPS_APP_DIR . 'tpl_c' . DIR_SEP);
}

if (!defined('PHPEXCEL_LIBS_DIR')) {
	define('PHPEXCEL_LIBS_DIR', _3RDPARTY_DIR . 'PHPExcel.v1.8.0/Classes' . DIR_SEP);
}

if (!defined('CODEMIRROR_DIR')) {
	define('CODEMIRROR_DIR', WEB_BASE_DIR . 'phpapps/3rd_party/JS/codemirror-5.19.0');
}

//jquery 
if (!defined('JQUERY_FILE')) {
	define('JQUERY_FILE', WEB_BASE_DIR . 'phpapps/3rd_party/JS/jquery-1.11.3.min.js');
}

if (!defined('JQUERY_UI')) {
	define('JQUERY_UI', WEB_BASE_DIR . 'phpapps/3rd_party/JS/jquery-ui-1.11.4/jquery-ui.js');
}

if (!defined('PHPAPPS_CSS_DIR')) {
	define('PHPAPPS_CSS_DIR', PHPAPPS_APP_DIR . 'css' . DIR_SEP);
}

if (!defined('PHPAPPS_JS_DIR')) {
	define('PHPAPPS_JS_DIR', PHPAPPS_APP_DIR . 'js' . DIR_SEP);
}


require_once('auth.php');
	

class Globals{
	//public $JQUERY_PATH = "js\jquery-ui-1.10.3";
	public $con;
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

	function __construct($APP_NM){
		$this->APP_NAME = $APP_NM;

		$this->set_paths();
		
		require_once(PHPAPPS_APP_DIR . 'auth.php');
		require_once(DB_LIBS_DIR . 'DB_PDO.php');
		require_once(SMARTY_LIBS_DIR . 'Smarty.class.php');
		
		date_default_timezone_set('UTC');
		//session_start();
		$this->con = new DB(DB_LIBS_DIR . "DB_cfg.php");
		$this->con->set_log($log_type="file",$log_dir="tmp/aa.html",$debug=true);
		$this->con->clear_log();
		$this->con->connect("mysql");
			
		$this->sm = new Smarty;
		$this->sm->template_dir = PHPAPPS_SMARTY_TPL_DIR;
		$this->sm->compile_dir = SMARTY_COMPILE_DIR;
		//$this->sm->config_dir = 'configs/';
		//$this->sm->cache_dir = 'cache/';
		$this->smarty_assign();
		
		$this->DB_sm = new Smarty;
		$this->DB_sm->template_dir = DB_LIBS_TPL_DIR;
		$this->DB_sm->compile_dir = SMARTY_COMPILE_DIR;
		//$this->DB_sm->config_dir = 'configs/';
		//$this->DB_sm->cache_dir = 'cache/';
		//$this->DB_smarty_assign();
	}
	
	function set_paths(){
			
		$this->__APP_DIR = GLOBALS_DIR . $this->APP_NAME . DIR_SEP;
		$this->__JS_DIR = $this->__APP_DIR . 'js' . DIR_SEP;
		$this->__CSS_DIR = $this->__APP_DIR . 'css' . DIR_SEP;
		$this->__LIBS_DIR = $this->__APP_DIR . 'libs' . DIR_SEP;
		$this->__LIBS_TPL_DIR =  $this->__LIBS_DIR . 'tpl' . DIR_SEP;
		$this->__SMARTY_TPL_DIR = $this->__APP_DIR . 'tpl' . DIR_SEP;
	}
	
	function smarty_assign(){
		$this->sm->assign(array(
				"JQUERY_PATH" => $this->JQUERY_PATH,
			));
	}
	
	function setSchema($schm){
		$this->schema = $schm;
		$this->con->select_db($schm);
	}
};

$GLOBALS_OBJ = new Globals("phpapps");

?>
