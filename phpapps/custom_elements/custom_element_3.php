<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "custom_element.php");

class custom_element_3 extends custom_element{ 
    public $globals;

    public $ID;
    public $CUSTOM_ELEMENT_ID = 33;
    public $CUSTOM_ELEMENT_NAME;
    public $APP_ID;
    public $APP_NAME;
    public $display_objects_type = 'CUSTOM_ELEMENT';
    public $display_objects_type_id = '4';
    public $display_objects_id = 33;
     
    //private $smarty;
    
    function __construct() {
        parent::__construct();
        
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
        
        //$this->loadElements();
        //print_r($this->display_elements);
        //echo $this->display_elements['menus']['TEST_CM']->get_menu_str();
    //    $this->displayTpl();
    }
    
    function get_custom_element_str(){
       return parent::get_custom_element_str();
    }
    /*
    function get_custom_element_str(){
        $this->smarty->assign(array("CUSTOM_ELEMENT"=>$this));
	return $this->smarty->fetch($this->tpl . '.tpl');
    }
     * 
     */
}
?>