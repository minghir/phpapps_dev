<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of phpapps_display_abs
 *
 * @author victor.minghir
 */

require_once ("globals.php");

abstract class phpapps_display_abs {
    public $tpl;
    public $layout;
    
    public function __construct() {
        
        $this->tpl = PHPAPPS_LIBS_TPL_DIR . "phpapps_display_abs.tpl";
        $this->layout = PHPAPPS_LAYOUTS_DIR . "default.lay.tpl";
        
        global $GLOBALS_OBJ;
        $this->globals = &$GLOBALS_OBJ;
        $this->globals->sm->assign(array("display_obj"=>$this));
        return $this;
    }
    
    function setupDisplay(){
    }
    
    public function displayTpl() {
        $this->setupDisplay();
        $this->globals->sm->display($this->tpl);
    }
}
