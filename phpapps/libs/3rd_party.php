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
	define('CODEMIRROR_DIR', WEB_BASE_DIR . 'phpapps/3rd_party/JS/codemirror-5.30.0');
}

//jquery 
if (!defined('JQUERY_FILE')) {
	define('JQUERY_FILE', WEB_BASE_DIR . 'phpapps/3rd_party/JS/jquery-1.11.3.min.js');
}

if (!defined('JQUERY_UI')) {
	define('JQUERY_UI', WEB_BASE_DIR . 'phpapps/3rd_party/JS/jquery-ui-1.11.4/jquery-ui.js');
}
?>