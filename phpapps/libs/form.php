<?php

namespace wabdo;
use Smarty;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once (PHPAPPS_LIBS_DIR . "custom_element.php");
require_once (PHPAPPS_LIBS_DIR . "flabel.php");
require_once (PHPAPPS_LIBS_DIR . "finput.php");
require_once (PHPAPPS_LIBS_DIR . "ftextarea.php");
require_once (PHPAPPS_LIBS_DIR . "fbutton.php");
require_once (PHPAPPS_LIBS_DIR . "fselect.php");

/**
 * Description of form
 *
 * @author goaga
 */
class form {
    public $tpl;
    
    public $form_elements = array();
    
    private $str;
    private $db_obj;
    
    private $sm;
    
    public $ID;
    public $FORM_NAME;
    public $FORM_TITLE;
    public $FORM_LABEL;
    public $FORM_TABLE;
    public $DESCRIPTION;
    public $TEMPLATE_ID;
    public $FORM_METHOD; // 1 POST | 2 GET - list_form_methods
    
    public function __construct($form_id){
        $this->tpl = "form.tpl";
        
        $this->sm = new Smarty;
        $this->sm->template_dir = PHPAPPS_LIBS_TPL_DIR;
			
			//echo PHPAPPS_LIBS_TPL_DIR . "<br>";
			//print_r( $this->sm->template_dir );
        $this->sm->compile_dir = SMARTY_COMPILE_DIR;
        
        
        $this->ID = $form_id;
        $this->FORM_METHOD = "POST";
             
        
        global $GLOBALS_OBJ;
        $this->globals = &$GLOBALS_OBJ;
        
        $sql = new DB_query("SELECT * FROM {$this->globals->PHPAPPS_DB}.forms WHERE ID = :form_id",array(":form_id"=> $this->ID));

        $tmp_obj;    
        if( $this->globals->con->query($sql) == 1){
             $tmp_obj = $this->globals->con->fetch_object();
        }
        
        $this->FORM_NAME = $tmp_obj->FORM_NAME;
        
        echo "<b>AAA" . $this->FORM_NAME ."</b><br>";
        
        print_r($this->this);
        $this->load_form_elements();
        
        if($_SERVER['REQUEST_METHOD'] === 'POST') {
            echo "AICICICA";
            $this->on_submit();
        }else{
            
        }
        
    }
    
    function load_form_elements(){
        
            $this->form_elements["flabel1"] = new flabel(1);
            //$lbl = new flabel(1);
            $tmp = new finput(2,19);
            $tmp->set_element_label("MIMI  ");
            $tmp->set_name("MIMICA");
            $tmp->set_value("MVIMICA");
            $this->form_elements["flabel2"] = $tmp;
            
            $tmp = new ftextarea(4);
            $tmp->set_name("texa");
            $this->form_elements["flabel43"] = $tmp;
            
            $tmp =  new fbutton(4);
            $tmp->set_button_type("SUBMIT");
            $tmp->set_name("trimite");
            $this->form_elements["flabea43"] = $tmp;
            
            
            $tmp = new fselect(4);
            $tmp->set_name("AA");
            $tmp->set_elements(array("mama","baba","cici"));
            $tmp->set_empty_option(true);
            $tmp->set_element_label("SLECT BENGOS");
            //$tmp->set_multiple(true);
            $tmp->set_selected(1);
            
            $this->form_elements["flabea435"] = $tmp;
            
            $this->form_elements["flabel3"] = $this->load_custom_element(43);
            
    }
    
    function load_custom_element($el_id){
         $sql2 = new DB_query("SELECT ID,
			NAME,
			APP_ID,
            (SELECT APP_NAME FROM {$this->globals->PHPAPPS_DB}.applications WHERE {$this->globals->PHPAPPS_DB}.applications.ID = {$this->globals->PHPAPPS_DB}.custom_elements.APP_ID) AS APP_NAME
            FROM {$this->globals->PHPAPPS_DB}.custom_elements
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
    
    
    function get_form_str(){
       //$this->sm->assign("flabel1", $this->form_elements["flabel1"]->get_str());
       //$this->sm->assign("flabel2", $this->form_elements["flabel2"]->get_str());
       $this->sm->assign("this",$this);
       return $this->sm->fetch($this->tpl);
    }
    
    function on_submit(){
        print_r($_POST);
    }
    
    function set_method($method){
        $this->METHOD = $method;
    }
    
    
}
