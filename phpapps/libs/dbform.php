<?php

namespace wabdo;
use Smarty;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once (PHPAPPS_LIBS_DIR . "form.php");

/**
 * Description of form
 *
 * @author goaga
 */
class dbform extends form{
    
    public function __construct($form_id){
         parent::__construct($form_id);
    }

    function db_update(){
        
    }
    
    function db_insert(){
        
    }
    
    function db_delete(){
        
    }
    
}
