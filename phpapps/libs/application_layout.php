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
require_once (PHPAPPS_LIBS_DIR . "display_elements_loader.php");

class application_layout {
    //put your code here
    //var $layout_file = PHPAPPS_LAYOUTS_DIR . "default.tpl";
    var $layout = PHPAPPS_LAYOUTS_DIR . "default.tpl";
    var $layout_file;
    var $globals;
    var $layout_id = 5;
    //var $menus = array();
    //var $forms = array();
    //var $layout_variables = array();
    
    //var $layout_display_elements = array();
    var $layout_display_elements_loader;

    
     public function __construct( $lay_id = -1 ) {
        global $GLOBALS_OBJ;
        $this->globals = &$GLOBALS_OBJ;
        $this->setLayoutFile();
        $this->loadLayoutElements();
        $this->tplAssignLayoutElements();
       
     }   
     
    function setLayoutFile(){
        $sql = new DB_query("select l.ID AS LAYOUT_ID, l.NAME,l.APP_NAME from phpapps.view_layouts l left join scripts s on (s.layout_id = l.id) where s.id = :script_id",
                //array(":script_id"=> $this->globals->ath->script_id ));
                array(":script_id"=> $this->script_id ));
        //echo $sql->prnt() ."<br>";
        
        if( $this->globals->con->query($sql,"layout_sql") == 1){
        
            $this->globals->con->next("layout_sql");
            $this->layout = GLOBALS_DIR . $this->globals->con->get_field("APP_NAME","layout_sql") .  DIR_SEP .'tpl' . DIR_SEP . 'layouts' . DIR_SEP . $this->globals->con->get_field("NAME","layout_sql") . '.tpl';
            $this->layout_id = $this->globals->con->get_field("LAYOUT_ID","layout_sql");
        }
        
        $this->layout_file = $this->layout;
        
        //echo "<h1>Curent layout:" . $this->layout ."</h1><br>";
     }
     
     function loadLayoutElements(){
        $this->layout_display_elements_loader = new display_elements_loader('1',$this->layout_id);
       // $this->layout_display_elements_loader->getElements();
     }
     
     function setLayoutID($id){
         $this->layout_id = $id;
     }
          
     function tplAssignLayoutElements(){
         $this->layout_display_elements_loader->assignTemplateElements();
     }
}
?>