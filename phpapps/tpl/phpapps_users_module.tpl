<html>
<head>
{include file="commun_header.tpl" }
</head>
<body><br>
	<div class="test_div">
	<font style="font-size: 120%;"><a href="phpapps_admin_applications.php">{$module->APP_TITLE}</a> / {$module->MODULE_TITLE} </h1></font><br>
	( <a href="phpapps_admin_modules_form_imp.php?gact=editRec&gfield=ID&gfield_value={$module->ID}">{$module->MODULE_NAME}</a> / {$module->MODULE_DATE} ) 
	</div><br>
	<div class="test_div"  style="width: 90%;">{$users_grid}</div>
	<br>
	<div class="test_div"  style="width: 90%;">{$roles_grid}</div>
	<br>
	<div class="test_div"  style="width: 90%;">{$permissions}</div>
</body>
</html>