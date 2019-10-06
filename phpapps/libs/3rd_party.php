<?php
if (!defined('_3RDPARTY_DIR')) {
	define('_3RDPARTY_DIR', PHPAPPS_APP_DIR . '3rd_party' . DIR_SEP);
}

if (!defined('SMARTY_LIBS_DIR')) {
	define('SMARTY_LIBS_DIR', _3RDPARTY_DIR . 'smarty-3.1.33'. DIR_SEP .'libs'  . DIR_SEP);
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
	//define('CODEMIRROR_DIR', WEB_BASE_DIR . 'phpapps/3rd_party/JS/codemirror-5.46.0');
    define('CODEMIRROR_DIR', WEB_BASE_DIR . 'phpapps/3rd_party/JS/codemirror-5.49.0');
}

//jquery 
if (!defined('JQUERY_PATH')) {
	define('JQUERY_PATH', WEB_BASE_DIR . 'phpapps/3rd_party/JS/jquery');
}

if (!defined('JQUERY_FILE')) {
	define('JQUERY_FILE', JQUERY_PATH . '/jquery-3.4.1.js');
}

if (!defined('JQUERY_UI')) {
	define('JQUERY_UI',JQUERY_PATH . '/jquery-ui-1.12.1/jquery-ui.js');
}

if (!defined('JQUERY_UI_CSS')) {
	define('JQUERY_UI_CSS',JQUERY_PATH . '/jquery-ui-1.12.1/jquery-ui.css');
}
?>