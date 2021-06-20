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

class foption{
    
    public $value;
    public $label;
    public $selected;
    
    function __construct($value,$label,$selected = false) {
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


    function get_str(){
        $tmp_selected = $this->selected ? "selected" : "";
        return "<option value=\"" . $this->value . "\" $tmp_selected>" . $this->label . "</option>";
    }
}

class fselect extends form_element{
    
    public $label;
    public $options = array();
    public $elements = array();
    public $multiple = false;
    public $empty_option = false;
    
    public $selected_val;
    
    function __construct($el_id) {
        parent::__construct($el_id,3);
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
            $this->options[] = new foption("","--");
        }
        
        if(is_array($this->elements)){
            foreach($this->elements as $val=>$label){
                $tmp_sel = $val == $this->selected_val ? true : false;
                $this->options[] = new foption($val,$label,$tmp_sel);
            }
        }
    }
    
    
}
