<?php
namespace wabdo;
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
require_once (PHPAPPS_LIBS_DIR . "elements_loader.php");

class layout {
    //put your code here
    //var $layout_file = PHPAPPS_LAYOUTS_DIR . "default.tpl";
    private $default_layout = PHPAPPS_LAYOUTS_DIR . "default.tpl";
    private $default_layout_id = 5;
    public $layout;
    public $layout_file;
    public $layout_theme;
    public $globals;
    
 
    private $layout_elements_loader;

    
     public function __construct( $lay_id = -1 ) {
        global $GLOBALS_OBJ;
        $this->globals = &$GLOBALS_OBJ;
        $this->set_layout_file();
        $this->load_layout_elements();
        $this->assign_layout_elements();
      }   
     
    function set_layout_file(){
        $sql = new DB_query("select l.ID AS LAYOUT_ID, l.NAME,l.APP_NAME, l.THEME_NAME from {$this->globals->PHPAPPS_DB}.view_layouts l left join scripts s on (s.layout_id = l.id) where s.id = :display_object_id",
                array(":display_object_id"=> $this->display_objects_id ));
        //echo $sql->prnt() ."<br>";
        
        if( $this->globals->con->query($sql,"layout_sql") == 1){
            $this->globals->con->next("layout_sql");
            $this->layout = GLOBALS_DIR . $this->globals->con->get_field("APP_NAME","layout_sql") .  DIR_SEP .'tpl' . DIR_SEP . 'layouts' . DIR_SEP . $this->globals->con->get_field("NAME","layout_sql") . '.tpl';
            $this->layout_id = $this->globals->con->get_field("LAYOUT_ID","layout_sql");
            $this->layout_file = $this->layout;
            
            //$this->layout_theme = GLOBALS_DIR . $this->globals->con->get_field("APP_NAME","layout_sql") .  DIR_SEP .'css' . DIR_SEP . $this->globals->con->get_field("THEME_NAME","layout_sql") . '.css';
             $this->layout_theme = $this->globals->con->get_field("THEME_NAME","layout_sql");
            
        }else{
            $this->layout_file = $this->default_layout;
        }
        
        //echo "<h1>layout_file:" . $this->layout_file . "</h1>";
     }
     
     function load_layout_elements(){
        $this->layout_elements_loader = new elements_loader('1',$this->layout_id);
     }
     
     function set_layout_id($id){
         $this->layout_id = $id;
     }
          
     function assign_layout_elements(){
         $this->layout_elements_loader->assign_template_elements();
     }
}
?>