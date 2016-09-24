<?php
require_once ("globals.php");

class DB_column_def{

		public $COLUMN_NAME;
		public $COLUMN_TYPE;
		public $COLUMN_SIZE;
                public $ACCEPT_NULL;
                public $DEFAULT_VAL;
                public $AUTOINCREMENT;
                
		//public $fk;
		//public $index;
		public $comment;
		//public $MYSQL_INDEX_TYPES = array();
		//public $MYSQL_COLUMN_TYPES =  array();
		
		//private $idx_str = "";
		//private $def_str = "";
		//private $ref_str = "";
		//private $default_val_str = "";

		function __construct($vname, $vtype, $vsize, $vnull = TRUE, $vdefault = '', $vautoincr = FALSE){
	
			global $GLOBALS_OBJ;
			$this->globals = $GLOBALS_OBJ;
	
			$this->COLUMN_NAME = $vname;
			$this->COLUMN_TYPE = $vtype;
			$this->COLUMN_SIZE = $vsize;
			$this->DEFAULT_VAL = $vdefault;
			
			$this->ACCEPT_NULL = $vnull;
                        $this->AUTOINCREMENT = $vautoincr;
                        
                        //$this->fk = $vfk;
			
			//$this->MYSQL_INDEX_TYPES = (new DB_list("list_index_types"))->getArray();
			//$this->MYSQL_COLUMN_TYPES = (new DB_list("list_mysql_column_types"))->getArray();

//			print_r($this->MYSQL_COLUMN_TYPES);
			
			return $this;
		}
		
		function get_column_str(){
                   // echo "aaa:" . (new DB_table("phpapps.mysql_column_defs"))->getValueByField("DEF_TPL","COLUMN_TYPE_ID", $this->COLUMN_TYPE);
                        //{$COLUMN_NAME} BIGINT({$COLUMN_SIZE} {if $ACCEPT_NULL === FALSE }NOT NULL{/if} {if $DEFAULT_VAL!= \"\" }{$DEFAULT_VAL} {/if} {if $AUTOINCREMENT === TRUE } AUTO_INCREMENT {/if}
			$this->globals->sm->assign("COLUMN_OBJ",$this);
                        
			return  $this->globals->sm->fetch(
                                   'string:'.  stripslashes((new DB_table("phpapps.mysql_column_defs"))->getValueByField("DEF_TPL","COLUMN_TYPE_ID", $this->COLUMN_TYPE))
                                );
		}
	}
?>