<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace wabdo;
require_once (PHPAPPS_LIBS_DIR . "form_element.php");
/**
 * Description of finput
 *
 * @author goaga
 */

class foption extends form_element{
    
    public $value;
    public $label;
    public $selected;
    
    function __construct($el_id,$value,$label,$selected = false) {
            parent::__construct($el_id,8);
        $this->value = $value;
        $this->label = $label;
        $this->selected = $selected;
    }
    
    function selected($selected){
        $this->selected = $selected;
    }
    
    function label($label){
        $this->label = $label;
    }
    
    function value($value){
        $this->value = $value;
    }
    
    function setup(){
        //echo "SUNT IN OPTION_SETUP<br>";
    }

/*
    function get_str(){
        $tmp_selected = $this->selected ? "selected" : "";
        return "<option value=\"" . $this->value . "\" $tmp_selected>" . $this->label . "</option>";
    }
*/
}

class fselect extends form_element{
    
    public $label;
    public $options = array();
    public $elements = array();
    public $multiple = false;
    public $empty_option = false;
    
    public $selected_val;
    
    public $element_id;
    
    function __construct($el_id) {
        parent::__construct($el_id,3);
        $this->element_id = $el_id;
    }
    
    function set_label($lbl){
        $this->label = $lbl;
    }
    
    function set_elements($fs_elem = array()){
        $this->elements = $fs_elem;
    }
    
    function set_selected($val){
        $this->selected_val = $val;
    }
    
    function set_multiple($mult){
        $this->multiple = $mult;
    }
    
    function set_empty_option($mult){
        $this->empty_option = $mult;
    }
    
    function setup(){
        
        if($this->empty_option){
            $this->options[] = new foption($this->element_id , "","--");
        }
        
        if(is_array($this->elements)){
            foreach($this->elements as $val=>$label){
                $tmp_sel = $val == $this->selected_val ? true : false;
                $this->options[] = new foption($this->element_id . "_option",$val,$label,$tmp_sel);
            }
        }
    }
    
    
}
