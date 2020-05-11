<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class phpapps_database_browse_queries extends template{

    private $app_id;
    private $get_table_id;
    private $get_module_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->tpl = "phpapps_database_browse_tables.tpl";        
        $this->app_id = $app_id;
        
        $this->get_table_id = $_GET["gfield_value"];
        $this->get_module_id = $_GET["module_id"];
        
        
        
        $sql = new DB_query("SELECT 
				ID, 
				MODULE_ID,
				QUERY_NAME,
				QUERY_BODY,
                                DESCRIPTION
		FROM phpapps.queries
		WHERE 	ID = :id AND 
		MODULE_ID = :module_id ",
	array(":id"=>$this->get_table_id,":module_id"=>$this->get_module_id));
        $this->globals->con->query($sql);	
        $this->globals->con->next();
        
        $sql2 = new DB_query("SELECT PARAMETER_NAME, PARAMETER_VALUE FROM phpapps.query_parameters WHERE QUERY_ID = :QUERY_ID",
                            array(":QUERY_ID"=>$this->globals->con->get_field("ID")));
        $this->globals->con->query($sql2,"sql2");
        while($res = $this->globals->con->fetch_array("sql2") ){
            $query_parameters[$res["PARAMETER_NAME"]] = $res["PARAMETER_VALUE"][0] == '$' ? ${ltrim($res["PARAMETER_VALUE"],'$')} : $res["PARAMETER_VALUE"];
            
        }
        //echo "AA".${"$this->globals->PHPAPPS_APP_DIR"} ."AA<br>";
        //echo "BB".$this->globals->PHPAPPS_APP_DIR ."BB<br>";
        //print_r($query_parameters);

        $grid_name =  "phpapps_".$this->globals->con->get_field("QUERY_NAME")."_grid";
        $query_to_run = new DB_query(stripslashes($this->globals->con->get_field("QUERY_BODY")),$query_parameters);
        
        echo $query_to_run->prnt() ."<br>";
       
        $phpapps_admin_queries_grid =  new DB_grid($this->globals->con, "query", $query_to_run, $grid_name);
        $phpapps_admin_queries_grid->paginable = false;
        $phpapps_admin_queries_grid->sortable = false;
        $phpapps_admin_queries_grid->editable = false;
        $phpapps_admin_queries_grid->filterable = false;
        $phpapps_admin_queries_grid->rows_on_pg = 20;
        $phpapps_admin_queries_grid->grid_title = $this->globals->con->get_field("QUERY_NAME");
        
        $this->globals->sm->assign("SCRIPT_CONTENT",$phpapps_admin_queries_grid->get_grid_str());
        $this->globals->sm->display($this->tpl);
    }
}

new phpapps_database_browse_queries($_GET["app_id"]);
?>