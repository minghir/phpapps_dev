<?php
namespace wabdo;
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class phpapps_admin_other_module extends template{

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
	
        var $script_id = 154;
          public $display_objects_type_id = '2';
                public $display_objects_type = 'SCRIPT';
                public $display_objects_id = 154;
                
	public function __construct($module_id){
                 parent::__construct();
		
		//global $GLOBALS_OBJ;
		//$this->globals = $GLOBALS_OBJ;
                //$this->layout = PHPAPPS_LAYOUTS_DIR . "{$this->globals->PHPAPPS_DB}.lay";
		
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
				FROM {$this->globals->PHPAPPS_DB}.view_modules m, {$this->globals->PHPAPPS_DB}.applications a
				WHERE m.APP_ID = a.ID AND m.ID = :module_id ",array(':module_id'=>$module_id));
				
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
		$this->load_elements();
	}
	
	public function display_tpl(){
		
		$forms_grid =  new DB_grid($this->globals->con, "table","{$this->globals->PHPAPPS_DB}.view_forms","phpapps_forms_grid");
		$forms_grid->grid_title = "FORMS";
		$forms_grid->paginable = true;
		$forms_grid->filterable = false;
		$forms_grid->exportable = false;
		$forms_grid->cols = array("FORM_NAME","TABLE_NAME","DESCRIPTION");
		$forms_grid->labels = array("NAME","FORM TABLE","DESCRIPTION");
		$forms_grid->where_rules = array(" MODULE_ID = :module_id ");
		$forms_grid->where_params = array(":module_id" => $this->ID);
		$forms_grid->rows_on_pg = 20;
		$forms_grid->edit_form = "phpapps_admin_formgen_imp.php?module_id=".$this->ID;
		
			$aa = new HrefActions();
			$aa->act_script = "run_code_editor.php?module_id=".$this->ID;
			$aa->label = "edit imp php";
			$aa->action = "editImpPhp";
			$aa->fields = array("ID");
			$forms_grid->add_row_acction($aa);
			
			$aat = new HrefActions();
			$aat->act_script = "run_code_editor.php?module_id=".$this->ID;
			$aat->label = "edit imp tpl";
			$aat->action = "editImpTpl";
			$aat->fields = array("ID");
			$forms_grid->add_row_acction($aat);
			
			$bb = new HrefActions();
			$bb->act_script = "run_php_script.php?module_id=".$this->ID;
			$bb->label = "run script";
			$bb->action = "runFormImp";
			$bb->fields = array("ID","FORM_NAME");
			$bb->popup = true;
			$forms_grid->add_row_acction($bb);
                        
                        //phpapps_admin_scripts_form_imp.php?module_id=1&gact=editRec&gfield=ID&gfield_value=163
                        $es = new HrefActions();
			$es->act_script = "phpapps_admin_scripts_form_imp.php?module_id=".$this->ID;
			$es->label = "edit as script";
			$es->action = "editRec";
			$es->fields = array("ID","FORM_NAME");
			$es->popup = true;
			$forms_grid->add_row_acction($es);
			
		
		$tables_grid = new DB_grid($this->globals->con, "table","{$this->globals->PHPAPPS_DB}.view_tables","phpapps_tables_grid");
		$tables_grid->grid_title = "TABLES";

		$tables_grid->cols = (array("TABLE_SCHEMA","TABLE_NAME","TABLE_TYPE_LABEL","DESCRIPTION"));
		$tables_grid->labels = (array("SCHEMA","TABLE","TABLE_TYPE","DESCRIPTION"));
		
		$tables_grid->where_rules = array(" MODULE_ID = :module_id ", " TABLE_TYPE != :table_type ");
		$tables_grid->where_params = array(":module_id" => $this->ID,":table_type"=>(new DB_list("list_table_types"))->getID("list_table"));
		
		$tables_grid->paginable = true;
		$tables_grid->filterable = false;
		$tables_grid->exportable = false;
		//$tables_grid->editable = false;
		$tables_grid->rows_on_pg = 20;
		$tables_grid->edit_form = "phpapps_database_tables_form_imp.php?module_id=".$this->ID;
		
		$tad = new HrefActions();
		$tad->act_script = "phpapps_database_add_table_form_imp.php?table_type=".(new DB_list("list_table_types"))->getID("values_table")."&module_id=".$this->ID;
		$tad->popup = true;
		$tad->label = "add";
		$tad->action = "addRec";
		$tables_grid->add_grid_acction($tad);
		
				
		$ts = new HrefActions();
		$ts->act_script = "phpapps_database_browse_tables.php?module_id=".$this->ID;
		$ts->popup = true;
		$ts->label = "browse";
		$ts->action = "runGrid";
		$ts->fields = array("ID");
		$tables_grid->add_row_acction($ts);
		/*
		$dt = new HrefActions();
		$dt->act_script = "phpapps_database_tables_form_imp.php?module_id=".$this->ID;
		$dt->popup = true;
		$dt->label = "drop";
		$dt->action = "dropTable";
		$dt->confirm_msg = "Sigur stergeti tabela cu DROP??";
		$dt->fields = array("ID");
		$tables_grid->add_row_acction($dt);
                 * 
                 */
                
                
	
		$lists_grid = new DB_grid($this->globals->con, "table","{$this->globals->PHPAPPS_DB}.tables","phpapps_lists_grid");
		//$lists_grid->grid_title = "<table border=1><tr><td align=\"left\">MODULE LISTS</td><td align=\"right\"><a href=\"http://localhost/phpapps/phpapps_admin_lists_form_imp.php?module_id=\"".$this->ID."\"&gact=newRec\">add</a></td></tr></table>";
		$lists_grid->grid_title = "LISTS";
		$lists_grid->cols = (array("TABLE_NAME","DESCRIPTION"));
		$lists_grid->labels = (array("NAME","DESCRIPTION"));
		
		//$lists_grid->where_rules = array(" MODULE_ID = '".$this->ID."' AND TABLE_NAME LIKE 'LIST%'");
		
		$lists_grid->where_rules = array(" MODULE_ID = :module_id ", " TABLE_TYPE = :table_type ");
		$lists_grid->where_params = array(":module_id" => $this->ID,":table_type"=>(new DB_list("list_table_types"))->getID("list_table"));
		
		
		$lists_grid->paginable = true;
		$lists_grid->editable = false;
		$lists_grid->filterable = false;
		$lists_grid->exportable = false;
		$lists_grid->rows_on_pg = 20;
		$lists_grid->edit_form = "phpapps_database_lists_form_imp.php?module_id=".$this->ID;
		
                $lad = new HrefActions();
		$lad->act_script = "phpapps_database_add_table_form_imp.php?table_type=".(new DB_list("list_table_types"))->getID("list_table")."&module_id=".$this->ID;
		$lad->popup = true;
		$lad->label = "add";
		$lad->action = "newRec";
		$lists_grid->add_grid_acction($lad);
		
		$la = new HrefActions();
		$la->act_script = "phpapps_database_lists_form_imp.php?module_id=".$this->ID;
		$la->confirm_msg = "Sigur stergeti inregistrarea?";
		$la->popup = true;
		$la->label = "delete";
		$la->action = "deleteRec";
		$la->fields = array("ID");
		$lists_grid->add_row_acction($la);
                
                /*
                $dl = new HrefActions();
		$dl->act_script = "phpapps_database_lists_form_imp.php?module_id=".$this->ID;
		$dl->popup = true;
		$dl->label = "drop";
		$dl->action = "dropList";
		$dl->confirm_msg = "Sigur stergeti lista cu DROP??";
		$dl->fields = array("ID");
		$lists_grid->add_row_acction($dl);
		*/
                
                
		$las = new HrefActions();
		$las->act_script = "phpapps_database_browse_list.php?module_id=".$this->ID;
		$las->popup = true;
		$las->label = "browse";
		$las->action = "runGrid";
		$las->fields = array("ID");
		$lists_grid->add_row_acction($las);
		
		$lad = new HrefActions();
		$lad->act_script = "phpapps_database_lists_form_imp.php?module_id=".$this->ID;
		$lad->popup = true;
		$lad->label = "new";
		$lad->action = "newRec";
		$lists_grid->add_grid_acction($lad);
			
		$scripts_grid = new DB_grid($this->globals->con, "table","{$this->globals->PHPAPPS_DB}.view_scripts","phpapps_scripts_grid");
		$scripts_grid->grid_title = "SCRIPTS";
		$scripts_grid->paginable = true;
		$scripts_grid->editable = true;
		$scripts_grid->filterable = false;
		$scripts_grid->exportable = false;
		$scripts_grid->rows_on_pg = 20;
		$scripts_grid->edit_form = "phpapps_admin_scripts_form_imp.php?module_id=".$this->ID;
		$scripts_grid->cols = (array("SCRIPT_NAME","(SELECT VALUE FROM list_script_types WHERE ID = SCRIPT_TYPE_ID) AS SCRIPT_TYPE_ID","DESCRIPTION"));
		$scripts_grid->labels = (array("NAME","TYPE","DESCRIPTION"));
		//$scripts_grid->where_rules = array(" MODULE_ID = '".$this->ID."'");
		$scripts_grid->where_rules = array(" MODULE_ID = :module_id ");
		$scripts_grid->where_params = array(":module_id" => $this->ID);
		
		
			$as1 = new HrefActions();
			$as1->act_script = "run_code_editor.php?module_id=".$this->ID;
			$as1->label = "edit php";
			$as1->action = "editScriptPhp";
			$as1->fields = array("ID");
			$scripts_grid->add_row_acction($as1);
			
			$as2 = new HrefActions();
			$as2->act_script = "run_code_editor.php?module_id=".$this->ID;
			$as2->label = "edit tpl";
			$as2->action = "editScriptTpl";
			$as2->fields = array("ID");
			$scripts_grid->add_row_acction($as2);
			
			$as3 = new HrefActions();
			$as3->act_script = "run_php_script.php?module_id=".$this->ID;
			$as3->label = "run script";
			$as3->action = "runScript";
			$as3->fields = array("ID","SCRIPT_NAME");
			$as3->popup = true;
			$scripts_grid->add_row_acction($as3);
                        
                
		
		$this->globals->sm->assign("forms_grid",$forms_grid->get_grid_str());
		$this->globals->sm->assign("tables_grid",$tables_grid->get_grid_str());
		$this->globals->sm->assign("lists_grid",$lists_grid->get_grid_str());
		$this->globals->sm->assign("scripts_grid",$scripts_grid->get_grid_str());
               
                
		$this->globals->sm->assign("module",$this);
		$this->globals->sm->display("phpapps_admin_module_default.tpl");
	}
    
}

//new phpapps_default_admin_module($_GET["app_id"]);
$aa  = new phpapps_admin_other_module( $_GET["gfield_value"] );
$aa->display_tpl();
?>