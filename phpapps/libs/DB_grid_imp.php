<?php
namespace wabdo;
//require_once ("globals.php");
//require_once (PHPAPPS_LIBS_DIR . "template.php");
//require_once(DB_LIBS_DIR . 'DB_grid_v4.php');
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of grid_imp
 *
 * @author goaga
 */
class DB_grid_imp{// extends template{
    
    public $ID;
    public $GRID_NAME;
    public $GRID_TITLE;
    public $GRID_TYPE;
    public $TABLE_ID;
    public $QUERY_ID;
    public $EDITABLE;
    public $FILTERABLE;
    public $PAGINABLE;
    public $EXPORTABLE;
    public $EDIT_FORM_ID;
    public $ROWS_ON_PAGE;
    public $ELEMENT_TEMPLATE_ID;
    public $EDIT_FORM_RUN_PATH;
    public $EDIT_FORM_FILE_NAME;
    public $TABLE_NAME;
    public $TEMPLATE_NAME;
    public $GRID_COLS =  array();
    
    
    public $grid_obj;
    //public $globals;
    
    public function __construct($grid_id){
      //  parent::__construct();
         global $GLOBALS_OBJ;
        $this->globals = &$GLOBALS_OBJ;
        
        $this->ID = $grid_id;
        $this->loadDbGrid();
        
    }
    
