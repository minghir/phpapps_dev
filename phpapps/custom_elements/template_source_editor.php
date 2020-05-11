<?php
namespace wabdo;
require_once ("globals.php");
require_once ("libs/code_editor.php");
class template_source_editor{

    public $ID;
    public $CUSTOM_ELEMENT_ID;
    public $CUSTOM_ELEMENT_NAME;
    public $APP_ID;
    public $APP_NAME;
    
    public $file_to_edit = "D:\work\www\phpapps_dev\phpapps\libs\code_editor.php";
    
    function __construct() {
        global $GLOBALS_OBJ;
        $this->globals = &$GLOBALS_OBJ;
        
        $this->tpl = "custom_elements" . DIR_SEP . "template_source_editor";        
        $this->APP_ID = 1;
        $this->APP_NAME = "phpapps";
        $this->ID = $this->CUSTOM_ELEMENT_ID = 28;
        $this->CUSTOM_ELEMENT_NAME = "template_source_editor";
        
        
    }
    
    function get_custom_element_str(){
        $ce = new code_editor($this->file_to_edit);
        $ce->code_editor_tpl = "code_editor_small.tpl";
	return $ce->get_str();
    }
}
?>