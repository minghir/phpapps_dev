<?php
namespace wabdo;
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
                        $this->load_elements(); // parent function
			$this->display();
                        
		{rdelim}
		
		function before_get_rec(){ldelim}
		{rdelim}
		
		function after_get_rec(){ldelim}
		{rdelim}
                
                function before_post_actions(){ldelim}
                {rdelim}
	
		function before_add_rec(){ldelim}
		{rdelim}
		
		function after_add_rec(){ldelim}
			//header("Location:win_close.html");
		{rdelim}
		
		function before_save_rec(){ldelim}
		{rdelim}
		
		function after_save_rec(){ldelim}
			//header("Location:win_close.html");
		{rdelim}

		function before_delete_rec(){ldelim}
		{rdelim}
		
		function after_delete_rec(){ldelim}
		//	header("Location:win_close.html");
		{rdelim}
		
                function after_post_actions(){ldelim}
                {rdelim}
                
		function before_display(){ldelim}	
		{rdelim}
		
		function after_display(){ldelim}	
		{rdelim}
		
	{rdelim};
	
	${$form_name}_Impl = new {$form_name}_impl();
?>