<?php
require_once ("globals.php");

class {$CLASS_NAME} {ldelim}
    public $globals;

    public $ID;
    public $CUSTOM_ELEMENT_ID;
    public $CUSTOM_ELEMENT_NAME;
    public $APP_ID;
    public $APP_NAME;
    
    private $smarty;
    
    function __construct() {ldelim}
        global $GLOBALS_OBJ;
        $this->globals = &$GLOBALS_OBJ;
        
        $this->tpl = "{$CLASS_NAME}";        
        $this->APP_ID = {$APP_ID};
        $this->APP_NAME = "{$APP_NAME}";
        $this->ID = $this->CUSTOM_ELEMENT_ID = {$CUSTOM_ELEMENT_ID};
        $this->CUSTOM_ELEMENT_NAME = "{$CLASS_NAME}";
        
        $this->smarty = new Smarty;
        $this->smarty->template_dir = CURRENT_APP_TPL_DIR ."custom_elements" . DIR_SEP;
        $this->smarty->compile_dir = SMARTY_COMPILE_DIR;
    {rdelim}
    
    function get_custom_element_str(){ldelim}
        $this->smarty->assign(array("CUSTOM_ELEMENT"=>$this));
	return $this->smarty->fetch($this->tpl . '.tpl');
    {rdelim}
{rdelim}
?>