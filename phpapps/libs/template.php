<?php
namespace wabdo;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of template
 *
 * @author victor.minghir
 */

require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "layout.php");
require_once (PHPAPPS_LIBS_DIR . "alerts.php");

abstract class template extends layout {
    
    //protected $globals;
    
    protected $tpl;
    
    // layout script custom_element
    protected $display_objects_type_id;
    protected $display_objects_type;
    protected $display_objects_id;
    
    
    public $elements_loader;
    public $template_elements;
    
    public function __construct() {
        parent::__construct();
        $this->tpl = PHPAPPS_LIBS_TPL_DIR . "template.tpl";
        
        global $GLOBALS_OBJ;
        $this->globals = &$GLOBALS_OBJ;
        
        //$this->setTemplateFile();
        $this->globals->sm->assign(array("display_obj"=>$this));
        return $this;
    }
    
    function set_template_file(){
        
        $sql = new DB_query("SELECT t.ID, t.TEMPLATE_NAME, t.ELEMENT_TYPE_ID, t.APP_NAME FROM {$this->globals->PHPAPPS_DB}.view_templates t LEFT JOIN {$this->globals->PHPAPPS_DB}.scripts s ON (s.TEMPLATE_ID = t.ID) WHERE s.ID = :script_id",
               // array(":script_id" => $this->script_id));
              array(":script_id" => $this->display_objects_id));
        //echo $sql->prnt();
        if( $this->globals->con->query($sql,"custom_tpl_sql_" . $this->script_id) == 1){
            $this->globals->con->next("custom_tpl_sql_" . $this->script_id);
            
            $element_type_id = $this->globals->con->get_field("ELEMENT_TYPE_ID","custom_tpl_sql_" . $this->script_id);
            $app_name = $this->globals->con->get_field("APP_NAME","custom_tpl_sql_" . $this->script_id);
            $tpl_name = $this->globals->con->get_field("TEMPLATE_NAME","custom_tpl_sql_" . $this->script_id); 
            
            //switch(_tbl("{$this->globals->PHPAPPS_DB}.list_template_types","VALUE",$this->ELEMENT_TYPE_ID)){
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
            $this->tpl = GLOBALS_DIR . $app_name . DIR_SEP .'tpl' . DIR_SEP . $path_to . DIR_SEP . $tpl_name . '.tpl';
          
        }else{
            
        }
         //echo "TEMPLATE FILE:" .  $this->tpl . "<br>";
    }
    
    function load_elements(){
        $this->elements_loader = new elements_loader($this->display_objects_type_id,$this->display_objects_id);
       // $this->display_elements = $this->elements_loader->display_elements;
        $this->template_elements = $this->elements_loader->display_elements;
        
    }
    
    public function setup_display(){
    }
    
    public function display_template() {
        $this->assign_template_elements();
        $this->set_template_file();
        $this->globals->sm->display($this->tpl);
    }
    
    function assign_template_elements(){
        $this->elements_loader->assign_template_elements();
     }
    
}
