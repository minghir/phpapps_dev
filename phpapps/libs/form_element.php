<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace wabdo;
use Smarty;

/**
 * Description of form_element
 *
 * @author goaga
 */
class form_element {
    public $tpl;
    private $sm;
    
    public $ID;
    public $ELEMENT_LABEL;
    public $VALUE;
    public $NAME;
    
//    ID	VALUE	DESCRIPTION	list_form_element_types
//1	LABEL	Text label	
//2	INPUT	Input value	
//3	SELECT	Select input	
//4	TEXTAREA	Textarea 
//5	BUTTON	Form button	
    
    public $form_element_type;
    
    public function __construct($element_id,$element_type){
        
        $this->sm = new Smarty;
        $this->sm->template_dir = PHPAPPS_LIBS_TPL_DIR;
			
			//echo PHPAPPS_LIBS_TPL_DIR . "<br>";
			//print_r( $this->sm->template_dir );
        $this->sm->compile_dir = SMARTY_COMPILE_DIR;
        
        $this->ID = $element_id;
        $this->form_element_type = $element_type;
        
        switch($this->form_element_type){
            case 1:{ //flabel
                $this->tpl = "flabel.tpl";
                break;
            }
            case 2:{ //finput
                $this->tpl = "finput.tpl";
                break;
            }
            case 3:{ //fselect
                $this->tpl = "fselect.tpl";
                break;
            }
            case 4:{ //ftextarea
                $this->tpl = "ftextarea.tpl";
                break;
            }
            case 5:{ //ftextarea
                $this->tpl = "fbutton.tpl";
                break;
            }
             case 6:{ 
                break;
            }
            
            case 7:{ 
                break;
            }
            
            case 8:{ //foption
                $this->tpl = "foption.tpl";
                break;
            }
        }

        return $this;
    }
    
    
    function set_value($val){
        $this->VALUE = $val;
    }
    
    function get_value(){
        return $this->VALUE;
    }
    
    function set_element_label($val){
        $this->ELEMENT_LABEL = $val;
    }
    
    function get_element_label(){
        return $this->ELEMENT_LABEL;
    }
    
    
    function set_name($val){
        $this->NAME = $val;
    }
    
    function get_name(){
        return $this->NAME;
    }
    
    function setup(){///overwrite
        
    }
    
    function get_str(){
        $this->setup();
        $this->sm->assign("this",$this);
        return $this->sm->fetch($this->tpl);
    }
    
    
}
