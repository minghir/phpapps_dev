<?php
namespace wabdo;
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
    
    public $globals;
    
    public $tpl;
    
    // layout script custom_element
    public $display_objects_type_id;
    public $display_objects_type;
    public $display_objects_id;
    
    
    var $display_elements_loader;
    var $display_elements;
    
    public function __construct() {
        parent::__construct();
        
        $this->tpl = PHPAPPS_LIBS_TPL_DIR . "phpapps_display_abs.tpl";
        
        global $GLOBALS_OBJ;
        $this->globals = &$GLOBALS_OBJ;
        
        //$this->setTemplateFile();
        $this->globals->sm->assign(array("display_obj"=>$this));
        return $this;
    }
    
    function setTemplateFile(){
        
        $sql = new DB_query("SELECT t.ID, t.TEMPLATE_NAME, t.ELEMENT_TYPE_ID, t.APP_NAME FROM phpapps.view_templates t LEFT JOIN phpapps.scripts s ON (s.TEMPLATE_ID = t.ID) WHERE s.ID = :script_id",
                array(":script_id" => $this->script_id));
        //echo $sql->prnt();
        
        if( $this->globals->con->query($sql,"custom_tpl_sql_" . $this->script_id) == 1){
            $this->globals->con->next("custom_tpl_sql_" . $this->script_id);
            
            $element_type_id = $this->globals->con->get_field("ELEMENT_TYPE_ID","custom_tpl_sql_" . $this->script_id);
            $app_name = $this->globals->con->get_field("APP_NAME","custom_tpl_sql_" . $this->script_id);
            $tpl_name = $this->globals->con->get_field("TEMPLATE_NAME","custom_tpl_sql_" . $this->script_id); 
            
            //switch(_tbl("phpapps.list_template_types","VALUE",$this->ELEMENT_TYPE_ID)){
            switch($element_type_id){
                            case '1': 
                                $path_to = "scripts";
                            break;
                            case '2': 
                                $path_to = "forms";
                            break;
                            case '3': 
                                $path_to = "grids";
                            break;
                            case '4': 
                                $path_to = "menus";
                            break;
                            case '5': 
                                $path_to = "custom_elements";
                            break;
                            default:
                                $this->errors[] = "UNKNOWN ELEMENT!!!";
                            break;
                        }
             $ttpl = GLOBALS_DIR . $app_name . DIR_SEP .'tpl' . DIR_SEP . $path_to . DIR_SEP . $tpl_name . '.tpl';
           // echo "<br>setez template:" . $ttpl;
            $this->tpl = $ttpl;
        }else{
            
        }
    }
    
    function loadElements(){
        $this->loadDisplayObjectElements();
    }
    
    function setupDisplay(){
    }
    
    public function displayTpl() {
        $this->tplAssignDisplayObjectElements();
        
        $this->setTemplateFile();
        
        $this->globals->sm->display($this->tpl);
    }
       
    function loadDisplayObjectElements(){
        $this->display_elements_loader = new display_elements_loader($this->display_objects_type_id,$this->display_objects_id);
        $this->display_elements = $this->display_elements_loader->display_elements;
    }
    
    function tplAssignDisplayObjectElements(){
         $this->display_elements_loader->assignTemplateElements();
     }
    
}
