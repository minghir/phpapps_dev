<?php
namespace wabdo;
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_modules_base_grids.php");

class phpapps_users_module extends template{
	
	var $ID;
	var $APP_ID;
	var $MODULE_NAME;
	var $MODULE_TITLE;
	var $MODULE_DATE;
	var $MODULE_SCHEMA;
	var $DESCRIPTION;
	var $APP_NAME;
	var $APP_TITLE;
	var $BASE_DIR;
	 protected $display_objects_id = 155;
        protected $display_objects_type_id = '2';
    	protected $display_objects_type = 'SCRIPT';
        
        
	public function __construct($module_id) {
        parent::__construct();

            $this->tpl = PHPAPPS_TPL_DIR . "phpapps_users_module.tpl";        
            $this->MODULE_ID = $module_id;
		
            global $GLOBALS_OBJ;
            $this->globals = $GLOBALS_OBJ;
		
            $this->globals->con->select_db("phpapps");
		
            $sql = new DB_query("SELECT 	m.ID,
						m.APP_ID,
						m.MODULE_NAME,
						m.MODULE_TITLE,
						m.MODULE_DATE,
						m.MODULE_SCHEMA,
						m.DESCRIPTION,
						m.APP_NAME,
						a.APP_TITLE
				FROM phpapps.view_modules m, phpapps.applications a
				WHERE m.APP_ID = a.ID AND m.ID = '$module_id' ",array());
				
            $this->globals->con->query($sql);	
            $this->globals->con->next();
            $this->ID = $this->globals->con->get_field("ID");
            $this->APP_ID = $this->globals->con->get_field("APP_ID");
            $this->MODULE_NAME = $this->globals->con->get_field("MODULE_NAME");
            $this->MODULE_TITLE = $this->globals->con->get_field("MODULE_TITLE");
            $this->MODULE_DATE = $this->globals->con->get_field("MODULE_DATE");
            $this->MODULE_SCHEMA = $this->globals->con->get_field("MODULE_SCHEMA");
            $this->DESCRIPTION = $this->globals->con->get_field("DESCRIPTION");
            $this->APP_NAME = $this->globals->con->get_field("APP_NAME");
            //$this->BASE_DIR = $this->globals->con->get_field("BASE_DIR");
            $this->APP_TITLE = $this->globals->con->get_field("APP_TITLE");
	}
	
	public function display_tpl(){
	
		$perm_grid =  new DB_grid($this->globals->con, "table","phpapps.view_permissions","phpapps_permissions_grid");
		$perm_grid->grid_title = "PERMISSIONS";
		$perm_grid->paginable = true;
		$perm_grid->filterable = false;
		$perm_grid->exportable = false;
		$perm_grid->cols = array(	"PERMISSION_NAME",
									"PERMISSION_TYPE",
									"OBJECT_TYPE",
									"OBJECT_NAME",
									"DESCRIPTION");
		$perm_grid->labels = array("PERMISSION NAME",
									"PERMISSION TYPE",
									"OBJECT TYPE",
									"OBJECT NAME",
									"DESCRIPTION"
							);
		$perm_grid->rows_on_pg = 5;
		$perm_grid->edit_form = "phpapps_users_permissions_form_imp.php";
		
		
		$roles_grid = new DB_grid($this->globals->con, "table","phpapps.roles","phpapps_roless_grid");
		$roles_grid->grid_title = "ROLES";
		$roles_grid->cols = (array("ROLE_NAME","DESCRIPTION"));
		$roles_grid->labels = (array("NAME","DESCRIPTION"));
		//$tables_grid->where_rules = array(" MODULE_ID = '".$this->ID."' AND TABLE_NAME NOT LIKE 'LIST%'");
		$roles_grid->paginable = true;
		$roles_grid->filterable = false;
		$roles_grid->exportable = false;
		$roles_grid->editable = true;
		$roles_grid->rows_on_pg = 5;
		$roles_grid->edit_form = "phpapps_users_roles_form_imp.php?module_id=".$this->ID;
		
		$mrp = new HrefActions();
		$mrp->act_script = "";
		$mrp->label = "manage role permissions";
		$mrp->action = "newRec";
		$mrp->fields = array("ID");
		$roles_grid->add_row_acction($mrp);
		
		
		$users_grid =  new DB_grid($this->globals->con, "table","phpapps.users","phpapps_users_grid");
		$users_grid->grid_title = "USERS";
		$users_grid->paginable = true;
		$users_grid->filterable = false;
		$users_grid->exportable = false;
		$users_grid->cols = array(	"CONCAT('<a href=\"phpapps_users_manage_user_roles.php?user_id=',ID,'\">',USERNAME,'</a>') AS USERNAME",
									"FIRSTNAME",
									"LASTNAME",
									"EMAIL",
									"(SELECT VALUE FROM phpapps.list_user_types WHERE phpapps.list_user_types.ID = USER_TYPE) AS USER_TYPE",
									"DESCRIPTION");
		$users_grid->editable = true;
		$users_grid->rows_on_pg = 5;
		$users_grid->edit_form = "phpapps_users_users_form_imp.php?module_id=".$this->ID;
		
		$mur = new HrefActions();
		$mur->act_script = "phpapps_users_user_roles_form_imp.php";
		$mur->label = "manage user roles";
		$mur->action = "newRec";
		$mur->fields = array("ID");
		$users_grid->add_row_acction($mur);

/*				
		$user_roles_grid = new DB_grid($this->globals->con, "table","phpapps.scripts","phpapps_scripts_grid");
		$user_roles_grid->grid_title = "SCRIPTS";
		$scripts_grid->paginable = true;
		$scripts_grid->editable = true;
		$scripts_grid->filterable = false;
		$scripts_grid->exportable = false;
		$scripts_grid->rows_on_pg = 6;
		$scripts_grid->edit_form = "phpapps_admin_scripts_form_imp.php?module_id=".$this->ID;
		$scripts_grid->cols = (array("SCRIPT_NAME","(SELECT VALUE FROM list_script_types WHERE ID = SCRIPT_TYPE) AS SCRIPT_TYPE","DESCRIPTION"));
		$scripts_grid->labels = (array("NAME","TYPE","DESCRIPTION"));
		

			$aa = new HrefActions();
			$aa->act_script = "code_editor.php?module_id=".$this->ID;
			$aa->label = "edit imp";
			$aa->action = "editRec";
			$aa->fields = array("FORM_NAME");
			$forms_grid->add_row_acction($aa);
			
			$bb = new HrefActions();
			$bb->act_script = "run_php_script.php?module_id=".$this->ID;
			$bb->label = "run script";
			$bb->action = "runImp";
			$bb->fields = array("ID","FORM_NAME");
			$bb->popup = true;
			$forms_grid->add_row_acction($bb);
			
		
		$tables_grid = new DB_grid($this->globals->con, "table","phpapps.tables","phpapps_tables_grid");
		$tables_grid->grid_title = "TABLES";
		$tables_grid->cols = (array("TABLE_NAME","DESCRIPTION"));
		$tables_grid->labels = (array("NAME","DESCRIPTION"));
		$tables_grid->where_rules = array(" MODULE_ID = '".$this->ID."' AND TABLE_NAME NOT LIKE 'LIST%'");
		$tables_grid->paginable = true;
		$tables_grid->filterable = false;
		$tables_grid->exportable = false;
		//$tables_grid->editable = false;
		$tables_grid->rows_on_pg = 5;
		$tables_grid->edit_form = "phpapps_admin_tables_form_imp.php?module_id=".$this->ID;
		
		$tad = new HrefActions();
		$tad->act_script = "phpapps_admin_add_table_form_imp.php?module_id=".$this->ID;
		$tad->popup = true;
		$tad->label = "add";
		$tad->action = "newRec";
		$tables_grid->add_grid_acction($tad);
		
				
		$ts = new HrefActions();
		$ts->act_script = "phpapps_admin_browse_tables.php?module_id=".$this->ID;
		$ts->popup = true;
		$ts->label = "browse";
		$ts->action = "runGrid";
		$ts->fields = array("ID");
		$tables_grid->add_row_acction($ts);
	
		$lists_grid = new DB_grid($this->globals->con, "table","phpapps.tables","phpapps_lists_grid");
		//$lists_grid->grid_title = "<table border=1><tr><td align=\"left\">MODULE LISTS</td><td align=\"right\"><a href=\"http://localhost/phpapps/phpapps_admin_lists_form_imp.php?module_id=\"".$this->ID."\"&gact=newRec\">add</a></td></tr></table>";
		$lists_grid->grid_title = "LISTS";
		$lists_grid->cols = (array("TABLE_NAME","DESCRIPTION"));
		$lists_grid->labels = (array("NAME","DESCRIPTION"));
		$lists_grid->where_rules = array(" MODULE_ID = '".$this->ID."' AND TABLE_NAME LIKE 'LIST%'");
		$lists_grid->paginable = true;
		$lists_grid->editable = false;
		$lists_grid->filterable = false;
		$lists_grid->exportable = false;
		$lists_grid->rows_on_pg = 6;
		$lists_grid->edit_form = "phpapps_admin_lists_imp.php?module_id=".$this->ID;
		
		
		$la = new HrefActions();
		$la->act_script = "phpapps_admin_lists_imp.php?module_id=".$this->ID;
		$la->confirm_msg = "Sigur stergeti inregistrarea?";
		$la->popup = true;
		$la->label = "delete";
		$la->action = "deleteRec";
		$la->fields = array("ID");
		$lists_grid->add_row_acction($la);
		
		$las = new HrefActions();
		$las->act_script = "phpapps_admin_browse_list.php?module_id=".$this->ID;
		$las->popup = true;
		$las->label = "browse";
		$las->action = "runGrid";
		$las->fields = array("ID");
		$lists_grid->add_row_acction($las);
		
		$lad = new HrefActions();
		$lad->act_script = "phpapps_admin_lists_imp.php?module_id=".$this->ID;
		$lad->popup = true;
		$lad->label = "new";
		$lad->action = "newRec";
		$lists_grid->add_grid_acction($lad);
			
		
		//$lists_grid->where_rules = array(" MODULE_ID = '".$this->ID."' AND TABLE_NAME LIKE 'LIST%'");
*/		
		$this->globals->sm->assign("users_grid",$users_grid->get_grid_str());
		$this->globals->sm->assign("permissions",$perm_grid->get_grid_str());
		$this->globals->sm->assign("roles_grid",$roles_grid->get_grid_str());
		//$this->globals->sm->assign("lists_grid",$lists_grid->get_grid_str());
//		$this->globals->sm->assign("scripts_grid",$scripts_grid->get_grid_str());
                
                $base_grds = new phpapps_modules_base_grids($this->ID);
                $base_grds->baseGrids();
		
		$this->globals->sm->assign("module",$this);
		$this->globals->sm->display("phpapps_users_module.tpl");
	}
};

$aa  = new phpapps_users_module($_GET["module_id"]);
$aa->display_tpl();
?>