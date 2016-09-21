<?php
/*
$MYSQL_COLUMN_TYPES[1]="TINYINT"; 
$MYSQL_COLUMN_TYPES[2]="SMALLINT"; 
$MYSQL_COLUMN_TYPES[3]="MEDIUMINT"; 
$MYSQL_COLUMN_TYPES[4]="INTEGER"; 
$MYSQL_COLUMN_TYPES[5]="BIGINT"; 
$MYSQL_COLUMN_TYPES[6]="NUMERIC"; 
$MYSQL_COLUMN_TYPES[7]="VARCHAR"; 
$MYSQL_COLUMN_TYPES[8]="TEXT"; 

$MYSQL_INDEX_TYPES[1]="PRIMARY"; 
$MYSQL_INDEX_TYPES[2]="UNIQUE"; 
$MYSQL_INDEX_TYPES[3]="INDEX"; 
$MYSQL_INDEX_TYPES[4]="FULLTEXT";
$MYSQL_INDEX_TYPES[5]="NONE";
*/
require_once ("globals.php");

class DB_column_def{

		public $name;
		public $type;
		public $size;
		public $default_val;
		public $fk;
		public $index;
		public $comment;
		public $MYSQL_INDEX_TYPES = array();
		public $MYSQL_COLUMN_TYPES =  array();
		
		private $idx_str = "";
		private $def_str = "";
		private $ref_str = "";
		private $default_val_str = "";

		function __construct($vname,$vtype,$vsize,$vdefault="",$vfk = "", $vindex=""){
	
			global $GLOBALS_OBJ;
			$this->globals = $GLOBALS_OBJ;
	
			$this->name = $vname;
			$this->type = $vtype;
			$this->size = $vsize;
			$this->default_val = $vdefault;
			$this->fk = $vfk;
			$this->index = $vindex;
			
			$this->MYSQL_INDEX_TYPES = (new DB_list("list_index_types"))->getArray();
			$this->MYSQL_COLUMN_TYPES = (new DB_list("list_mysql_column_types"))->getArray();

//			print_r($this->MYSQL_COLUMN_TYPES);
			
			return $this;
		}
		
		function get_column_str(){
			$def = $this->column_str();
			$idx = $this->index_str();
			return  $def . $this->default_val_str . $idx;
		}
		
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
			echo "AOOOOOO:" . $this->type ."<br>";
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
	};
	


class DB_table_def{
	public $schema;
	public $table_name;
	public $description;
	public $columns = array();
        public $auditable = "true";

	function __construct($tschm,$tname){
		$this->schema = $tschm;
		$this->table_name = $tname;
	}
	
	function add_column_def($vname,$vtype,$vsize,$vdefault="",$vfk = "", $vindex=""){
		$this->columns[] = new DB_column_def($vname,$vtype,$vsize,$vdefault,$vfk,$vindex);
	}
	
	function get_create_str(){
		
		for($i = 0; $i < count($this->columns); $i++){
			$str_cols[] = $this->columns[$i]->get_column_str();// . ( ($i == count($this->columns) -1 ) ? "" :"," );
			
			if ( $this->columns[$i]->fk != "" ){
				  $str_fk[] = " FOREIGN KEY (".$this->columns[$i]->name.") REFERENCES ".$this->columns[$i]->fk."(ID) ";
			}else{
			}
		}
                if($this->auditable){
                    $str_cols[] = "MODIFY_UID bigint(20) not null default '1'";
                    $str_cols[] = "CREATE_UID bigint(20) not null default '1'";
                    $str_cols[] = "MODIFY_DATE timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP";
                    $str_cols[] = "CREATE_DATE timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP";
		
                    $str_fk[] = "FOREIGN KEY (MODIFY_UID) REFERENCES phpapps.users(ID)";
                    $str_fk[] = "FOREIGN KEY (CREATE_UID) REFERENCES phpapps.users(ID)";
                }
                
                $str_cols_tot = implode(',',$str_cols);
                
                if(count($str_fk) > 0 ){
                    $str_fk_tot = implode(',',$str_fk);
                }
		
		
		
		$str = "CREATE TABLE IF NOT EXISTS " .$this->schema .".".$this->table_name ."(" . $str_cols_tot . ($str_fk_tot == "" ? "" : ",") . $str_fk_tot .
		") ENGINE=InnoDB";
		
		return $str;
	}
};
?>