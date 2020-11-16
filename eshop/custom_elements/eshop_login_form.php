<?php
namespace wabdo;
use Smarty;

require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "custom_element.php");

class eshop_login_form extends custom_element{
    public $globals;

    public $ID = 41;
    public $CUSTOM_ELEMENT_NAME  = "eshop_login_form";
    public $APP_ID  = 7;
    public $APP_NAME = "eshop";
    
    public $smarty;
    
    function __construct() {
        global $GLOBALS_OBJ;
        $this->globals = &$GLOBALS_OBJ;
        
        $this->tpl = "eshop_login_form";        
        
        $this->smarty = new Smarty;
        $this->smarty->template_dir = CURRENT_APP_TPL_DIR ."custom_elements" . DIR_SEP;
        $this->smarty->compile_dir = SMARTY_COMPILE_DIR;
        
    }
    
    function get_custom_element_str(){
        return parent::get_custom_element_str();
    }
}
?>