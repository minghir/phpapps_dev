<?php
require_once ("globals.php");

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