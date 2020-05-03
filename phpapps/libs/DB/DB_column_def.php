<?php
namespace wabdo;
require_once ("globals.php");

class DB_column_def{

		public $COLUMN_NAME;
		public $COLUMN_TYPE;
		public $COLUMN_SIZE;
                public $ACCEPT_NULL;
                public $DEFAULT_VAL;
                public $UNSIGNED = TRUE;
		
		public $comment;

		function __construct($vname, $vtype, $vsize, $vnull = TRUE, $vdefault = ''){
	
			global $GLOBALS_OBJ;
			$this->globals = $GLOBALS_OBJ;
	
			$this->COLUMN_NAME = $vname;
			$this->COLUMN_TYPE = $vtype;
			$this->COLUMN_SIZE = $vsize;
                        $this->ACCEPT_NULL = $vnull;
			$this->DEFAULT_VAL = $vdefault;
			
			return $this;
		}
                
                function getColumnName(){
                    return $this->COLUMN_NAME;
                }
                
                function getColumnType(){
                    return $this->COLUMN_TYPE;
                }
                
                function getColumnSize(){
                    return $this->COLUMN_SIZE;
                }
                
                function getColumnAcceptNull(){
                    return $this->ACCEPT_NULL;
                }
		
                function getColumnDefaultVal(){
                    return $this->DEFAULT_VAL;
                }
                
                 function setColumnName($vname){
                    $this->COLUMN_NAME = $vname;
                }
                
                function setColumnType($vtype){
                    $this->COLUMN_TYPE = $vtype;
                }
                
                function setColumnSize($vsize){
                    $this->COLUMN_SIZE = $vsize;
                }
                
                function setColumnAcceptNull($vnull){
                    $this->ACCEPT_NULL = $vnull;
                }
		
                function setColumnDefaultVal($vdefault){
                    $this->DEFAULT_VAL = $vdefault;
                }
                
		function getColumnDef(){
			$this->globals->sm->assign("COLUMN_OBJ",$this);
			return  $this->globals->sm->fetch(
                                   'string:'.  stripslashes((new DB_table("phpapps.mysql_column_defs"))->getValueByField("DEF_TPL","COLUMN_TYPE_ID", $this->COLUMN_TYPE))
                                );
		}
	}
?>