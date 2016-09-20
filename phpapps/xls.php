<?php
//require_once './libs/PHPExcel.php';

include ("globals.php");
require_once PHPEXCEL_LIBS_DIR . "PHPExcel.php";

global $GLOBALS_OBJ;
$globals = $GLOBALS_OBJ;
$con = $globals->con;
$sm = $globals->sm;

$objPHPExcel = new PHPExcel();

$query = $_SESSION["_SQL_QUERY"];
$db = $_SESSION["_SQL_DB"];
$con->select_db($db);

$objPHPExcel->getProperties()->setCreator("Victor Minghir")
							 ->setLastModifiedBy("Victor Minghir")
							 ->setTitle("Office 2005 XLSX Document")
							 ->setSubject("Office 2005 XLSX Document")
							 ->setDescription("Document for Office 2005 XLSX, generated using PHP classes.")
							 ->setKeywords("office 2005 openxml php")
							 ->setCategory("Test result file");


$rec_no = $con->query($query);
$col = 0;
for($i = 0;$i <= $con->get_num_fields() - 1; $i++){
       $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col, 1, $con->get_field_name($i));
       $col++;
}


$row = 2;
while($res=$con->fetch_row()){
   $col = 0;
   foreach($res as $rez){
       $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, $rez);
       $col++;
   }
   $row++;
}

$objPHPExcel->getActiveSheet()->setTitle('Foaie1');
$objPHPExcel->setActiveSheetIndex(0);

// Redirect output to a client’s web browser (Excel5)
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="phpapps.xls"');
header('Cache-Control: max-age=0');

$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
$objWriter->save('php://output');
exit;

?>