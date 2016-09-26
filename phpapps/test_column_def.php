<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class test_column_def extends phpapps_display_abs{

    var $app_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->tpl = "test_column_def.tpl";        
        $this->app_id = $app_id;
      
        //$bb = new DB_table_def("phpapps","test_def2");
        //$bb->dropTable();
        
        $aa =new DB_table_def("phpapps","test_def");
        $aa->dropTable();
        
        unset($aa);
        
        $aa =new DB_table_def("phpapps","test_def");
        
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
    }
}

new test_column_def($_GET["app_id"]);
?>