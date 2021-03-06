<?php
namespace wabdo;

require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_modules_base_grids.php");

class phpapps_database_module extends template{

        var $ID;
        var $APP_ID;
        var $MODULE_NAME;
	var $MODULE_TITLE;
	var $MODULE_DATE;
	var $MODULE_SCHEMA;
	var $DESCRIPTION;
	var $APP_NAME;
	var $APP_TITLE;
        var $MODULE_ID;
        
        //var $script_id =  165;
        protected $display_objects_id = 165;
        protected $display_objects_type_id = '2';
    	protected $display_objects_type = 'SCRIPT';
        
    
    function __construct($module_id) {
        parent::__construct();
        $this->tpl = PHPAPPS_TPL_DIR . "phpapps_database_module.tpl";        
        $this->MODULE_ID = $module_id;
        
        //$this->display_objects_type_id = '2';
    	//$this->display_objects_type = 'SCRIPT';
    	//$this->display_objects_id = $this->script_id;
        
        $this->globals->con->select_db($this->globals->PHPAPPS_DB);
		
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
                $this->setup_display();
                $this->display_template();
                //parent::display_tpl();
    }
    
    function setup_display(){
        //parent::setupDisplay();
        $tables_grid = new DB_grid($this->globals->con, "table","{$this->globals->PHPAPPS_DB}.view_tables","phpapps_tables_grid");
		$tables_grid->grid_title = "TABLES";

		$tables_grid->cols = (array("TABLE_SCHEMA","TABLE_NAME","CONCAT(APP_NAME,'/',MODULE_NAME) AS OWNER","TABLE_TYPE_LABEL","DESCRIPTION"));
		$tables_grid->labels = (array("SCHEMA","TABLE","OWNER","TABLE_TYPE","DESCRIPTION"));
		
		//$tables_grid->where_rules = array(" MODULE_ID = :module_id ", " TABLE_TYPE != :table_type ");
		//$tables_grid->where_params = array(":module_id" => $this->ID,":table_type"=>(new DB_list("list_table_types"))->getID("list_table"));
                
                $tables_grid->where_rules = array(" TABLE_TYPE != :table_type ","ORIGIN_ID = :org_id");
		$tables_grid->where_params = array(":table_type"=>(new DB_list("list_table_types"))->getID("list_table"),":org_id" => 0);
		
		$tables_grid->paginable = true;
		$tables_grid->filterable = false;
		$tables_grid->exportable = false;
		//$tables_grid->editable = false;
		$tables_grid->rows_on_pg = 10;
		$tables_grid->edit_form = "phpapps_database_tables_form_imp.php?module_id=".$this->ID;
                
                $tad = new HrefActions();
		$tad->act_script = "phpapps_database_add_table_form_imp.php?table_type=".(new DB_list("list_table_types"))->getID("values_table")."&module_id=".$this->ID;
		$tad->popup = true;
		$tad->label = "add";
		$tad->action = "newRec";
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
                //echo "<h1>".$tables_grid->template."</h1><br>";
	
		$lists_grid = new DB_grid($this->globals->con, "table","{$this->globals->PHPAPPS_DB}.view_tables","phpapps_lists_grid");
		//$lists_grid->grid_title = "<table border=1><tr><td align=\"left\">MODULE LISTS</td><td align=\"right\"><a href=\"http://localhost/phpapps/phpapps_admin_lists_form_imp.php?module_id=\"".$this->ID."\"&gact=newRec\">add</a></td></tr></table>";
		$lists_grid->grid_title = "LISTS";
		$lists_grid->cols = (array("TABLE_NAME","CONCAT(APP_NAME,'/',MODULE_NAME) AS OWNER","DESCRIPTION"));
		$lists_grid->labels = (array("NAME","OWNER","DESCRIPTION"));
		
		//$lists_grid->where_rules = array(" MODULE_ID = '".$this->ID."' AND TABLE_NAME LIKE 'LIST%'");
		
		$lists_grid->where_rules = array(" TABLE_TYPE = :table_type ","ORIGIN_ID = :org_id");
		$lists_grid->where_params = array(":table_type"=>(new DB_list("list_table_types"))->getID("list_table"),":org_id" => 0);
		
		
		$lists_grid->paginable = true;
		$lists_grid->editable = false;
		$lists_grid->filterable = false;
		$lists_grid->exportable = false;
		$lists_grid->rows_on_pg = 10;
		$lists_grid->edit_form = "phpapps_database_lists_form_imp.php?module_id=".$this->ID;
		
                $lad = new HrefActions();
		$lad->act_script = "phpapps_admin_add_table_form_imp.php?table_type=".(new DB_list("list_table_types"))->getID("list_table")."&module_id=".$this->ID;
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
                
                
                $databases_grid = new DB_grid($this->globals->con, "table","{$this->globals->PHPAPPS_DB}.list_databases","phpapps_list_databases_grid");
                $databases_grid->grid_title = "DATABASES";
		$databases_grid->cols = (array("VALUE","DESCRIPTION"));
		$databases_grid->labels = (array("DATABASE","DESCRIPTION"));
                $databases_grid->paginable = true;
		$databases_grid->editable = false;
		$databases_grid->filterable = false;
		$databases_grid->exportable = false;
		$databases_grid->rows_on_pg = 10;
                $databases_grid->edit_form = "phpapps_database_list_databases_form_imp.php?module_id=".$this->ID;
                
                $dga = new HrefActions();
		$dga->act_script = "phpapps_database_list_databases_form_imp.php?gact=newRec&module_id=".$this->ID;
		$dga->popup = true;
		$dga->label = "add";
		$dga->action = "addDB";
		$dga->fields = array("ID");
		$databases_grid->add_grid_acction($dga);
                
                $dgn = new HrefActions();
		$dgn->act_script = "phpapps_database_list_databases_form_imp.php?gact=new&module_id=".$this->ID;
		$dgn->popup = true;
		$dgn->label = "new";
		$dgn->action = "newDB";
		$dgn->fields = array("ID");
		$databases_grid->add_grid_acction($dgn);
                
                
                $queries_grid = new DB_grid($this->globals->con, "table","{$this->globals->PHPAPPS_DB}.queries","phpapps_queries_grid");
		//$lists_grid->grid_title = "<table border=1><tr><td align=\"left\">MODULE LISTS</td><td align=\"right\"><a href=\"http://localhost/phpapps/phpapps_admin_lists_form_imp.php?module_id=\"".$this->ID."\"&gact=newRec\">add</a></td></tr></table>";
		$queries_grid->grid_title = "QUERIES";
		$queries_grid->cols = (array("QUERY_NAME","CONCAT(SUBSTR(QUERY_BODY,1,50),' ...') AS QUERY_BODY","DESCRIPTION"));
		$queries_grid->labels = (array("NAME","QUERY","DESCRIPTION"));
                $queries_grid->paginable = true;
		$queries_grid->editable = true;
                //
                $queries_grid->edit_form = "phpapps_database_queries_form_imp.php?module_id=".$this->ID;
		$queries_grid->filterable = false;
		$queries_grid->exportable = false;
		$queries_grid->rows_on_pg = 10;
                
                
                
                $tsq = new HrefActions();
		$tsq->act_script = "phpapps_database_browse_queries.php?module_id=".$this->ID;
		$tsq->popup = true;
		$tsq->label = "browse";
		$tsq->action = "runGrid";
		$tsq->fields = array("ID");
		$queries_grid->add_row_acction($tsq);
                
                $views_grid = new DB_grid($this->globals->con, "table","{$this->globals->PHPAPPS_DB}.views","phpapps_views_grid");
		//$lists_grid->grid_title = "<table border=1><tr><td align=\"left\">MODULE LISTS</td><td align=\"right\"><a href=\"http://localhost/phpapps/phpapps_admin_lists_form_imp.php?module_id=\"".$this->ID."\"&gact=newRec\">add</a></td></tr></table>";
		$views_grid->grid_title = "VIEWS";
		$views_grid->cols = (array("VIEW_NAME","DESCRIPTION"));
		$views_grid->labels = (array("VIEW_NAME","DESCRIPTION"));
                $views_grid->paginable = true;
		$views_grid->editable = true;
		$views_grid->filterable = false;
		$views_grid->exportable = false;
		$views_grid->rows_on_pg = 10;
                $views_grid->edit_form = "phpapps_database_views_form.php?module_id=".$this->ID;
                
                $tsv = new HrefActions();
		$tsv->act_script = "phpapps_database_browse_views.php?module_id=".$this->ID;
		$tsv->popup = true;
		$tsv->label = "browse";
		$tsv->action = "runGrid";
		$tsv->fields = array("ID");
		$views_grid->add_row_acction($tsv);
                
                $this->globals->sm->assign("databases_grid",$databases_grid->get_grid_str());
                $this->globals->sm->assign("db_tables_grid",$tables_grid->get_grid_str());
		$this->globals->sm->assign("db_lists_grid",$lists_grid->get_grid_str());
                $this->globals->sm->assign("queries_grid",$queries_grid->get_grid_str());
                $this->globals->sm->assign("views_grid",$views_grid->get_grid_str());
                
                
                $base_grds = new phpapps_modules_base_grids($this->ID);
                $base_grds->baseGrids();
                
                $this->globals->sm->assign("module",$this);
    }
    /*
    public function display_tpl(){
                $this->setupLayoutElements();
		$this->globals->sm->display("phpapps_database_module.tpl");
	}*/
}   

new phpapps_database_module($_GET["module_id"]);
?>