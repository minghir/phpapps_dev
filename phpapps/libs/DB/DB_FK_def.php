<?php
require_once ("globals.php");
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of DB_list_def
 *
 * @author victor.minghir
 */
class DB_FK_def {
    //put your code here
    public $SCHEMA_NAME = "";
    public $TABLE_NAME = "";
    public $COLUMN_NAME = "";
    
    public $FK_SCHEMA_NAME = "";
    public $FK_TABLE_NAME = "";
    public $FK_COLUMN_NAME = "";
    public $FK_NAME = "";
    
    public $ON_DELETE_OPT = "";
    public $ON_UPDATE_OPT = "";
    
    //OPTIONS        
    //RESTRICT | CASCADE | SET NULL | NO ACTION
    
    function __construct($scm_name,$tbl_name,$col_name,$fk_scm_name,$fk_tbl_name,$fk_col_name) {
        
        global $GLOBALS_OBJ;
        $this->globals = &$GLOBALS_OBJ;
        
        $this->SCHEMA_NAME = $scm_name;
        $this->TABLE_NAME = $tbl_name;
        $this->COLUMN_NAME = $col_name;
        
        $this->FK_SCHEMA_NAME = $fk_scm_name;
        $this->FK_TABLE_NAME = $fk_tbl_name;
        $this->FK_COLUMN_NAME = $fk_col_name;
        
        $this->FK_NAME = $this->SCHEMA_NAME . "_" . $this->TABLE_NAME . "_" . $this->COLUMN_NAME . "_FK";

        return $this;
    }
    
    function setOnDeleteOpt($opt){
        $this->ON_DELETE_OPT = $opt;
    }
    
    function setOnUpdateOpt($opt){
        $this->ON_UPDATE_OPT = $opt;
    }
    
    function getFKDef(){
        $this->globals->sm->assign("FK_OBJ",$this);
	return  $this->globals->sm->fetch(
                         'string:'.  stripslashes((new DB_table("phpapps.sql_sintax"))->getValueByField("DEF_TPL","SINTAX_TYPE_ID", (new DB_list("phpapps.list_sql_sintax_types"))->getID("FOREIGN_KEY_DEF"))));
        
    }
    
    
    
}
