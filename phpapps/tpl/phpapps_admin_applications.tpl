<html>
<head>
{include file="commun_header.tpl" }
</head>
<body bgcolor="#dddddd"><br>


<div class="test_div">
<a href="phpapps_admin_applications_form_imp.php?gact=addRec"  style="text-decoration:none">
  Add new empty application
</a> | 
<a href="phpapps_admin_applications_form_imp.php?gact=addRec"  style="text-decoration:none">
  Create new application from template
</a>
  </div>

<br>
{foreach from=$rows item=app}
	<div class="test_div"><p>{$app.APP_TITLE} ( <a href="phpapps_admin_applications_form_imp.php?gact=editRec&gfield=ID&gfield_value={$app.ID}">{$app.APP_NAME}</a> ) <br>
	<font style="font-size: 60%;">{$app.USERNAME} / {$app.APP_DATE} </font></p>
		{$app.DESCRIPTION}<br>
		<a href="phpapps_admin_modules_form_imp.php?gfield_value={$app.ID}&gfield=app_id">add new module</a> |
		<a href="phpapps_admin_applications_form_imp.php?gact=deleteRec&gfield=ID&gfield_value={$app.ID}">delete app</a>
		<br><b>Modules:</b><br>
		{foreach from=$modules[$app.ID] item=mod}
				{if $mod.SCRIPT_NAME != "phpapps_admin_module"}
					<a href="{$mod.SCRIPT_NAME}.php?module_id={$mod.ID}" title="{$mod.DESCRIPTION}">{$mod.MODULE_TITLE}</a> ( <a href="phpapps_admin_module.php?module_id={$mod.ID}" title="{$mod.DESCRIPTION}">admin</a> | <a href="phpapps_admin_modules_form_imp.php?gfield_value={$mod.ID}&gfield=ID&gact=deleteRec">delete</a> ) <br>
				{else}
					{$mod.MODULE_TITLE} ( <a href="phpapps_admin_module.php?module_id={$mod.ID}" title="{$mod.DESCRIPTION}">admin</a> | <a href="phpapps_admin_modules_form_imp.php?gfield_value={$mod.ID}&gfield=ID&gact=deleteRec">delete</a> ) <br>
				{/if}
		{/foreach}
	</div><br>
{/foreach}
</body>
</html>