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
    var $layout_file = PHPAPPS_LAYOUTS_DIR . "default.tpl";
    var $globals;
    var $layout_id;
    
     public function __construct( $lay_id = -1 ) {
        global $GLOBALS_OBJ;
        $this->globals = &$GLOBALS_OBJ;
        $this->setLayoutFile();
       // echo "<h1>" . $this->globals->ath->script_id ."</h1>";
       // echo "<br>".$this->layout_file."</br>";
     }   
     
    function setLayoutFile(){
        $sql = new DB_query("select l.NAME,l.APP_NAME from view_layouts l left join scripts s on (s.layout_id = l.id) where s.id = :script_id",
                array(":script_id"=> $this->globals->ath->script_id ));
        if( $this->globals->con->query($sql,"layout_sql") != 1){
            return;
        }
        
        $this->globals->con->next("layout_sql");
        $this->layout_file = GLOBALS_DIR . $this->globals->con->get_field("APP_NAME","layout_sql") .  DIR_SEP .'tpl' . DIR_SEP . 'layouts' . DIR_SEP . $this->globals->con->get_field("NAME","layout_sql") . '.tpl';

     }
     
     function setLayoutID($id){
         $this->layout_id = $id;
     }
     
     function setupLayoutElements(){
         
         // SETUP LEFT VERTICAL MENU
                $menu_query = new DB_query("SELECT "
                        . "CONCAT('<a href=\"SCRIPT_NAME,'.php?module_id=',ID,'\">',MODULE_TITLE,'</a>) AS ITEM"
                        . "FROM view_modules "
                       // . "WHERE APP_ID = :app_id",array(":app_id"=>$this->app_id));
                          . "WHERE APP_ID = :app_id",array(":app_id"=>"1"));
               //$menu_query->prnt();
               $menu1 = new DB_menu("main_menu",$menu_query);
                       
               $this->globals->sm->assign("vertical_menu",$menu1->get_menu_str());
               
         // SETUP HEADER
               
         // SETUP HEADER      
     }
}
?>