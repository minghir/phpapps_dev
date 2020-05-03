<?php
namespace wabdo;
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
    public $display_type = false;
    
    public function __construct($typ,$msg,$disp_type = false) {
        $this->type=$typ;
        $this->message = $msg;
        $this->display_type = $disp_type;
    }
}

class display_alerts {

    /// message type one of: success info warning danger primary secondary dark
    /// message to display
    private $message_types = array("success","info","warning","danger","primary","secondary","dark");
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
    
    function add_alert($type,$msg,$disp_type = false){
        $type  == "error" ? "danger" : $type;
        if(!in_array($type, $this->message_types)){
           //// wrong type 
            return -1;
        }
        $this->messages[] = new message($type, $msg, boolval($disp_type));
        return 1;
    }
    
    function get_no_errors(){
        if(is_array($this->messages)){
           return array_count_values(array_column($this->messages,"type"))["danger"];
        }else{
            return 0;
        }
    }
    
    function get_no_alerts(){
        if(is_array($this->messages)){
            return count($this->messages);
        }else{
            return 0;
        }
    }
    
    public function get_message_str(){
        $this->smarty->assign("messages",$this->messages);
        $tmp_string =  $this->smarty->fetch($this->message_tpl);
        unset($this->smarty);
        return $tmp_string;
    }
            
}
