<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class php_source_editor extends phpapps_display_abs{

    public $ID;
    public $CUSTOM_ELEMENT_ID;
    public $CUSTOM_ELEMENT_NAME;
    public $APP_ID;
    public $APP_NAME;
    
    function __construct() {
        parent::__construct();
        
        $this->tpl = "custom_elements" . DIR_SEP . "php_source_editor";        
        $this->APP_ID = 1;
        $this->APP_NAME = "phpapps";
        $this->ID = $this->CUSTOM_ELEMENT_ID = 29;
        $this->CUSTOM_ELEMENT_NAME = "php_source_editor";
        
        
    }
    
    function get_custom_element_str(){
        $this->globals->sm->assign(array("CUSTOM_ELEMENT"=>$this));
	return $this->globals->sm->fetch($this->tpl . '.tpl');
    }
}
?>