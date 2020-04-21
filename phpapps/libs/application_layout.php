<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of application_layout
 *
 * @author victor.minghir
 */
require_once ("globals.php");

class application_layout {
    //put your code here
    //var $layout_file = PHPAPPS_LAYOUTS_DIR . "default.tpl";
    var $layout = PHPAPPS_LAYOUTS_DIR . "default.tpl";
    var $layout_file;
    var $globals;
    var $layout_id = 5;
    var $menus = array();
    var $forms = array();
    var $layout_variables = array();
    
     public function __construct( $lay_id = -1 ) {
        global $GLOBALS_OBJ;
        $this->globals = &$GLOBALS_OBJ;
        $this->setLayoutFile();
        $this->setupLayoutElements();
        $this->tplAssignLayoutElements();
       
     }   
     
    function setLayoutFile(){
        $sql = new DB_query("select l.ID AS LAYOUT_ID, l.NAME,l.APP_NAME from view_layouts l left join scripts s on (s.layout_id = l.id) where s.id = :script_id",
                array(":script_id"=> $this->globals->ath->script_id ));
        //echo $sql->prnt() ."<br>";
        
        if( $this->globals->con->query($sql,"layout_sql") == 1){
        
            $this->globals->con->next("layout_sql");
            $this->layout = GLOBALS_DIR . $this->globals->con->get_field("APP_NAME","layout_sql") .  DIR_SEP .'tpl' . DIR_SEP . 'layouts' . DIR_SEP . $this->globals->con->get_field("NAME","layout_sql") . '.tpl';
            $this->layout_id = $this->globals->con->get_field("LAYOUT_ID","layout_sql");
        }
        
        $this->layout_file = $this->layout;
        
        //echo "<h1>Curent layout:" . $this->layout ."</h1><br>";
     }
     
     function setLayoutID($id){
         $this->layout_id = $id;
     }
     
     function setupLayoutElements(){
        //list_layout_elements_types 
        //MENU              1
        //FORM              2
        //LAYOUT_VARIABLE   3
         
         $sql = new DB_query("SELECT ID, ELEMENT_ID, ELEMENT_TYPE, LAYOUT_VARIABLE_NAME FROM phpapps.layout_elements WHERE LAYOUT_ID = :layout_id",
                 array(':layout_id'=>$this->layout_id));
         
        $this->globals->con->query($sql,"layout_elements_sql");
        while($res = $this->globals->con->fetch_object("layout_elements_sql")){
            switch($res->ELEMENT_TYPE){
                case 1://MENU
                    $this->menus[$res->LAYOUT_VARIABLE_NAME] = $this->loadMenu($res->ELEMENT_ID);
                break;
                case 2://FORM
                    $this->forms[$res->LAYOUT_VARIABLE_NAME] = $this->loadForm($res->ELEMENT_ID);
                break;
                case 3://LAYOUT_VARIABLE
                    $this->layout_variables[$res->LAYOUT_VARIABLE_NAME] = $this->loadLayoutVariable($res->ELEMENT_ID);
                break;
            }
        }
     }
     
     function loadMenu($menu_id){
          return new DB_menu($menu_id);
     }
     
     function loadForm($form_id){
         
     }
     
     function loadLayoutVariable($var_id){
         return  _tbl("phpapps.layout_variables","VARIABLE_CONTENT",$var_id,"ID");
     }
     
     function tplAssignLayoutElements(){
         if(is_array($this->menus)){
             foreach($this->menus as $key=>$val){
                 $this->globals->sm->assign($key,$val->get_menu_str());
             }
         }
         
         if(is_array($this->layout_variables)){
             foreach($this->layout_variables as $key=>$val){
                 $this->globals->sm->assign($key,$val);
             }
         }
     }
}
?>