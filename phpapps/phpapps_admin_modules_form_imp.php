<?php
require_once ("globals.php");
include ("gen_php/phpapps_admin_modules_form.php");
	class phpapps_admin_modules_form_impl  extends phpapps_admin_modules_form{
			public $script_id = 65;
            public $display_objects_type_id = '2';
            public $display_objects_type = 'SCRIPT';
            public $display_objects_id = 65;
		
            function __construct() {
                parent::__construct();
            		$this->APP_ID=$_GET["gfield_value"];
			$this->MODULE_DATE=date("Y-m-d");
			$this->tpl = "phpapps_admin_modules_form_imp.tpl";
			$this->init();
			$this->loadElements();	
			$this->display();
		}
	};
	
	$phpapps_admin_modules_form_Impl = new phpapps_admin_modules_form_impl();
?>