<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace wabdo;

require_once (PHPAPPS_LIBS_DIR . "flabel.php");

/**
 * Description of flabel
 *
 * @author goaga
 */

class fdblabel extends flabel{
    
    function __construct($el_id) {
        parent::__construct($el_id,1);
    }
    
    function setup(){
        
    }
}
