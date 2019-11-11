<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once (PHPAPPS_LIBS_DIR . "HrefActions.php");

class DB_menu{
    
    var $globals;
    var $template = "db_menu.tpl";
    var $db_query;
    var $sm;
    
    var $name;
    var $items = array();
    
    function __construct($menu_name, $db_qery){
		global $GLOBALS_OBJ;
                $this->globals = &$GLOBALS_OBJ;
                
                $this->db_query = $db_qery;
                $this->name = $menu_name; 
                
                $this->sm = new Smarty;
                $this->sm->template_dir = DB_LIBS_TPL_DIR;
                $this->sm->compile_dir = SMARTY_COMPILE_DIR;
                
                $this->setup_menu_options();
    }
    
    function get_menu_str(){
	return $this->sm->fetch($this->template);
    }
    
    function setup_menu_options(){
        $this->sm->assign(array("name"=>$this->name));
    }
};
?>

