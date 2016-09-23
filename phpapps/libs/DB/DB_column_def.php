<?php
require_once ("globals.php");

class DB_column_def{

		public $name;
		public $type;
		public $size;

                public $accept_null;

                public $default_val;
		public $fk;
		//public $index;
		public $comment;
		//public $MYSQL_INDEX_TYPES = array();
		public $MYSQL_COLUMN_TYPES =  array();
		
		//private $idx_str = "";
		private $def_str = "";
		private $ref_str = "";
		private $default_val_str = "";

		function __construct($vname,$vtype,$vsize,$vnull=true,$vdefault="",$vfk = ""){
	
			global $GLOBALS_OBJ;
			$this->globals = $GLOBALS_OBJ;
	
			$this->name = $vname;
			$this->type = $vtype;
			$this->size = $vsize;
			$this->default_val = $vdefault;
			$this->fk = $vfk;
			$this->accept_null = $vnull;
			
			//$this->MYSQL_INDEX_TYPES = (new DB_list("list_index_types"))->getArray();
			$this->MYSQL_COLUMN_TYPES = (new DB_list("list_mysql_column_types"))->getArray();

//			print_r($this->MYSQL_COLUMN_TYPES);
			
			return $this;
		}
		
		function get_column_str(){
			$def = $this->column_str();
			//$idx = $this->index_str();
			return  $def . $this->default_val_str . $idx;
		}
		
                /*
		function index_str(){
		
			switch($this->index){
				case 1:
					$this->idx_str .= " AUTO_INCREMENT PRIMARY KEY";
					$this->default_val_str = "";
				break;
				case 2:
					$this->idx_str .= " UNIQUE KEY (" . $this->name .")";
				break;
				case 3:
					$this->idx_str .= " KEY (" . $this->name .")";
				break;
				case 4:
				break;
				default:
				break;
			}
			return $this->idx_str;
		}
		*/
                
		function reference_str(){
			$this->ref_str = "";
			if($this->fk != ''){
				$this->ref_str = " FOREIGN KEY (".$this->name.") REFERENCES ".$this->fk."(ID) ";
			}
			
			 return $this->ref_str;
		}
		
		function column_str(){
		//ID bigint(20) NOT NULL auto_increment,
		//sampleid INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
			//echo "AOOOOOO:" . $this->type ."<br>";
			switch ($this->type){
				case '1':
				case '2':
				case '3':
				case '4':
				case '5':
				case '6':
					$this->def_str = $this->name ." ". $this->MYSQL_COLUMN_TYPES[$this->type] . 
					"(".$this->size.")";
					$this->default_val_str = " NOT NULL DEFAULT '" . ( $this->default_val == '' ? '0' : $this->default_val )  ."'"; 
					//$this->def_str = " NOT NULL DEFAULT '" . $this->default_val ."'"; 
				break;
				case '7':
				case '8':
					$this->def_str = $this->name ." ". $this->MYSQL_COLUMN_TYPES[$this->type] . 
					"(".$this->size.")";
					$this->default_val_str = " NOT NULL "; 
				break;
				default:
					$this->def_str = $this->name ." ". $this->MYSQL_COLUMN_TYPES[$this->type];
					$this->default_val_str = " NOT NULL DEFAULT '" . $this->default_val ."'"; 
				break;
			}
			
			
			
			
			//$ref_str =  $this->fk == "" ? "" : " FOREIGN KEY REFERENCES ".$this->fk." (ID)";
	//		print_r($this->MYSQL_COLUMN_TYPES);
			$this->def_str = $this->name ." ". 
				$this->MYSQL_COLUMN_TYPES[$this->type] 
				.( $this->size != "" ? "(".$this->size.")" : "" );
		//	echo "<br>AICI|".$this->type."|" .$this->MYSQL_COLUMN_TYPES[$this->type]  . "|  " . $str ."<br>";	
			return $this->def_str;
		}
	}
?>