<?php
require_once ("globals.php");
include ("phpapps_admin_formgen.php");	
	
class phpapps_admin_formgen_imp extends phpapps_admin_formgen{
	var $globals;
	
function phpapps_admin_formgen_imp(){
	global $GLOBALS_OBJ;
	$this->globals = $GLOBALS_OBJ;

	if(isset($_POST["act"])){
		//print_r($_POST);
		switch ($_POST["act"]){
			case "save":
			case "generate":
			case "preview":
			case "select_table":
			case "select_table_list":
                        case "reload_fields":
				if($_POST["form_id"] != ""){
					$fg = new phpapps_admin_formgen(); 
					$fg->editFormgen($_POST["form_id"]);
					exit;
				}else{
					$fg = new phpapps_admin_formgen();
					$fg->newFormgen($_POST["module_id"],$_POST["form_table"]);
					exit;
				}
			break;
		}
	}elseif(isset($_GET["gact"])){
		switch ($_GET["gact"]){
			case "newRec":
				$sql = new DB_query("SELECT ID, TABLE_NAME, TABLE_SCHEMA 
				FROM phpapps.view_tables WHERE MODULE_ID = :module_id",
				array(":module_id"=>$_GET["module_id"]));
				
				$this->globals->con->query($sql);	
				while($res=$this->globals->con->fetch_array()){
					$rows[] = $res;
				}
				$this->globals->sm->assign("tables",$rows);
				$this->globals->sm->assign("module_id",$_GET["module_id"]);
				$this->globals->sm->display("phpapps_admin_formgen_imp.tpl");	
				exit;
			break;
			case "editRec":
				$fg = new phpapps_admin_formgen();
				$fg->editFormgen($_GET["gfield_value"]);
				exit;
			break;
			case "deleteRec":
                                
				$sql = new DB_query(
				"DELETE FROM phpapps.forms WHERE ID = :id",array(":id"=>$_GET["gfield_value"]));
				$this->globals->con->query($sql);	
				//$this->globals->con->print_log();	
				header("Location:win_close.html");
			break;
		}
	}
}
};

$phpapps_admin_formgen_Impl = new phpapps_admin_formgen_imp();	

?>