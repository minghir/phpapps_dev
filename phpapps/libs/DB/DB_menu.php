<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once (PHPAPPS_LIBS_DIR . "HrefActions.php");

class menu_item{
    
    public $ID;
    public $PID;
    public $ACTION;
    public $LABEL;
    //public $sub_menu_items = array ();
    public $menu_items = array ();
    
    function __construct($obj){
        $this->ID = $obj->ID;
        $this->PID = $obj->PID;
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
    
    private $from_str = "phpapps.menu_items";
    
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
        $sql = new DB_query("SELECT NAME,MENU_TITLE,MENU_TYPE,ORIENTATION,QUERY_BODY FROM phpapps.view_menus WHERE ID = :menu_id",array(":menu_id"=>$this->menu_id));
        $this->globals->con->query($sql);	
        $tmp_data_obj = $this->globals->con->fetch_object();
        $this->name = $tmp_data_obj->NAME;
        $this->title = $tmp_data_obj->MENU_TITLE;
        $this->menu_type = $tmp_data_obj->MENU_TYPE;
        $this->orientation = $tmp_data_obj->ORIENTATION;
        
        if($this->menu_type == "STATIC"){
            $this->from_str = "phpapps.menu_items";
            $sql = new DB_query("SELECT ID,PID,ACTION,LABEL FROM ".$this->from_str." WHERE PID = '0' AND MENU_ID = :menu_id",array(":menu_id"=>$this->menu_id));
        }else{
            $this->from_str = " ( ". $tmp_data_obj->QUERY_BODY ." ) AS menu_items ";
            //$this->from_str = $tmp_data_obj->QUERY_BODY;
            $sql = new DB_query("SELECT ID,PID,ACTION,LABEL FROM ".$this->from_str." WHERE PID = '0'" );
        }
        
        $this->globals->con->query($sql);
        echo $sql->prnt();
        while($tmp_data_obj = $this->globals->con->fetch_object()){
            $tmp_menu_item = new  menu_item($tmp_data_obj);
            //$tmp_menu_item->sub_menu_items = $this->recursive_load_sub_items($tmp_data_obj->ID);
            $tmp_menu_item->menu_items = $this->recursive_load_sub_items($tmp_data_obj->ID);
            $this->menu_items[] = $tmp_menu_item;
        }
        //print_r($this->menu_items);
    }
    
    function recursive_load_sub_items($pid){
            $ssub_menu_items = array();
             $sql2 = new DB_query("SELECT ID,PID,ACTION,LABEL FROM ".$this->from_str." WHERE PID = :pid",array(":pid"=>$pid));
             //echo "<h1>".$sql2->prnt()."|sub_".$pid."<br></h1>";
                $this->globals->con->query($sql2,"sub".$pid);
                while($tmp_data_obj2 = $this->globals->con->fetch_object("sub".$pid)){
                    $tmp_menu_item = new  menu_item($tmp_data_obj2);
                    //echo "INCARC:pt pid" .$tmp_data_obj2->ID ."<br>";
                    //$tmp_menu_item->sub_menu_items = $this->recursive_load_sub_items($tmp_data_obj2->ID);
                    $tmp_menu_item->menu_items = $this->recursive_load_sub_items($tmp_data_obj2->ID);
                      $ssub_menu_items[] = $tmp_menu_item;
                }
            return $ssub_menu_items;
    }
};
?>

