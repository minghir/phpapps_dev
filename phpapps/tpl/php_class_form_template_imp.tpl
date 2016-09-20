<?php
require_once ("globals.php");
include ("gen_php/{$form_name}.php");
	class {$form_name}_impl  extends {$form_name}{ldelim}
		function __construct(){ldelim}
			parent::__construct();
			$this->template = "{$form_name}_imp.tpl";
			$this->init();
			$this->display();
		{rdelim}
		
		function beforeGetRec(){ldelim}
		{rdelim}
		
		function afterGetRec(){ldelim}
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
		
		function beforeDisplay(){ldelim}	
		{rdelim}
		
		function afterDisplay(){ldelim}	
		{rdelim}
		
	{rdelim};
	
	${$form_name}_Impl = new {$form_name}_impl();
?>