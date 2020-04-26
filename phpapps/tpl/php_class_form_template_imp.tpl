<?php
require_once ("globals.php");
include ("gen_php/{$form_name}.php");
	class {$form_name}_impl  extends {$form_name}{ldelim}
                        public $script_id = {$script_id};
                        public $display_objects_type_id = '2';
                        public $display_objects_type = 'SCRIPT';
                        public $display_objects_id = {$script_id};
                
		function __construct(){ldelim}
			parent::__construct();
                        
                        
                        $this->tpl = "{$form_name}_imp.tpl";
                        $this->display_objects_id = $this->script_id;
                        
                        $this->init();
                        $this->loadElements(); // parent function
			$this->display();
                        
		{rdelim}
		
		function beforeGetRec(){ldelim}
		{rdelim}
		
		function afterGetRec(){ldelim}
		{rdelim}
                
                function beforePostActions(){ldelim}
                {rdelim}
	
		function beforeAddRec(){ldelim}
		{rdelim}
		
		function afterAddRec(){ldelim}
			//header("Location:win_close.html");
		{rdelim}
		
		function beforeSaveRec(){ldelim}
		{rdelim}
		
		function afterSaveRec(){ldelim}
			//header("Location:win_close.html");
		{rdelim}

		function beforeDeleteRec(){ldelim}
		{rdelim}
		
		function afterDeleteRec(){ldelim}
		//	header("Location:win_close.html");
		{rdelim}
		
                function afterPostActions(){ldelim}
                {rdelim}
                
		function beforeDisplay(){ldelim}	
		{rdelim}
		
		function afterDisplay(){ldelim}	
		{rdelim}
		
	{rdelim};
	
	${$form_name}_Impl = new {$form_name}_impl();
?>