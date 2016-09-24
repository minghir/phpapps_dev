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
class DB_list_def {
    //put your code here
    
    public $SCHEMA_NAME = "";
    public $LIST_NAME = "";
    private $columns = array();
    private $indexes = array();
            
    function __construct($schema_name,$list_name) {
        $this->SCHEMA_NAME = $schema_name;
        $this->LIST_NAME = $list_name;
        return $this;
    }
    /*
    function createList(){
            
        //$sm->fetch(create table);
    }
    */
    
    function createList(){
        //($vname, $vtype, $vsize, $vnull=true, $vautoincr=false, $vdefault="", $vfk = "")
        $this->columns[] = new DB_column_def("ID",
                                (new DB_list("list_mysql_column_types"))->getID("BIGINT"),
                                "20",
                                false,
                                false,
                                "0"
                                );
        $this->columns[] = new DB_column_def("VALUE",
                                (new DB_list("list_mysql_column_types"))->getID("VARCHAR"),
                                "20",
                                false,
                                false,
                                "0"
                                );
        $this->columns[] = new DB_column_def("DESCRIPTION",
                                (new DB_list("list_mysql_column_types"))->getID("VARCHAR"),
                                "255",
                                true,
                                false,
                                "0"
                                );
    }
    
}
