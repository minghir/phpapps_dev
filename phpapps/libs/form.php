<?php
namespace wabdo;
use Smarty;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 * Description of form
 *
 * @author goaga
 */
class form {
    public $tpl;
    private $ID;
    private $form_elements = array();
    private $str;
    private $sm;
    
    public function __construct($form_id){
        $this->tpl = "form.tpl";
        
        $this->sm = new Smarty;
        $this->sm->template_dir = PHPAPPS_LIBS_TPL_DIR;
			
			//echo PHPAPPS_LIBS_TPL_DIR . "<br>";
			//print_r( $this->sm->template_dir );
        $this->sm->compile_dir = SMARTY_COMPILE_DIR;
        
        
        $this->ID = $form_id;
        
        
        
        global $GLOBALS_OBJ;
        $this->globals = &$GLOBALS_OBJ;
        
        $sql = new DB_query("SELECT * FROM {$this->globals->PHPAPPS_DB}.forms WHERE ID = :form_id",array(":form_id"=> $this->ID));
        //$this->str = $sql->prnt();
        if( $this->globals->con->query($sql) == 1){
                
             $this->str = implode(",",$this->globals->con->fetch_array());
        }
        
    }
    
    function load_form_elements(){
        
    }
    
    function get_form_str(){
//        echo $this->str;
        return $this->sm->fetch($this->tpl);
    }
    //put your code here
}
