<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class phpapps_database_table_rescan_columns{// extends template{

    private $app_id;
    public $TABLE_ID;
    public $SCHEMA_NAME;
    public $TABLE_NAME;
    
                public $scrip_id = 184;
                public $display_objects_type_id = '2';
                public $display_objects_type = 'SCRIPT';
                public $display_objects_id = 184;
    
    function __construct($app_id) {
              //parent::__construct();
        global $GLOBALS_OBJ;
	$this->globals = &$GLOBALS_OBJ;
        
        echo "AAAAAAAAAAAA";

        $this->tpl = "phpapps_database_table_rescan_columns.tpl";        
        $this->app_id = $app_id;

       
        $this->TABLE_ID = $_GET["gfield_value"];
        $this->SCHEMA_NAME = (new DB_table("view_tables"))->getValue("TABLE_SCHEMA",$this->TABLE_ID);
        $this->TABLE_NAME = (new DB_table("view_tables"))->getValue("TABLE_NAME",$this->TABLE_ID);
        
        echo "AICI:" .$this->SCHEMA_NAME . "." . $this->TABLE_NAME . "<br>";
        
        // deleting Foreign KEYS
        $sql = new DB_query("DELETE FROM phpapps.table_fks WHERE COLUMN_ID IN (SELECT ID FROM phpapps.table_details WHERE TABLE_ID = :table_id)",
                    array(":table_id" => $this->TABLE_ID));
        if( ( $del_nr_fks = $this->globals->con->query($sql) ) == -1 ){
            echo "<h1> DEL FK ERROR:</h1><br>";
        }else{
            echo "<h1>DEL FK :" . $del_nr_fks . "</h1>";
        }
        
        // deleting Foreign INDEXES
        $sql = new DB_query("DELETE FROM phpapps.table_indexes WHERE TABLE_ID = :table_id",array(":table_id" => $this->TABLE_ID));
        if( ( $del_nr_idxs = $this->globals->con->query($sql) ) == -1 ){
            echo "<h1> DEL IDX ERROR:</h1><br>";
        }else{
            echo "<h1> DEL IDX: $del_nr_idxs </h1><br>";
        }
        
        // deleting TABLE DETAILS
        $sql = new DB_query("DELETE FROM phpapps.table_details WHERE TABLE_ID = :table_id",array(":table_id" => $this->TABLE_ID));
        if( ( $del_nr_cols = $this->globals->con->query($sql) ) == -1 ){
            $this->errors[] = "SQL error: (".$sql->sql().")" . $this->globals->con->get_error();	
            echo "<h1> DEL ERROR:<br>";
            print_r($this->errors);
            echo "<br><h1>". $sql->prnt() ."</h1><br>";
	}else{
                echo "<br> DELETED $nr_res ";
                
                // insert COLUMNS  table_details
                 $sql = new DB_query( "INSERT INTO phpapps.table_details 
                        (TABLE_ID,
                         COLUMN_NAME,
                         COLUMN_TYPE_ID,
                         UNSIGN,
                         COLUMN_SIZE,
                         ACCEPT_NULL,
                         COLUMN_DEFAULT_VALUE,
                         AUTOINCREMENT,
                         DESCRIPTION,
                         ORD,
                         MODIFY_UID,
                         CREATE_UID,
                         MODIFY_DATE,
                         CREATE_DATE)                         
                SELECT :table_id AS TABLE_ID, 
                         COLUMN_NAME,
                         (SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,
                         '0' AS UNSIGN,
                         SUBSTR(COLUMN_TYPE,LOCATE('(',COLUMN_TYPE)+1,LOCATE(')',COLUMN_TYPE) - LOCATE('(',COLUMN_TYPE)-1) as COLUMN_SIZE,
                         IF(IS_NULLABLE = 'NO',0,1) AS ACCEPT_NULL,
                         IFNULL(COLUMN_DEFAULT,'') AS COLUMN_DEFAULT_VALUE,
                         IF(EXTRA = 'auto_increment',1,0) AS AUTOINCREMENT,
                         COLUMN_COMMENT AS DESCRIPTION,
                         ORDINAL_POSITION AS ORD,
                         :user_id AS MODIFY_UID,
                         :user_id AS CREATE_UID,
                         NOW() AS MODIFY_DATE,
                         NOW() AS CREATE_DATE
                FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = :table_name and table_schema = :schema_name",
                      array(":table_id" => $this->TABLE_ID,
                             ":table_name" => $this->TABLE_NAME,
                             ":schema_name" => $this->SCHEMA_NAME,
                             ":user_id" => $this->globals->USER_ID  ));
                
                 echo "<br><h1>". $sql->prnt() ."</h1><br>";
                
                    
                if( $ins_nr_cols = $this->globals->con->query($sql) == -1 ){
                    $this->errors[] = "SQL error: (".$sql->sql().")" . $this->globals->con->get_error();	
                }
                
                // insert Foreign KEYS
                $sql = new DB_query("INSERT INTO phpapps.table_fks (COLUMN_ID,FK_NAME,FK_TABLE_ID,FK_COLUMN_ID,MODIFY_UID,CREATE_UID,MODIFY_DATE,CREATE_DATE)
                                    SELECT 
                                    ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS COLUMN_ID,
                                    CONSTRAINT_NAME AS FK_NAME,
                                    (SELECT ID FROM phpapps.tables WHERE phpapps.tables.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND ORIGIN_ID = '0') AS FK_TABLE_ID,
                                    ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS FK_COLUMN_ID,
	                            :user_id AS MODIFY_UID,
                                    :user_id AS CREATE_UID,
                                    NOW() AS MODIFY_DATE,
                                    NOW() AS CREATE_DATE
                                    FROM
                                        INFORMATION_SCHEMA.KEY_COLUMN_USAGE where TABLE_SCHEMA = :schema_name AND table_name = :table_name AND REFERENCED_TABLE_NAME <> '' ",
                        array(":table_id" => $this->TABLE_ID,
                             ":table_name" => $this->TABLE_NAME,
                             ":schema_name" => $this->SCHEMA_NAME,
                             ":user_id" => $this->globals->USER_ID  ));
                echo $sql->prnt();
                if( $ins_nr_fks = $this->globals->con->query($sql) == -1 ){
                    $this->errors[] = "SQL error: (".$sql->sql().")" . $this->globals->con->get_error();	
                }
                
                // insert INDEXEZ
                $sql = new DB_query("INSERT INTO phpapps.table_indexes (
                                            TABLE_ID,	
                                            INDEX_NAME,	
                                            INDEX_TYPE_ID,	
                                            INDEX_COLUMNS,	
                                            DESCRIPTION,	
                                            MODIFY_UID,	CREATE_UID,	
                                            MODIFY_DATE,	
                                            CREATE_DATE)
                                    SELECT 
                                        :table_id AS TABLE_ID,
                                        s.INDEX_NAME,
                                        (SELECT i.ID FROM phpapps.list_index_types i WHERE i.VALUE =  IF(s.INDEX_NAME = 'PRIMARY','PRIMARY',IF(s.NON_UNIQUE = 1,IF(s.INDEX_TYPE = 'FULLTEXT','FULLTEXT','INDEX'),'UNIQUE')) ) AS INDEX_TYPE,
                                        GROUP_CONCAT(s.COLUMN_NAME) AS INDEX_COLUMNS,
                                        s.COMMENT AS DESCRIPTION,
                                        :user_id AS MODIFY_UID,
                                        :user_id AS CREATE_UID,
                                        NOW() AS MODIFY_DATE,
                                        NOW() AS CREATE_DATE
                                    FROM INFORMATION_SCHEMA.STATISTICS s
                                    WHERE s.TABLE_SCHEMA = :schema_name AND s.TABLE_NAME = :table_name GROUP BY s.INDEX_NAME,s.NON_UNIQUE,s.INDEX_TYPE,s.COMMENT",
                                    array(":table_id" => $this->TABLE_ID,
                             ":table_name" => $this->TABLE_NAME,
                             ":schema_name" => $this->SCHEMA_NAME,
                             ":user_id" => $this->globals->USER_ID  ));
                
/*SELECT 
                                        :table_id AS TABLE_ID,
                                        s.INDEX_NAME,
                                        IF(s.index_name = 'PRIMARY','PRIMARY',if(s.NON_UNIQUE = 1,IF(s.INDEX_TYPE = 'FULLTEXT','FULLTEXT','INDEX'),'UNIQUE')) AS INDEX_TYPE,
                                        GROUP_CONCAT(\"'\",s.COLUMN_NAME,\"'\") AS INDEX_COLUMNS,
--	(SELECT td.ID  from phpapps.table_details td 
			-- WHERE  td.TABLE_ID ='275' AND td.COLUMN_NAME IN  
				--		(SELECT bb.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS bb WHERE bb.INDEX_NAME = s.INDEX_NAME )) AS INDEX_COLUMNS
                                        s.COMMENT AS DESCRIPTION,
                                        :user_id AS MODIFY_UID,
                                        :user_id AS CREATE_UID,
                                        NOW() AS MODIFY_DATE,
                                        NOW() AS CREATE_DATE
                                    FROM INFORMATION_SCHEMA.STATISTICS s
                                    WHERE s.TABLE_SCHEMA = :schema_name AND s.TABLE_NAME = :table_name GROUP BY s.INDEX_NAME;", */                
                
                
                echo $sql->prnt();
                
                if( $ins_nr_idxs = $this->globals->con->query($sql) == -1 ){
                    $this->errors[] = "SQL error: (".$sql->sql().")" . $this->globals->con->get_error();	
                }
                
                if(count($this->errors) == 0) {
                    echo "<br><h1>SUCCESS:<br>"
                    . " - DELETED: $del_nr_cols COLS<br>"
                    . " - DELETED: $del_nr_fks FKS<br>"
                    . " - DELETED: $del_nr_idxs IDXS<br>"
                    . " - INSERTED: $ins_nr_cols COLS<br>"
                    . " - INSERTED: $ins_nr_fks FKS<br>"
                    . " - INSERTED: $ins_nr_idxs IDXS<br>"
                    . "    </h1>";
                }else{
                    print_r($this->errors);
                }
        }
        echo "<h1>" . $this->SCHEMA_NAME .".".$this->TABLE_NAME."</h1><br>";
        //$this->globals->sm->assign(array("SCRIPT_CONTENT" => "phpapps_database_table_rescan_columns: Youre code here."));
        
  
        //$this->load_elements();
        //$this->display_template();
    }
}

new phpapps_database_table_rescan_columns($_GET["app_id"]);
?>