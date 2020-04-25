<?php
require_once ("globals.php");
//require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class custom_element_1 {//extends phpapps_display_abs{
    public $globals;
    private $custom_element_id;
    
    
    function __construct() {
        //parent::__construct();
        global $GLOBALS_OBJ;
        $this->globals = &$GLOBALS_OBJ;
        //$this->layout = PHPAPPS_LAYOUTS_DIR . "default.tpl";
        $this->tpl = "custom_elements".DIR_SEP."custom_element_1.tpl";        
        //$this->app_id = ;
        //$this->script_id = ;
        $this->app_id = $app_id;
    }
    
    function get_custom_element_str(){
        $this->globals->sm->assign(array("custom_element_obj"=>$this));
	return $this->globals->sm->fetch($this->tpl);
    }
}

?>