<?php
namespace wabdo;
use Smarty;

require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "custom_element.php");

class {$CLASS_NAME} extends custom_element{ldelim}
    public $globals;

    public $ID = {$CUSTOM_ELEMENT_ID};
    public $CUSTOM_ELEMENT_NAME  = "{$CLASS_NAME}";
    public $APP_ID  = {$APP_ID};
    public $APP_NAME = "{$APP_NAME}";
    
    public $smarty;
    
    function __construct() {ldelim}
        global $GLOBALS_OBJ;
        $this->globals = &$GLOBALS_OBJ;
        
        $this->tpl = "{$CLASS_NAME}";        
        
        $this->smarty = new Smarty;
        $this->smarty->template_dir = CURRENT_APP_TPL_DIR ."custom_elements" . DIR_SEP;
        $this->smarty->compile_dir = SMARTY_COMPILE_DIR;
        
    {rdelim}
    
    function get_custom_element_str(){ldelim}
        return parent::get_custom_element_str();
    {rdelim}
{rdelim}
?>