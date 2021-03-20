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

class ftextarea extends form_element{
    
    public $label;
    
    function __construct($el_id) {
        parent::__construct($el_id,4);
    }
    
    function set_label($lbl){
        $this->label = $lbl;
    }
    
}
