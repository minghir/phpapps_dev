<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class test_column_def extends template{

    var $app_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->tpl = "test_column_def.tpl";        
        $this->app_id = $app_id;
      
        //$bb = new DB_table_def("phpapps","test_def2");
        //$bb->dropTable();
        
        echo "<h1>(-"._lst("list_mysql_column_types")["BIGINT"] ."-)</h1><br>";
        echo "<h1>(-"._lst("list_mysql_column_types","BIGINT") ."-)</h1><br>";
        echo "<h1>(-"._lst("list_mysql_column_types",4) ."-)</h1><br>";
        
        
        $this->globals->con->begin();
        $aa =new DB_table_def("phpapps","test_def_roll");
        //$aa->dropTable();
        
        //unset($aa);
        
        //$aa =new DB_table_def("phpapps","test_def");
        
        if(!$aa->createIDTable()){
            print_r($aa->errors);
        }
        $aa->alterTblAddCol("APP_ID", (new DB_list("list_mysql_column_types"))->getID("BIGINT"), "20",FALSE);
            print_r($aa->errors);
        //echo "--"     . $aa->columns[count($aa->columns)-1]->getColumnName();
        //$aa->alterTblRenameTbl("test_def2");
        $aa->alterTblAddFK("APP_ID", "phpapps", "applications","ID");
        print_r($aa->errors);
        $aa->alterTblDropFK("APP_ID");
        print_r($aa->errors);
        //$aa->dropTable();
         //$this->globals->con->commit();
        $this->globals->con->rollback();
    }
}

new test_column_def($_GET["app_id"]);
?>