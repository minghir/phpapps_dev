<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once (PHPAPPS_LIBS_DIR . "HrefActions.php");

class DB_menu{
    
    private $globals;
    private $template = "db_menu.tpl";
    private $sm;
    
    public $name;
    public $title;
    public $orientation;
    public $menu_type;
    public $db_query;
    
    var $items = array();
    
    function __construct($menu_id){
		global $GLOBALS_OBJ;
                $this->globals = &$GLOBALS_OBJ;
                
                $this->db_query = $db_qery;
                $this->name = $menu_name; 
                
                $this->sm = new Smarty;
                $this->sm->template_dir = DB_LIBS_TPL_DIR;
                $this->sm->compile_dir = SMARTY_COMPILE_DIR;
                
                $this->setup_menu_options();
    }
    
    function set_menu_query($db_q){
        $this->db_query = $db_q;
    }
    
    function get_menu_str(){
        $this->sm->assign(array("menu_obj"=>$this));
	return $this->sm->fetch($this->template);
    }
    
    function setup_menu_options(){
        //$sql = new DB_query();
        //$this->title = "MIMI";
        $this->orientation = "horizontal";
        //$this->sm->assign(array("name"=>$this->name));
    }
};
?>

