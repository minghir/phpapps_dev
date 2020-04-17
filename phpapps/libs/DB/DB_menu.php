<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once (PHPAPPS_LIBS_DIR . "HrefActions.php");

class menu_item{
    
    public $ID;
    public $ACTION;
    public $LABEL;
    
    function __construct($obj){
        $this->ID = $obj->ID;
        $this->ACTION = $obj->ACTION;
        $this->LABEL = $obj->LABEL;
    }
    
};

class DB_menu{
    
    private $globals;
    private $template = "db_menu.tpl";
    private $sm;
    
    public $menu_id;
    public $name;
    public $title;
    public $orientation;
    public $menu_type;
    public $db_query;
    public $menu_items;
    
    var $items = array();
    
    function __construct($m_id){
		global $GLOBALS_OBJ;
                $this->globals = &$GLOBALS_OBJ;
                
                $this->menu_id = $m_id;
                //$this->name = $menu_name; 
                
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
        $sql = new DB_query("SELECT NAME,MENU_TITLE,MENU_TYPE,ORIENTATION FROM phpapps.view_menus WHERE ID = :menu_id",array(":menu_id"=>$this->menu_id));
        $this->globals->con->query($sql);	
        $tmp_data_obj = $this->globals->con->fetch_object();
        $this->name = $tmp_data_obj->NAME;
        $this->title = $tmp_data_obj->MENU_TITLE;
        $this->menu_type = $tmp_data_obj->MENU_TYPE;
        $this->orientation = $tmp_data_obj->ORIENTATION;
        
        if($this->menu_type == "STATIC"){
            $sql = new DB_query("SELECT ID,ACTION,LABEL FROM phpapps.menu_items WHERE MENU_ID = :menu_id",array(":menu_id"=>$this->menu_id));
            $this->globals->con->query($sql);
            while($tmp_data_obj = $this->globals->con->fetch_object()){
                $this->menu_items[] = new  menu_item($tmp_data_obj);
            }
        }else{
            
        }
    }
};
?>

