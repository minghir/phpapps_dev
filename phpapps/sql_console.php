<?php
include ("globals.php");
global $GLOBALS_OBJ;
$globals = &$GLOBALS_OBJ;
$con = &$globals->con;
$sm = &$globals->sm;

session_start();
$query = $_SESSION["_SQL_QUERY"];

$db = $_POST["db"] == "" ? $_SESSION["_SQL_DB"] : $_POST["db"];
$con->select_db($db);
$_SESSION["_SQL_DB"] = $db;

$query = trim($_POST["query"]);
$descr = trim($_POST["descr"]);
$_SESSION["_SQL_QUERY"] = $query;
$_SESSION["_SQL_DESCR"] = $descr;

$dbs = (_lst("phpapps.list_databases"));
$dbs_sel[$dbs[$db]] = "selected";
$dbs=array_flip($dbs);
        
switch($_POST["act"]){
    case "Query":
		$rec_no = $con->query(new DB_query($query));
		if($rec_no == -1){
			$SQL_ERROR = $con->get_error();
			//echo "<h1>" . $SQL_ERROR[1] ."</h1>";
		}
		$SQL_ERROR = $con->get_error();
	//////////////////////////////////

	for($i = 0;$i <= $con->get_num_fields() - 1; $i++){
	     $fields[] = $con->get_field_name($i);
	}

	while($res=$con->fetch_row()){
        $t_rows = "";
	    foreach($res as $rez){
			$t_rows .=  "<td> " . $rez . " </td>";
	    }
	    $rows[] = $t_rows;
	}

	//////////////////////////////////

    break;
    case "Save":
        $query = trim($_POST["query"]);
	$descr = trim($_POST["descr"]);

	//$sql_db = "CREATE TABLE IF NOT EXISTS sql_query(ID bigint not null auto_increment primary key,QUERY text not null,DESCR varchar(255),DATAQ datetime)TYPE=InnoDB";
        //$con->query(new DB_query($sql_db));

        $query_text = addslashes($query);
	$nr_t = $con->query(new DB_query("SELECT id,query,descr,dataq "
                . "             FROM phpapps.sql_console_saves "
                . "             WHERE descr = :descr AND database_id = :db_id",
                array(
                    ":descr" => $descr,
                    ":db_id" => array_flip($dbs)[$db]
                )));
	if( $nr_t > 0 ){
            $con->next();
            $con->query(new DB_query("UPDATE phpapps.sql_console_saves SET "
                    . "query = :query, "
                    . "dataq = NOW() "
                    . "WHERE id = :id",
                    array(
                        ":query" => $query_text,
                        ":id" => $con->get_field("id")
                    )));
        }else{
            $con->query(new DB_query("INSERT INTO phpapps.sql_console_saves "
                    . "(query,descr,dataq,database_id) "
                    . "VALUES(:query,:descr,NOW(),:db_id)",
                    array(":query" => $query_text,
                        ":descr" =>$descr,
                        ":db_id" => array_flip($dbs)[$db]
                        )
                    ));
        }
	$_SESSION["_SQL_QUERY"] = $query;
	$_SESSION["_SQL_DESCR"] = $descr;
    break;
    case "Del":
        $querie_run = $_POST["queries"];
        $sql = new DB_query("DELETE FROM phpapps.sql_console_saves "
                            . "WHERE id = :id",array(":id" => $querie_run));
        $con->query($sql);
        header("Location:sql_console.php");
    break;
    case "submited":
        $querie_run = $_POST["queries"];
        $sql = new DB_query("SELECT id,query,descr,dataq FROM phpapps.sql_console_saves "
                . "WHERE id = :id",array(":id"=>$querie_run));
        $con->query($sql);
        $con->next();
       	$query = $con->get_field("query");
	$descr = $con->get_field("descr");
    break;
}

$con->query(new DB_query("SELECT id,query,descr,dataq FROM phpapps.sql_console_saves "
                        . " WHERE database_id = :db_id ORDER BY dataq DESC",
        array(":db_id" => array_flip($dbs)[$db])));
while($res=$con->fetch_array()){
   $queries[] = $res["id"];
   $desc_queries[] = "(". $res["dataq"] . ") " . $res["descr"];
   if($descr == $res["descr"]){
         $queries_sel[] = "selected";
         $descr = $res["descr"];
   }  else{
         $queries_sel[] = "";
   }
}
//print_r($SQL_ERROR);
$sm->assign(array("fields" => $fields,
                              "rows" => $rows,
                              "query" => $query,
                              "descr" => $descr,
                              "queries" => $queries,
                              "desc_queries" => $desc_queries,
                              "queries_sel" => $queries_sel,
                              "SQL_ERROR" => ( $SQL_ERROR ),
                              "DATABASE" => $con->get_db_name(),
                              "rec_no" => $rec_no,
                              "dbs" => $dbs,
                              "dbs_sel" => $dbs_sel,
                              ));
$con->print_log();
$sm->display("sql_console.tpl");
?>