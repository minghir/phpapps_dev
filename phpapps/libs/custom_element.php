<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of custom_element
 *
 * @author goaga
 */
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . 'display_elements_loader.php');

class custom_element {
    //put your code here
    public $ID;
    
    public $display_elements;
    private $display_elements_loader;
    public $tpl;
    
    public $smarty;
    function __construct() {
        
    }
    
    function loadElements(){
        $this->display_elements_loader = new display_elements_loader('4',$this->ID);
        $this->display_elements = $this->display_elements_loader->display_elements;
    }
    
    //function tplAssignDisplayObjectElements(){
      //  $this->display_elements_loader->assignTemplateElements();
    //}
     
    function setTemplateFile(){
          $sql = new DB_query("SELECT t.ID, t.TEMPLATE_NAME, t.ELEMENT_TYPE_ID, t.APP_NAME FROM phpapps.view_templates t "
                  . "LEFT JOIN phpapps.CUSTOM_ELEMENTS s ON (s.TEMPLATE_ID = t.ID) WHERE s.ID = :cust_el_id",
                array(":cust_el_id" => $this->ID));
        $this->globals->con->query($sql);	
        $tmp_data_obj = $this->globals->con->fetch_object();
        
        //$this->template = $tmp_data_obj->TEMPLATE_NAME;
        $this->tpl = GLOBALS_DIR . $tmp_data_obj->APP_NAME . DIR_SEP . "tpl" . DIR_SEP . "custom_elements" . DIR_SEP . $tmp_data_obj->TEMPLATE_NAME;
        
        
    }
    
    public function displayTpl() {
        //$this->display_elements_loader->tplAssignDisplayObjectElements();
        
        //$this->setTemplateFile();
        
       // $this->globals->sm->display($this->tpl);
    }
    
    public function get_custom_element_str(){
        
        $this->loadElements();
        $this->smarty->assign(array("CUSTOM_ELEMENT"=>$this));
        
        $this->assignTemplateElements();
     
        
        $this->setTemplateFile();
        // echo "<H1>ACUM SUNTAICI</h1>";
	return $this->smarty->fetch($this->tpl . '.tpl');
    }
    
     function assignTemplateElements(){
         
         if(is_array($this->display_elements['menus'])){
             foreach($this->display_elements['menus'] as $key=>$val){
                 $this->smarty->assign($key,$val->get_menu_str());
             }
         }
         
         if(is_array($this->display_elements['layout_variables'])){
             foreach($this->display_elements['layout_variables'] as $key=>$val){
                 $this->smarty->assign($key,$val);
             }
         }
         
         if(is_array($this->display_elements['grids'])){
             //echo "ASSIGN:" . $val->GRID_NAME;
             foreach($this->display_elements['grids'] as $key=>$val){
                 $this->smarty->assign($key,$val->get_grid_str());
             }
         }
         
         if(is_array($this->display_elements['custom_elements'])){
             //echo "ASSIGN:" . $val->GRID_NAME;
             foreach($this->display_elements['custom_elements'] as $key=>$val){
                 $this->smarty->assign($key,$val->get_custom_element_str());
             }
         }
         
          //print_r($this->display_elements['grids']);
     }
    
}

?>
