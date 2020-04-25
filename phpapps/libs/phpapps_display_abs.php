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
require_once (PHPAPPS_LIBS_DIR . "application_layout.php");

abstract class phpapps_display_abs extends  application_layout {
    public $tpl;
    //public $layout;
    public $globals;
    
    public $display_objects_type_id;
    public $display_objects_type;
    public $display_objects_id;
    
    var $display_object_display_elements_loader;
    
    public function __construct() {
        parent::__construct();
        
        $this->tpl = PHPAPPS_LIBS_TPL_DIR . "phpapps_display_abs.tpl";
        //$this->layout = new application_layout();
        //$this->layout->setupLayoutElements();
        
        global $GLOBALS_OBJ;
        $this->globals = &$GLOBALS_OBJ;
        $this->globals->sm->assign(array("display_obj"=>$this));
        
        return $this;
    }
    
    function setupDisplay(){
        //$this->loadDisplayObjectElements();
        //echo "<br>AICI DISP ABS" . $this->tpl;
        //$this->
        
    }
    
    public function displayTpl() {
         //$this->display_object_display_elements_loader->tplAssignDisplayObjectElements();
        $this->loadDisplayObjectElements();
        $this->tplAssignDisplayObjectElements();
        $this->setupDisplay();
       
        $this->globals->sm->display($this->tpl);
    }
       
    function loadDisplayObjectElements(){
       // echo "AICI:<h1>Type:" . $this->display_objects_type_id ."| ID:" . $this->display_objects_id ."</h1>";
        $this->display_object_display_elements_loader = new display_elements_loader($this->display_objects_type_id,$this->display_objects_id);
    }
    
    function tplAssignDisplayObjectElements(){
         $this->display_object_display_elements_loader->assignTemplateElements();
     }
    
}
