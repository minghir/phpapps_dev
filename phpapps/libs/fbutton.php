<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace wabdo;

require_once (PHPAPPS_LIBS_DIR . "form_element.php");

/**
 * Description of flabel
 *
 * @author goaga
 */

/*
 *
 * phpapps.list_form_button_types
ID      VAL
1	SUBMIT
2	CANCEL
3	BACK
4	RESET
 */

class fbutton extends form_element{
    public $button_type;
    public $button_types = array("SUBMIT"=>1,"CANCEL"=>2,"BACK"=>3,"RESET"=>4);
    
    function __construct($el_id) {
        parent::__construct($el_id,5);
    }
    
    function set_button_type($val){
        $this->button_type = is_int($val) ? $val : $this->button_types[$val];
    }
    
    function get_button_type(){
        return $this->button_type;
    }
}
