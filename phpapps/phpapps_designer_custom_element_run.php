<?php
namespace wabdo;
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class phpapps_designer_custom_element_run extends template{

    private $app_id;
    private $module_id;
    //private $script_id;
	public $custom_element_id;
        public $script_id = 265;
    
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
    	$this->display_objects_id = 265;
		
		 $this->custom_element_id = $_GET["gfield_value"];
        $sql = new DB_query("SELECT ID,
			NAME,
			APP_ID,
            (SELECT APP_NAME FROM {$this->globals->PHPAPPS_DB}.applications WHERE {$this->globals->PHPAPPS_DB}.applications.ID = {$this->globals->PHPAPPS_DB}.custom_elements.APP_ID) AS APP_NAME
            FROM {$this->globals->PHPAPPS_DB}.custom_elements
            WHERE ID = :ce_id", 
                array(":ce_id" => $this->custom_element_id));
        
                $this->globals->con->query($sql);
		$this->globals->con->next();
		$app_name = $this->globals->con->get_field("APP_NAME");
		$custom_element_name = strtolower($this->globals->con->get_field("NAME"));
               
		require_once (strtolower (GLOBALS_DIR . $app_name . DIR_SEP ."custom_elements" . DIR_SEP. $custom_element_name .".php"));
                $custom_element_class_name = "wabdo\\".$custom_element_name;
		$custom_obj1 = new $custom_element_class_name();
                
                
                $this->globals->sm->assign(array("SCRIPT_CONTENT" => $custom_obj1->get_custom_element_str()));
                $this->load_elements();
                $this->display_template();
    }
}

new phpapps_designer_custom_element_run($_GET["app_id"]);
?>