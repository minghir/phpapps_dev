<?php
namespace wabdo;
use Smarty;
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "custom_element.php");

class custom_element_4 extends custom_element{
    public $globals;

    public $ID = 37;
    public $CUSTOM_ELEMENT_NAME  = "custom_element_4";
    public $APP_ID  = 1;
    public $APP_NAME = "phpapps";
    
    public $smarty;
    
    function __construct() {
        global $GLOBALS_OBJ;
        $this->globals = &$GLOBALS_OBJ;
        
        $this->tpl = "custom_element_4";        

        
        $this->smarty = new Smarty;
        $this->smarty->template_dir = CURRENT_APP_TPL_DIR ."custom_elements" . DIR_SEP;
        $this->smarty->compile_dir = SMARTY_COMPILE_DIR;
        
    }
    
    function get_custom_element_str(){
        return parent::get_custom_element_str();
    }
}
?>