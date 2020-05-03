<?php
namespace wabdo;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of DB_loadable
 *
 * @author victor.minghir
 */
class DB_loadable {
    //put your code here
    public $schema_name;
    public $table_name;
    public $loadable_id;
    
    private $loaded_arr = array();
    
    function __construct() {
        global $GLOBALS_OBJ;
	$this->globals = &$GLOBALS_OBJ;
    }
}
