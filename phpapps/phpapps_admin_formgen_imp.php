<?php
namespace wabdo;
require_once ("globals.php");
include ("phpapps_admin_formgen.php");	
	
class phpapps_admin_formgen_imp extends phpapps_admin_formgen{
	var $globals;
        protected $display_objects_id = 165;
        protected $display_objects_type_id = '2';
    	protected $display_objects_type = 'SCRIPT';
	
 public function __construct() {
                    parent::__construct();
	global $GLOBALS_OBJ;
	$this->globals = $GLOBALS_OBJ;

	if(isset($_POST["act"])){
		print_r($_POST);
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
                                echo "AICIAAAAAAAAAAAAA";
                                $sql = new DB_query("SELECT "
                                                        . "ID, "
                                                        . "SCRIPT_NAME,"
                                                        . "APP_NAME "
                                                    . "FROM phpapps.view_scripts "
                                                    . "WHERE ID = :id",
                                        array(":id"=>$_GET["gfield_value"]));
                                
                                $this->globals->con->query($sql);	
                                $this->globals->con->next();	
                                $SCRIPT_NAME = $this->globals->con->get_field("SCRIPT_NAME");
                                $APP_NAME = $this->globals->con->get_field("APP_NAME");
                            
                                $sql = new DB_query(
				"DELETE FROM phpapps.form_details WHERE FORM_ID = :id",array(":id"=>$_GET["gfield_value"]));
                                $this->globals->con->query($sql);	
                                
				$sql = new DB_query(
				"DELETE FROM phpapps.scripts WHERE ID = :id",array(":id"=>$_GET["gfield_value"]));
				$this->globals->con->query($sql);	
                                
                                unlink(GLOBALS_DIR . $APP_NAME . DIR_SEP . $SCRIPT_NAME . "_imp.php");
                                unlink(GLOBALS_DIR . $APP_NAME . DIR_SEP . "tpl". DIR_SEP . $SCRIPT_NAME . "_imp.tpl");
                                
                                unlink(GLOBALS_DIR . $APP_NAME . DIR_SEP . "gen_php" . DIR_SEP .$SCRIPT_NAME . ".php");
                                unlink(GLOBALS_DIR . $APP_NAME . DIR_SEP . "tpl". DIR_SEP . "gen_tpl" . DIR_SEP . $SCRIPT_NAME . ".tpl");
				//$this->globals->con->print_log();	
				//header("Location:win_close.html");
			break;
		}
	}
        
                $this->tpl = "phpapps_admin_formgen.tpl";
                $this->setup_display();
                //parent::display_formgen();
                $this->display_template();
}
};

$phpapps_admin_formgen_Impl = new phpapps_admin_formgen_imp();	

?>