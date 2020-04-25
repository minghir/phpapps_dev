<?php
require_once ("globals.php");
//require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class custom_element_2 {//extends phpapps_display_abs{

    public $ID;
    public $CUSTOM_ELEMENT_ID;
    public $CUSTOM_ELEMENT_NAME;
    public $APP_ID;
    public $APP_NAME;
    public $globals;
    public $tpl;
    
    public $smarty;
    function __construct() {
        //parent::__construct();
        global $GLOBALS_OBJ;
        $this->globals = &$GLOBALS_OBJ;
        
        $this->tpl =   "custom_element_2";        
        $this->APP_ID = 1;
        $this->APP_NAME = "phpapps";
        $this->ID = $this->CUSTOM_ELEMENT_ID = 27;
        $this->CUSTOM_ELEMENT_NAME = "custom_element_2";
        
        $this->smarty = new Smarty;
        $this->smarty->template_dir = PHPAPPS_TPL_DIR ."custom_elements" . DIR_SEP;
        $this->smarty->compile_dir = SMARTY_COMPILE_DIR;
        
        
    }
    
    function get_custom_element_str(){
        $this->smarty->assign(array("CUSTOM_ELEMENT"=>$this));
        //echo "<h1>". returnez
	return $this->smarty->fetch($this->tpl . '.tpl');
    }
}
?>