<?php

//$fp = fopen("dbase/$filename.dbf", "r");
//fpassthru($fp);
//fclose($fp);

//include ("config.php");

$dbf_types["string"] = "C";
$dbf_types["real"] = "N";
$dbf_types["int"] = "N";

include ("globals.php");
session_start();

$query = $_SESSION["query"];
$db = $_SESSION["db"];
$con->select_db($db);

$rec_no = $con->query($query);
for($i = 0;$i <= $con->get_num_fields() - 1; $i++){
   $fields[] = $con->get_field_name($i);
   $field_types[] = $con->get_field_type($i);
   $field_lens[] = $con->get_field_len($i);
}

   foreach($fields as $key=>$val){
	switch($field_types[$key]){
		case "real":
			$defs[] = array ($val,$dbf_types[$field_types[$key]],18,8);
		break;
		case "int":
			$defs[] = array ($val,$dbf_types[$field_types[$key]],$field_lens[$key],0);
		break;
		case "string":
			$defs[] = array ($val,$dbf_types[$field_types[$key]],$field_lens[$key]);
		break;
	}
   }
  if (!dbase_create('./tmp/test.dbf', $defs)) {
		echo "Error, can't create the database\n";
	}
   
   $dbf = dbase_open('./tmp/test.dbf', 2);
   if($dbf){
   
		while($res=$con->fetch_row()){
		   $t_rows = "";
		   foreach($res as $rez){
			   $t_rows .=  $rez . ",";
			   //$dbf_row[] = $rez;
		   }
		   $rows[] = $t_rows;
		   dbase_add_record($dbf, $res);
		}
	  dbase_close($dbf);
	}
	
//header("Content-type: application/x-dbase");
header("Content-type: application/x-dbase");
header('Content-Disposition: attachment; filename="downloaded.dbf"');
readfile('./tmp/test.dbf');



?>