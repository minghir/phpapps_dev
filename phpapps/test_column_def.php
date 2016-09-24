<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class test_column_def extends phpapps_display_abs{

    var $app_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->tpl = "test_column_def.tpl";        
        $this->app_id = $app_id;
        
        $columns[] = new DB_column_def("ID",
                                (new DB_list("list_mysql_column_types"))->getID("BIGINT"),
                                "20",
                                false,
                                "0",
                                true
                                );
        $columns[] = new DB_column_def("VALUE",
                                (new DB_list("list_mysql_column_types"))->getID("VARCHAR"),
                                "20",
                                false,
                                "EMPTY",
                                false
                                );
        $columns[] = new DB_column_def("DESCRIPTION",
                                (new DB_list("list_mysql_column_types"))->getID("TEXT"),
                                "255",
                                true
                                );
        foreach ($columns as $col){
            echo $col->getColumnDef() . "<br>";
        }
        
        
      //  $this->displayTpl();
    }
}

new test_column_def($_GET["app_id"]);
?>