<html>
<head>
{include file="commun_header.tpl" }
</head>
<body><br>
<form name="select_table" method="POST">
<input type="hidden" name="act" value="select_table">
<input type="hidden" name="module_id" value="{$module_id}">
<select name="form_table" onChange="this.form.submit();">
<option> -- </option>
{foreach from=$tables item=tbl}
<option value="{$tbl.TABLE_NAME}"> {$tbl.TABLE_NAME} </option>
{/foreach}
</select>
</form>


</body>
</html>