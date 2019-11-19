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
    var $layout_file = PHPAPPS_LAYOUTS_DIR . "phpapps.lay";
    var $globals;
    var $layout_id;
    
     public function __construct( $lay_id = -1 ) {
        global $GLOBALS_OBJ;
        $this->globals = &$GLOBALS_OBJ;
     }   
     
    function setLayoutFile($file){
        $this->layout_file =  $file ;
     /*
        if($lay_id  != -1 ){
            $this->layout_id = $lay_id;
            $this->layout_file = PHPAPPS_LAYOUTS_DIR . "phpapps_login.lay";
        }else{
            $sql = new DB_query("SELECT LAYOUT_NAME FROM phpapps.view_applications WHERE app_name = :app_name",array(":app_name"=> CURRENT_APP ));
            $this->globals->con->query($sql,"layout_sql");
            $this->globals->con->next("layout_sql");
            $this->layout_file = PHPAPPS_LAYOUTS_DIR . $this->globals->con->get_field("LAYOUT_NAME","layout_sql") .".lay";
            $this->setupLayoutElements();
        }
      *
      */
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