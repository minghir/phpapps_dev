<html>
<head>
{include file="{$PHPAPPS_SMARTY_TPL_DIR}commun_header.tpl" }
</head>
<body>
{$SCRIPT_CONTENT}
<form name="import" method="POST" enctype="multipart/form-data">
Load file<input type="file"  name="fileToUpload" id="fileToUpload"> into table
{$TABLE_sel}
<input type="submit" name="act_imp" value="IMPORT">
</form>
</body>
</html>