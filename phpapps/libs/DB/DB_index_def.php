<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of DB_index_def
 *
 * @author victor.minghir
 */
class DB_index_def {
    //put your code here
    public $SCHEMA_NAME;
    public $TABLE_NAME;
    public $INDEX_NAME;
    public $INDEX_TYPE;
    public $columns = array();
    
    function __construct($schema_name,$table_name,$index_type,$columns) {
        //"CREATE INDEX $SCHEMA_NAME_$TABLE_NAME_$COLUMN_NAME_IDX ON $SCHEMA_NAME.$TABLE_NAME ($COLUMNS)"
        $this->SCHEMA_NAME = $schema_name;
        $this->TABLE_NAME = $table_name;
        $this->INDEX_TYPE = $index_type;
        $this->columns = $columns;
        
        
        $this->INDEX_NAME = $this->SCHEMA_NAME ."_".$this->TABLE_NAME . "_" . implode("_",$this->columns) . "_IDX";
        
    }
    
    function createIndex(){
        
        $sql = new DB_query("CREATE " . $this->INDEX_TYPE . " " . $this->INDEX_NAME . " ON $SCHEMA_NAME.$TABLE_NAME ($COLUMNS)");
        
    }
    
    function dropIndex(){
        
    }
    
    function recreateIndex(){
        $this->dropIndex();
        $this->createIndex();
    }
}
