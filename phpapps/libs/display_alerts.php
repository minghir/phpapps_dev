<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of display_alerts
 *
 * @author goaga
 */
require_once ("globals.php");

class message{
    public $type;
    public $message;
    
    public function __construct($typ,$msg) {
        $this->type=$typ;
        $this->message = $msg;
    }
}

class display_alerts {

    /// message type one of: success info warning danger primary secondary dark
    /// message to display
    private $message_types = array("success","error","warning","danger","primary","secondary","dark");
    public $messages = array();
    
    /// template should be concatenated with PHPAPPS_LIBS_TPL_DIR global var
    public $message_tpl = "display_alerts.tpl";
    private $smarty;
    private $globals;
    
    /// construct parameters
    /// $msg message to display
    /// $type type of message
    public function __construct() {

        /// using same globals obj
        $this->globals = &$GLOBALS_OBJ;
        
        $this->smarty = new Smarty;
        $this->smarty->template_dir = PHPAPPS_LIBS_TPL_DIR;
        $this->smarty->compile_dir = SMARTY_COMPILE_DIR;
    }
    
    function add_alert($type,$msg){
        if(!in_array($type, $this->message_types)){
           //// wrong type 
            return -1;
        }
        $this->messages[] = new message($type,$msg);
        return 1;
    }
    
    public function get_message_str(){
        $this->smarty->assign("messages",$this->messages);
        $tmp_string =  $this->smarty->fetch($this->message_tpl);
        unset($this->smarty);
        return $tmp_string;
    }
            
}
