<?php
// includes
require_once ("globals.php");

class {$form_name}{ldelim}
	public $globals;
	public $schema = "{$schema}";
	public $table = "{$table}";
	public $template = "gen_tpl/{$form_name}.tpl";
	//get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
	{section name=ds loop=$fields}
	public ${$fields[ds]};
	{/section}
	
	{section name=lis loop=$selected_schema_list}
	{if $selected_schema_list[lis] != "" }
	public ${$fields[lis]}_sel;
	{/if} 
	{/section}
		
	{section name=lis loop=$selected_schema_table}
	{if $selected_schema_table[lis] != "" }
	public ${$fields[lis]}_sel;
	{/if} 
	{/section}

	public $errors = array();
	
	function __construct(){ldelim}
		global $GLOBALS_OBJ;
		$this->globals = $GLOBALS_OBJ;
	{rdelim}
		
	function init(){ldelim}
		if($_SERVER['REQUEST_METHOD'] === 'POST') {ldelim}
			$this->parsePostVars();
		{rdelim} else {ldelim}
			$this->parseGetVars();
		{rdelim}
	{rdelim}
	
	function beforeGetRec(){ldelim}
	{rdelim}
	
	function getRec(){ldelim}
		$sql = new DB_query( "SELECT 
			{section name=ds1 loop=$fields}
			{if $smarty.section.ds1.last }
			{$fields[ds1]}
			{else}
			{$fields[ds1]},
			{/if}
			{/section}	
				FROM ".$this->schema.".".$this->table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($sql);
			$this->globals->con->next();
			{section name=ds loop=$fields}
				$this->{$fields[ds]} = $this->globals->con->get_field("{$fields[ds]}");
			{/section}
			
	{rdelim}
	
	function afterGetRec(){ldelim}
	{rdelim}
	
	function beforeAddRec(){ldelim}
	{rdelim}
	
	function addRec(){ldelim}
		$this->beforeAddRec();
	
		$this->check_errors();
		$sql = new DB_query("INSERT INTO ".$this->schema.".".$this->table." (
			{section name=ds1 loop=$fields}
			{if $smarty.section.ds1.last }
			{$fields[ds1]}
			{else}
			{$fields[ds1]},
			{/if}
			{/section} ) VALUES (
			{section name=ds1 loop=$fields}
			{if $smarty.section.ds1.last }
			:{$fields[ds1]}
			{else}
			:{$fields[ds1]},
			{/if}
			{/section}
			)",
			array(
				{section name=ds1 loop=$fields}
					":{$fields[ds1]}" => $this->{$fields[ds1]},
				{/section}
			)
			);

		if(count($this->errors) == 0) {	
			$this->globals->con->query($sql);
		}
		
		$this->afterAddRec();
	{rdelim}
	
	function afterAddRec(){ldelim}
		header("Location:win_close.html");
	{rdelim}
	
	function beforeSaveRec(){ldelim}
	{rdelim}
	
	function saveRec(){ldelim}
		$this->beforeSaveRec();
		
		$this->check_errors();
		
		$sql = new DB_query("UPDATE ".$this->schema.".".$this->table." SET 
			{section name=ds1 loop=$fields}
			{if $smarty.section.ds1.last }
			{$fields[ds1]} = :{$fields[ds1]}
			{else}
			{$fields[ds1]} = :{$fields[ds1]},
			{/if}
			{/section}	
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
				{section name=ds1 loop=$fields}
					":{$fields[ds1]}" => $this->{$fields[ds1]},
				{/section}
				":".$this->gfield => $this->gfield_value
			)	
			);
				
		if(count($this->errors) == 0) {	
			$this->globals->con->query($sql);
		};
		
		$this->afterSaveRec();
	{rdelim}
	
	function afterSaveRec(){ldelim}
		header("Location:win_close.html");
	{rdelim}

	function beforeDeleteRec(){ldelim}
	{rdelim}
	
	function deleteRec(){ldelim}
		$this->beforeDeleteRec();
		
		$sql = new DB_query("DELETE FROM ".$this->schema.".".$this->table."
				WHERE ".$this->gfield." = :".$this->gfield, array(":".$this->gfield=>$this->gfield_value) );
				
		if(count($this->errors) == 0) {	
			$this->globals->con->query($sql);
		}
		
		$this->afterDeleteRec();
	{rdelim}
	
	function afterDeleteRec(){ldelim}
		header("Location:win_close.html");
	{rdelim}
	
	function parseGetVars(){ldelim}
		$this->gact = trim($_GET["gact"]);
		$this->gfield = trim($_GET["gfield"]);
		$this->gfield_value = trim($_GET["gfield_value"]);
		
			switch($this->gact){ldelim}
			case "editRec":
				$this->beforeGetRec();
				$this->getRec();
				$this->afterGetRec();
			break;
			case "deleteRec":
				$this->deleteRec();
			break;
			case "addRec":
			break;
		{rdelim}
	{rdelim}
	
	function parsePostVars(){ldelim}
		$this->pact = $_POST["pact"];
		$this->gact = $_POST["gact"];
		$this->gfield = $_POST["gfield"];
		$this->gfield_value = $_POST["gfield_value"];
		
		{section name=ds loop=$fields}
			$this->{$fields[ds]}  = addslashes(trim($_POST["{$fields[ds]}"]));
		{/section}
		
		switch($this->pact){ldelim}
			case "addRec":
				$this->addRec();
			break;
			case "saveRec":
				$this->saveRec();
			break;
			case "deleteRec":
				$this->deleteRec();
			break;
		{rdelim}
		
	{rdelim}
	
	function check_errors(){ldelim}
		{section name=md loop=$mandatories}
		if($this->{$mandatories[md]} == "") {ldelim}
			$this->errors[] = "Campul {$mandatories[md]} este obligatoriu!";
		{rdelim}
		{/section}
	{rdelim}
	
	function setup_display(){ldelim}
		{section name=lis loop=$selected_schema_list}
			{if $selected_schema_list[lis] != "" }
			$this->{$fields[lis]}_sel = new DB_select("{$fields[lis]}","{$schema}.{$selected_schema_list[lis]}");
			$this->{$fields[lis]}_sel->selected_val = $this->{$fields[lis]};
			$this->{$fields[lis]}_sel->setup_select_options();
			{/if} 
		{/section}
		
		{section name=lis loop=$selected_schema_table}
			{if $selected_schema_table[lis] != "" }
				$this->{$fields[lis]}_sel = new DB_select("{$fields[lis]}","{$schema}.{$selected_schema_table[lis]}");
				$this->{$fields[lis]}_sel->query = "SELECT ID AS VALUE, {$selected_schema_field[lis]} AS LABEL FROM {$schema}.{$selected_schema_table[lis]} ORDER BY {$selected_schema_field[lis]}";
				$this->{$fields[lis]}_sel->selected_val = $this->{$fields[lis]};
				$this->{$fields[lis]}_sel->setup_select_options();
			{/if} 
		{/section}
	
		$error_msg = count($this->errors) > 0 ? implode("<br>",$this->errors) : "";
		$this->globals->sm->assign(array(
			{section name=ds loop=$fields}
				"{$fields[ds]}" => $this->{$fields[ds]},
			{/section}
			{section name=lis loop=$selected_schema_list}
			{if $selected_schema_list[lis] != "" }
				"{$fields[lis]}_sel" => $this->{$fields[lis]}_sel->get_select_str(),
			{/if} 
			{/section}
			{section name=lis loop=$selected_schema_table}
			{if $selected_schema_table[lis] != "" }
				"{$fields[lis]}_sel" => $this->{$fields[lis]}_sel->get_select_str(),
			{/if} 
			{/section}
			"pact" => $this->pact,
			"gact" => $this->gact,
			"gfield" => $this->gfield,
			"gfield_value" => $this->gfield_value,
			"error_msg" => $error_msg,
		));
	{rdelim}
	
	function beforeDisplay(){ldelim}	
	{rdelim}
	
	function display(){ldelim}	
		$this->setup_display();
		
		$this->beforeDisplay();
		
		$this->globals->sm->display($this->template);
		
		$this->afterDisplay();
	{rdelim}
	
	function afterDisplay(){ldelim}	
	{rdelim}
	
	function get_html_str(){ldelim}	
		$this->setup_display();
		
		$this->beforeDisplay();
		
		$this->globals->sm->fetch($this->template);
	{rdelim}
{rdelim};
?>
