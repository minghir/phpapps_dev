<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class phpapps_database_table_rescan_columns extends phpapps_display_abs{

    private $app_id;
    public $TABLE_ID;
    public $SCHEMA_NAME;
    public $TABLE_NAME;
    
    function __construct($app_id) {
        parent::__construct();
        $this->layout = PHPAPPS_LAYOUTS_DIR . "default.lay";
        $this->tpl = "phpapps_database_table_rescan_columns.tpl";        
        $this->app_id = $app_id;

       
        $this->TABLE_ID = $_GET["gfield_value"];
        $this->SCHEMA_NAME = (new DB_table("view_tables"))->getValue("TABLE_SCHEMA",$this->TABLE_ID);
        $this->TABLE_NAME = (new DB_table("view_tables"))->getValue("TABLE_NAME",$this->TABLE_ID);
        
        $sql = new DB_query("DELETE FROM phpapps.table_details WHERE TABLE_ID = :table_id",array(":table_id" => $this->TABLE_ID));
        
        if( ( $nr_res = $this->globals->con->query($sql) ) == -1 ){
            $this->errors[] = "SQL error: (".$sql->sql().")" . $this->globals->con->get_error();	
            echo "<h1> DEL ERROR:<br>";
            print_r($this->errors);
	}else{
                echo "<br> DELETED $nr_res ";
                // $sql = "",""
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
                 print_r($sql);
                 //
                 if( $this->globals->con->query($sql) == -1 ){
                    $this->errors[] = "SQL error: (".$sql->sql().")" . $this->globals->con->get_error();	
                    echo "<h1> ins ERROR:<br>";
                    print_r($this->errors);
                }else{
                    echo "<br><h1>SUCCESS</h1>";
                }
        }
        echo "<h1>" . $this->SCHEMA_NAME .".".$this->TABLE_NAME."</h1><br>";
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "phpapps_database_table_rescan_columns: Youre code here."));
        
        $this->displayTpl();
    }
}

new phpapps_database_table_rescan_columns($_GET["app_id"]);
?>