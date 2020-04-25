<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class phpapps_designer_custom_element_run extends phpapps_display_abs{

    private $app_id;
    private $module_id;
    private $script_id;
	private $custom_element_id;
    
    function __construct($app_id) {
        parent::__construct();
        //$this->layout = PHPAPPS_LAYOUTS_DIR . "default.tpl";
        $this->tpl = "phpapps_designer_custom_element_run.tpl";        
        $this->app_id = 1;
        $this->module_id = 21;
        $this->script_id = 265;
        $this->app_id = $app_id;
        $this->display_objects_type_id = '2';
    	$this->display_objects_type = 'SCRIPT';
    	$this->display_objects_id = $this->script_id;
		
		 $this->custom_element_id = $_GET["gfield_value"];
        $sql = new DB_query("SELECT ID,
			NAME,
			APP_ID,
            (SELECT APP_NAME FROM phpapps.applications WHERE phpapps.applications.ID = phpapps.custom_elements.APP_ID) AS APP_NAME
            FROM phpapps.custom_elements
            WHERE ID = :ce_id", 
                array(":ce_id" => $this->custom_element_id));
        
                $this->globals->con->query($sql);
		$this->globals->con->next();
		$app_name = $this->globals->con->get_field("APP_NAME");
		$custom_element_name = $this->globals->con->get_field("NAME");
                
		require_once (GLOBALS_DIR . $app_name . DIR_SEP ."custom_elements" . DIR_SEP. $custom_element_name .".php");
		$custom_obj1 = new $custom_element_name();
                
                
                $this->globals->sm->assign(array("SCRIPT_CONTENT" => $custom_obj1->get_custom_element_str()));
        $this->displayTpl();
    }
}

new phpapps_designer_custom_element_run($_GET["app_id"]);
?>