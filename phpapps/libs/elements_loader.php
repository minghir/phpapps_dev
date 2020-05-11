<?php
namespace wabdo;
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "DB_grid_imp.php");
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of display_elements_loader
 *
 * @author goaga
 */
class elements_loader {
    public $display_elements = array();
    public $display_object_type;
    public $display_object_id;
    
    protected $globals;
    protected $smarty;
    
    public function __construct( $display_object_type, $display_object_id ) {
        global $GLOBALS_OBJ;
        $this->globals = &$GLOBALS_OBJ;
        $this->smarty = $this->globals->sm;
        
        $this->display_object_type = $display_object_type;
        $this->display_object_id = $display_object_id;
        
        
        $this->load_elements();
        //$this->assignTemplateElements();
        
    }
    
    function get_elements(){
        return $this->display_elements;
    }
    
    function load_elements(){
        //list_layout_elements_types 
        //MENU              1
        //FORM              2
        //LAYOUT_VARIABLE   3
        //CUSTOM_ELEMER     4
         
         $sql1 = new DB_query("SELECT ID, ELEMENT_ID, ELEMENT_TYPE_ID, TEMPLATE_VARIABLE_NAME FROM phpapps.display_object_elements "
                 . "    WHERE DISPLAY_OBJECT_ID = :display_object_id AND DISPLAY_OBJECT_TYPE_ID=:display_object_type",
                 array(':display_object_id'=>$this->display_object_id,":display_object_type"=>$this->display_object_type));
         //echo "<br><br><br><br><br>". $sql1->prnt() ."<br>";
        $this->globals->con->query($sql1,"display_elements_sql");
         
        while($res = $this->globals->con->fetch_object("display_elements_sql")){
            
            switch($res->ELEMENT_TYPE_ID){
                case '1'://MENU
                    $this->display_elements['menus'][$res->TEMPLATE_VARIABLE_NAME] = $this->load_menu($res->ELEMENT_ID);
                break;
                case '2'://FORM
                    $this->display_elements['forms'][$res->TEMPLATE_VARIABLE_NAMEE] = $this->load_form($res->ELEMENT_ID);
                break;
                case '3'://LAYOUT_VARIABLE
                    $this->display_elements['layout_variables'][$res->TEMPLATE_VARIABLE_NAME] = $this->load_layout_variable($res->ELEMENT_ID);
                break;
                case '4'://GRIDS
                    $this->display_elements['grids'][$res->TEMPLATE_VARIABLE_NAME] = $this->load_grid($res->ELEMENT_ID);
                break;
                case '5'://CUSTOM ELEMENTS
                    $this->display_elements['custom_elements'][$res->TEMPLATE_VARIABLE_NAME] = $this->load_custom_element($res->ELEMENT_ID);
                break;
            }
            
            /*
            switch(_tbl("phpapps.list_display_elements_types","VALUE",$res->ELEMENT_TYPE_ID,"ID")){
                case 'MENU'://MENU
                    $this->display_elements['menus'][$res->TEMPLATE_VARIABLE_NAME] = $this->loadMenu($res->ELEMENT_ID);
                break;
                case 'FORM'://FORM
                    $this->display_elements['forms'][$res->TEMPLATE_VARIABLE_NAME] = $this->loadForm($res->ELEMENT_ID);
                break;
                case 'LAYOUT_VARIABLE'://LAYOUT_VARIABLE
                    $this->display_elements['layout_variables'][$res->TEMPLATE_VARIABLE_NAME] = $this->loadLayoutVariable($res->ELEMENT_ID);
                break;
                case 'GRID'://LAYOUT_VARIABLE
                    $this->display_elements['grids'][$res->TEMPLATE_VARIABLE_NAME] = $this->loadGrid($res->ELEMENT_ID);
                break;
            }
             * 
             */
        }
     }
     
     function assign_template_elements($smarty = NULL){
         if(is_object($smarty)){
             $this->smarty = $smarty;
         }
         
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
     
     function load_menu($menu_id){
          return new DB_menu($menu_id);
     }
     
     function load_form($form_id){
         
     }
     
     function load_layout_variable($var_id){
         return  _tbl("phpapps.layout_variables","VARIABLE_CONTENT",$var_id,"ID");
     }
     
     function load_grid($grid_id){
       return (new DB_grid_imp($grid_id))->grid_obj;
       //  return new DB_grid_imp($grid_id);
     }
     
     function load_custom_element($el_id){
            $sql2 = new DB_query("SELECT ID,
			NAME,
			APP_ID,
            (SELECT APP_NAME FROM phpapps.applications WHERE phpapps.applications.ID = phpapps.custom_elements.APP_ID) AS APP_NAME
            FROM phpapps.custom_elements
            WHERE ID = :ce_id", 
                array(":ce_id" => $el_id));
        //echo $sql2->prnt() ."<br>";
                $this->globals->con->query($sql2,"load_ce" . $el_id);
		$this->globals->con->next("load_ce" . $el_id);
		$app_name = $this->globals->con->get_field("APP_NAME","load_ce" . $el_id);
		$custom_element_name = $this->globals->con->get_field("NAME","load_ce" . $el_id);
		require_once (GLOBALS_DIR . $app_name . DIR_SEP ."custom_elements" . DIR_SEP. strtolower($custom_element_name) .".php");
                $custom_element_class_name = "wabdo\\".$custom_element_name;
                //echo "LOAD:" .$custom_element_name ."<br>";
		return  ( new $custom_element_class_name() );
     }
}
