<?php
require_once ("globals.php");

class phpapps_users_manage_user_roles{
	private $globals;
	private $user_id;
	private $firstname;
	private $lastname;
	private $username;
	
	function __construct(){
		global $GLOBALS_OBJ;
		$this->globals = $GLOBALS_OBJ;
		$this->user_id = $_GET["user_id"];
		$sql = new DB_query("SELECT 
								ID, 
								USERNAME, 
								FIRSTNAME, 
								LASTNAME 
							FROM {$this->globals->PHPAPPS_DB}.view_users 
							WHERE ID = '".$this->user_id."'");
		$this->globals->con->query($sql->sql());
		$this->globals->con->next();
		$this->firstname = $this->globals->con->get_field("FIRSTNAME");
		$this->lastname = $this->globals->con->get_field("LASTNAME");
		$this->username = $this->globals->con->get_field("USERNAME");
	}
	
	function display(){	
		$usr_roles_grid =  new DB_grid($this->globals->con, "table","{$this->globals->PHPAPPS_DB}.view_user_roles","view_user_roles_grid");
		$usr_roles_grid->grid_title = "USER ROLES for " . $this->username . "<br>(". $this->firstname ." " . $this->lastname .")";
		$usr_roles_grid->paginable = true;
		$usr_roles_grid->filterable = false;
		$usr_roles_grid->exportable = false;
		$usr_roles_grid->cols = array(	"USERNAME", "ROLE_NAME" );
		$usr_roles_grid->labels = array("USERNAME", "ROLE NAME"	);
		$usr_roles_grid->where_rules = array ( " UID = '".$this->user_id."'");
		$usr_roles_grid->rows_on_pg = 5;
		$usr_roles_grid->edit_form = "phpapps_users_user_roles_form_imp.php?user_id=".$this->user_id;
		
		$this->globals->sm->assign(array("usr_roles_grid" => $usr_roles_grid->get_grid_str()));
		$this->globals->sm->display("phpapps_users_manage_user_roles.tpl");
	}
};
$obj = new phpapps_users_manage_user_roles();
$obj->display();
?>