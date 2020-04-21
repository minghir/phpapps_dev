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
    private $template;
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
                $this->sm->template_dir = CURRENT_APP_TPL_DIR . DIR_SEP . 'menus' . DIR_SEP;
                $this->sm->compile_dir = SMARTY_COMPILE_DIR;
                
                $this->setup_menu_options();
    }
    
    function set_menu_query($db_q){
        $this->db_query = $db_q;
    }
    
    function get_menu_str(){
        $this->sm->assign(array("menu_obj"=>$this));
	return $this->sm->fetch($this->template . '.tpl');
    }
    
    function setup_menu_options(){
        $sql = new DB_query("SELECT ID,NAME,MENU_TITLE,MENU_TYPE,ORIENTATION,QUERY_BODY,QUERY_ID,TEMPLATE_FILE FROM phpapps.view_menus WHERE ID = :menu_id",array(":menu_id"=>$this->menu_id));
        //echo $sql->prnt() . "<br>";
        $this->globals->con->query($sql);	
        $tmp_data_obj = $this->globals->con->fetch_object();
        $this->menu_id = $tmp_data_obj->ID;
        $this->name = $tmp_data_obj->NAME;
        $this->title = $tmp_data_obj->MENU_TITLE;
        $this->menu_type = $tmp_data_obj->MENU_TYPE;
        $this->orientation = $tmp_data_obj->ORIENTATION;
        $this->template = $tmp_data_obj->TEMPLATE_FILE;
        
       
        
        $MENU_ID =  $this->menu_id;
        $SERVER_HOST_NAME = SERVER_HOST_NAME;
        $sql2 = new DB_query("SELECT PARAMETER_NAME, PARAMETER_VALUE FROM phpapps.query_parameters WHERE QUERY_ID = :query_id",
                            array(":query_id"=>$tmp_data_obj->QUERY_ID));
        
        $this->globals->con->query($sql2,"sql2");
        while($res = $this->globals->con->fetch_array("sql2") ){
            $query_parameters[$res["PARAMETER_NAME"]] = $res["PARAMETER_VALUE"][0] == '$' ? ${ltrim($res["PARAMETER_VALUE"],'$')} : $res["PARAMETER_VALUE"];
        }
        
        $this->from_str = (new DB_query(stripslashes($tmp_data_obj->QUERY_BODY),$query_parameters))->prnt();
        $this->menu_items = $this->recursive_load_sub_items();
        
    }
    
    function recursive_load_sub_items($pid = 0){
            $ssub_menu_items = array();
            $sql2 = new DB_query("SELECT ID,PID,ACTION,LABEL FROM ( ".$this->from_str." ) AS menu_items WHERE PID = :pid",array(":pid"=>$pid));
            
            //echo $sql2->prnt() ."<br><br>";
            
            $this->globals->con->query($sql2,"sub".$pid);
            while($tmp_data_obj2 = $this->globals->con->fetch_object("sub".$pid)){
                $tmp_menu_item = new  menu_item($tmp_data_obj2);
                //echo "INCARC:pt pid" .$tmp_data_obj2->ID ."<br>";
                $tmp_menu_item->menu_items = $this->recursive_load_sub_items($tmp_data_obj2->ID);
                $ssub_menu_items[] = $tmp_menu_item;
            }
            return $ssub_menu_items;
    }
};
?>

