<?php
namespace wabdo;
if (!defined('_3RDPARTY_DIR')) {
	//define('_3RDPARTY_DIR', PHPAPPS_APP_DIR . '3rd_party' . DIR_SEP);
    define('_3RDPARTY_DIR', GLOBALS_DIR . 'vendor' . DIR_SEP);
}

if (!defined('SMARTY_LIBS_DIR')) {
	//define('SMARTY_LIBS_DIR', _3RDPARTY_DIR . 'smarty-3.1.35'. DIR_SEP .'libs'  . DIR_SEP);
    define('SMARTY_LIBS_DIR', _3RDPARTY_DIR . 'smarty'. DIR_SEP .'smarty' . DIR_SEP . 'libs'  . DIR_SEP);
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
    define('CODEMIRROR_DIR', WEB_BASE_DIR . 'vendor/codemirror-5.52.2');
    //define('CODEMIRROR_DIR', WEB_BASE_DIR . 'phpapps/3rd_party/codemirror.next-master');
}

//jquery 
if (!defined('JQUERY_PATH')) {
	define('JQUERY_PATH', WEB_BASE_DIR . 'phpapps/3rd_party/JS/jquery');
}

if (!defined('JQUERY_FILE')) {
	define('JQUERY_FILE', JQUERY_PATH . '/jquery-3.5.0.min.js');
}

if (!defined('JQUERY_UI')) {
	define('JQUERY_UI',JQUERY_PATH . '/jquery-ui-1.12.1/jquery-ui.js');
}

if (!defined('JQUERY_UI_CSS')) {
	define('JQUERY_UI_CSS',JQUERY_PATH . '/jquery-ui-1.12.1/jquery-ui.css');
}

// bootstrap
if (!defined('BOOTSTRAP_PATH')) {
	//define('BOOTSTRAP_PATH', WEB_BASE_DIR . 'phpapps/3rd_party/bootstrap-4.0.0-dist');
    define('BOOTSTRAP_PATH', 'https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css');
}
?>