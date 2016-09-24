<?php
header("Content-type: application/csv");
header("Content-Disposition: attachment; filename=file.csv");
header("Pragma: no-cache");
header("Expires: 0");


//include ("config.php");
include ("globals.php");
session_start();
$query = $_SESSION["query"];

$rec_no = $con->query($query);
for($i = 0;$i <= $con->get_num_fields() - 1; $i++)
   $tmp_fields[] = $con->get_field_name($i);

   $fields = implode($tmp_fields,",") . ",";

while($res=$con->fetch_row()){
   $t_rows = "";
   foreach($res as $rez){
       $t_rows .=  $rez . ",";
   }
   $rows[] = $t_rows;
}

$sm->assign(array("fields" => $fields,
                              "rows" => $rows,
                              "query" => $query,
                              "SQL_ERROR" => $SQL_ERROR,
                              "DATABASE" => $con->get_db_name(),
                              "rec_no" => $rec_no,

                              ));
$sm->display("csv.tpl");

?>