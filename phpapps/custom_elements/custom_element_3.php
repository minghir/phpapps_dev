<?php
require_once ("globals.php");

class custom_element_3 {
    public $globals;

    public $ID;
    public $CUSTOM_ELEMENT_ID;
    public $CUSTOM_ELEMENT_NAME;
    public $APP_ID;
    public $APP_NAME;
    
    private $smarty;
    
    function __construct() {
        global $GLOBALS_OBJ;
        $this->globals = &$GLOBALS_OBJ;
        
        $this->tpl = "custom_element_3";        
        $this->APP_ID = 1;
        $this->APP_NAME = "phpapps";
        $this->ID = $this->CUSTOM_ELEMENT_ID = 33;
        $this->CUSTOM_ELEMENT_NAME = "custom_element_3";
        
        $this->smarty = new Smarty;
        $this->smarty->template_dir = CURRENT_APP_TPL_DIR ."custom_elements" . DIR_SEP;
        $this->smarty->compile_dir = SMARTY_COMPILE_DIR;
    }
    
    function get_custom_element_str(){
        $this->smarty->assign(array("CUSTOM_ELEMENT"=>$this));
	return $this->smarty->fetch($this->tpl . '.tpl');
    }
}
?>