    public function loadDbGrid(){
        
        $sql = new DB_query("SELECT     ID,
                    GRID_NAME,
                    GRID_TITLE,
                    GRID_TYPE,
                    TABLE_ID,
                    QUERY_ID,
                    EDITABLE,
                    FILTERABLE,
                    PAGINABLE,
                    EXPORTABLE,
                    SORTABLE,
                    EDIT_FORM_ID,
                    ROWS_ON_PAGE,
                    ELEMENT_TEMPLATE_ID,
                    EDIT_FORM_FILE_NAME,
                    TABLE_NAME,
                    TEMPLATE_NAME
        FROM phpapps.view_grids WHERE ID = :grid_id", array(':grid_id'=>$this->ID));
      // echo $sql->prnt();
       
        if( $this->globals->con->query($sql) == 1){
           
            $res_obj = $this->globals->con->fetch_object();
                    
                    $this->GRID_NAME = $res_obj->GRID_NAME;
                    $this->GRID_TITLE = $res_obj->GRID_TITLE;
                    $this->GRID_TYPE = $res_obj->GRID_TYPE;
                    $this->TABLE_ID = $res_obj->TABLE_ID;
                    $this->QUERY_ID = $res_obj->QUERY_ID;
                    $this->EDITABLE = $res_obj->EDITABLE;
                    $this->FILTERABLE = $res_obj->FILTERABLE;
                    $this->PAGINABLE = $res_obj->PAGINABLE;
                    $this->EXPORTABLE = $res_obj->EXPORTABLE;
                    $this->EDIT_FORM_ID = $res_obj->EDIT_FORM_ID;
                    $this->ROWS_ON_PAGE = $res_obj->ROWS_ON_PAGE;
                    $this->ELEMENT_TEMPLATE_ID = $res_obj->ELEMENT_TEMPLATE_ID;
                    $this->EDIT_FORM_RUN_PATH = $res_obj->EDIT_FORM_RUN_PATH;
                    $this->EDIT_FORM_FILE_NAME = $res_obj->EDIT_FORM_FILE_NAME;
                    $this->TABLE_NAME = $res_obj->TABLE_NAME;
                    $this->SORTABLE = $res_obj->SORTABLE;
                    $this->TEMPLATE_NAME = $res_obj->TEMPLATE_NAME . '.tpl';
             
             
                          
            switch($this->GRID_TYPE){
                case "table":
                    $this->grid_obj = new DB_grid($this->globals->con, $this->GRID_TYPE, $this->TABLE_NAME ,$this->GRID_NAME);
                     $sql = new DB_query("SELECT COLUMN_NAME, ALT_COLUMN_TEXT, LABEL, ACTION FROM phpapps.view_grid_columns WHERE GRID_ID=:grid_id",array(":grid_id"=>$this->ID));
                     if( $this->globals->con->query($sql) > 0){
                         $tmp_cols = array();
                         $tmp_labels = array();
                         $tmp_cell_act = array();
                        while($tmp_obj = $this->globals->con->fetch_object()){
                            //echo $sql->prnt();
                            $this->GRID_COLS[$tmp_obj->LABEL] = $tmp_obj->ALT_COLUMN_TEXT != '' ? $tmp_obj->ALT_COLUMN_TEXT : $tmp_obj->COLUMN_NAME;
                            $tmp_cols[] = stripslashes($tmp_obj->ALT_COLUMN_TEXT != '' ? $tmp_obj->ALT_COLUMN_TEXT : $tmp_obj->COLUMN_NAME);
                            $tmp_labels[] = stripslashes($tmp_obj->LABEL);
                            $tmp_cell_act[] = stripslashes($tmp_obj->ACTION);
                        }
                        $this->grid_obj->cols = $tmp_cols;
                        $this->grid_obj->labels = $tmp_labels;
                        $this->grid_obj->cell_actions = $tmp_cell_act;
                        //print_r($this->grid_obj->cols);
                     }
                break;
                
                case "list":
                    $this->grid_obj = new DB_grid($this->globals->con, "table", $this->TABLE_NAME ,$this->GRID_NAME);
                    $this->grid_obj->grid_type = "table";
                    $this->grid_obj->cols = array("VALUE","DESCRIPTION");
                    $this->grid_obj->labels = array("NAME","DESCRIPTION");
                    //$this->grid_obj->cell_actions = array();
                break;
            
                case "view":
                    $this->grid_obj = new DB_grid($this->globals->con, "table", $this->TABLE_NAME ,$this->GRID_NAME);
                break;
                
                case "query":
                    $this->grid_obj = new DB_grid($this->globals->con, "query",(new DB_query(_tbl("phpapps.queries","QUERY_BODY",$this->QUERY_ID))) ,$this->GRID_NAME);
                break;
            
                default:
                break;
             }
             
             $this->grid_obj->grid_title = $this->GRID_TITLE;
             $this->grid_obj->editable = boolval($this->EDITABLE);
             $this->grid_obj->filterable = boolval($this->FILTERABLE);
             $this->grid_obj->paginable = boolval($this->PAGINABLE);
             $this->grid_obj->exportable = boolval($this->EXPORTABLE);
             $this->grid_obj->sortable = boolval($this->SORTABLE);
             //$this->grid_obj->edit_form = $this->EDIT_FORM_FILE_NAME . "_imp.php";
             $this->grid_obj->edit_form = $this->EDIT_FORM_FILE_NAME . ".php";
             $this->grid_obj->rows_on_pg = $this->ROWS_ON_PAGE; 
             $this->grid_obj->template = $this->TEMPLATE_NAME;
             
             
             
             $sql = new DB_query("SELECT NAME, LABEL, ACTION, ACTION_SCRIPT, POPUP_PAGE, GRID_ACTION_TYPE_ID FROM phpapps.grid_actions WHERE GRID_ID=:grid_id",array(":grid_id"=>$this->ID));
             if( $this->globals->con->query($sql) > 0){
                 while($tmp_obj = $this->globals->con->fetch_object()){
                    $tad = new HrefActions();
                    $tad->act_script = $tmp_obj->ACTION_SCRIPT;
                    $tad->popup = boolval($tmp_obj->POPUP_PAGE);
                    $tad->label = $tmp_obj->LABEL;
                    $tad->act_script = $tmp_obj->ACTION_SCRIPT;
                    $tad->action = $tmp_obj->ACTION;
                    $tad->fields = array("ID");
                    
                    if($tmp_obj->GRID_ACTION_TYPE_ID == '1'){
                        $this->grid_obj->add_grid_acction($tad);
                    }else{
                        $this->grid_obj->add_row_acction($tad);
                    }
                 }
             }
             
             
             /*
             $sql = new DB_query("SELECT COLUMN_NAME, ALT_COLUMN_TEXT, LABEL, ACTION FROM phpapps.view_grid_columns WHERE GRID_ID=:grid_id",array(":grid_id"=>$this->ID));
             if( $this->globals->con->query($sql) > 0){
                 $tmp_cols = array();
                 $tmp_labels = array();
                 $tmp_cell_act = array();
                while($tmp_obj = $this->globals->con->fetch_object()){
                    //echo $sql->prnt();
                    $this->GRID_COLS[$tmp_obj->LABEL] = $tmp_obj->ALT_COLUMN_TEXT != '' ? $tmp_obj->ALT_COLUMN_TEXT : $tmp_obj->COLUMN_NAME;
                    $tmp_cols[] = stripslashes($tmp_obj->ALT_COLUMN_TEXT != '' ? $tmp_obj->ALT_COLUMN_TEXT : $tmp_obj->COLUMN_NAME);
                    $tmp_labels[] = stripslashes($tmp_obj->LABEL);
                    $tmp_cell_act[] = stripslashes($tmp_obj->ACTION);
                }
                $this->grid_obj->cols = $tmp_cols;
                $this->grid_obj->labels = $tmp_labels;
                $this->grid_obj->cell_actions = $tmp_cell_act;
                //print_r($this->grid_obj->cols);
             }
              * 
              */
        }
        
        //print_r($this);

    }
    
    function get_grid_str(){
        return $this->grid_obj->get_grid_str();
    }
}
