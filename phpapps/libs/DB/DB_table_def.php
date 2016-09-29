<?php
require_once ("globals.php");

class DB_table_def{
        public $globals;
	public $TABLE_SCHEMA;
	public $TABLE_NAME;
        
        public $CURRENT_COLUMN;
        public $NEW_TABLE_NAME;
        public $ADD_COL_AFTER = "ID";
        
	public $columns = array();
        public $auditable = "true"; 
        public $foreign_keys = array();
        
        public $errors = array();
        
        public $CURRENT_FK;
        

	function __construct($tschm,$tname,$auditbl = TRUE){
                global $GLOBALS_OBJ;
		$this->globals = &$GLOBALS_OBJ;
                        
		$this->TABLE_SCHEMA = $tschm;
		$this->TABLE_NAME = $this->NEW_TABLE_NAME = $tname;
                $this->auditable = $auditbl;
	}
	
        public function getErrors(){
            return $this->errors;
        }

        private function execQuery($sql_sintax){
            $this->globals->sm->assign("TABLE_OBJ",$this);
                $sql = new DB_query($this->globals->sm->fetch(
                         'string:'.  stripslashes((new DB_table("phpapps.sql_sintax"))->getValueByField("DEF_TPL","SINTAX_TYPE_ID", (new DB_list("phpapps.list_sql_sintax_types"))->getID($sql_sintax))))
                     );
echo "<br>".$sql->sql();
               if( $this->globals->con->query($sql) != -1){
                   return TRUE;
               }else{
                   $this->errors[] = $this->globals->con->get_error();
                   return FALSE;
               }
        }
        
        function getColDef($col_name){
            $col_tofind = NULL;
            for($i = 0; $i < count($this->columns); $i++){
                if($this->columns[$i]->getColumnName() == $col_name){
                    $col_tofind = $this->columns[$i];
                    break;
                }
            }
            return $col_tofind;
        }
        
        function getColIdx($col_name){
            for($i = 0 ; $i<count($this->columns); $i++){
                if($this->columns[$i]->getColumnName() == $col_name){
                    return $i;
                }else{
                    return -1;
                }
            }
        }

        //($vname, $vtype, $vsize, $vnull = TRUE, $vdefault = '', $vautoincr = FALSE){
	function addColumn($vname,$vtype,$vsize,$vnull,$vdefault="",$vautoincr){
		$col_obj = $this->columns[] = new DB_column_def($vname, $vtype, $vsize, $vnull, $vdefault, $vautoincr);
                return $col_obj;
	}
                
        function createTable(){
            return $this->execQuery("CREATE_TABLE");
        }
        
        function createIDTable(){
                $this->addColumn("ID",
                                (new DB_list("list_mysql_column_types"))->getID("BIGINT"),
                                "20",
                                false,
                                "",
                                false
                                );
                
                if($this->execQuery("CREATE_TABLE")){
                    return $this->alterTblAddPK("ID");
                }else{
                    return FALSE;
                }
        }
        
        function dropTable(){
                return $this->execQuery("DROP_TABLE");
        }
        
        function alterTblRenameTbl($new_name){
            $this->NEW_TABLE_NAME = $new_name;
            return $this->execQuery("ALTER_TBL_REN_TBL");
        }
        
        function alterTblAddPK($col_name){
            $this->CURRENT_COLUMN = $this->getColDef($col_name);
            // daca e null trebuie sa returneze FALSE
            
            $this->CURRENT_COLUMN->setColumnAcceptNull(FALSE);
            $this->CURRENT_COLUMN->setColumnDefaultVal("");
            return $this->execQuery("ALTER_TABLE_ADD_PK");
        }
        
        
        function alterTblAddFK($col_name,$fk_schema,$fk_table,$fk_fld="ID"){
            $this->CURRENT_FK =  new DB_FK_def($this->TABLE_SCHEMA,
                                                  $this->TABLE_NAME,
                                                  $col_name,
                                                  $fk_schema,
                                                  $fk_table,
                                                  $fk_fld
                    );
            
            $this->foreign_keys[] = $this->CURRENT_FK;
            $this->CURRENT_COLUMN = $this->getColDef($col_name);
            
            return $this->execQuery("ALTER_TABLE_ADD_FK");
        }
        
        function alterTblDropPK($field){
            return $this->execQuery("ALTER_TABLE_DROP_PK");
        }
        
        function alterTblDropFK($col_name){
            if(count($this->columns) == 0){
                $this->CURRENT_COLUMN = new DB_column_def($col_name, "", "");
            }else{
                $this->CURRENT_COLUMN = $this->getColDef($col_name);
            }
            
            return $this->execQuery("ALTER_TABLE_DROP_FK");
            // trebuie si alter table drop index : phpapps_test_def_APP_ID_FK
        }
        
        function alterTblAddCol($vname,$vtype,$vsize,$vnull,$vdefault="",$vautoincr=FALSE,$vafter="ID"){
            $this->ADD_COL_AFTER = $vafter;
            $this->CURRENT_COLUMN = $this->addColumn($vname, $vtype, $vsize, $vnull,$vdefault,$vautoincr);
            return $this->execQuery("ALTER_TABLE_ADD_COL");
        }
        
        function alterTblDropCol($col_name){
            if(count($this->columns) == 0){
                $this->CURRENT_COLUMN = new DB_column_def($col_name, "", "");
            }else{
                $this->CURRENT_COLUMN = $this->getColDef($col_name);
            }
            
            if($this->execQuery("ALTER_TABLE_DROP_COL")){
                unset($this->columns[$this->getColIdx($col_name)]); 
                $this->columns = array_values($this->columns);
                $this->CURRENT_COLUMN = NULL;
                return TRUE;
            }else{
                return FALSE;
            }
        }
}
?>