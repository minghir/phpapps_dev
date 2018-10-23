<html>
<head>
<link rel="stylesheet" href="css/curs.css" type="text/css"> 
{include file="commun_header.tpl" }

</head>
<body>
{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#php_quiz_questions_questions_form").submit();
}
  </script>
{/literal}
{$error_msg}
<hr><form name="php_quiz_questions_questions_form" id="php_quiz_questions_questions_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="0">
	<tr><td align="right">Nr:</td><td> <input type="text" id="NO" name="NO" value="{$NO}"></td></tr>
        <tr><td align="right">Categorie:</td><td>{$CATEG_ID_sel}</td></tr>
        <tr><td align="right">Intrebare:</td><td> <textarea id="QUESTION" name="QUESTION" rows="4" cols="150">{$QUESTION}</textarea><br></td></tr>
        <tr><td colspan="2"><hr><br></td></tr>
        <tr><td align="right" bgcolor="#d1d2d3">Raspuns 1:</td><td> <textarea id="ANSWER_1" name="ANSWER_1" rows="4" cols="150">{$ANSWER_1}</textarea></td></tr>
        <tr><td align="right" bgcolor="#d1d2d3">Corect 1:</td><td bgcolor="#d1d2d3">{$CORRECT_1_sel}<br></td></tr>
        <tr><td colspan="2"><hr></td></tr>
	<tr><td align="right">Raspuns 2:</td><td> <textarea id="ANSWER_2" name="ANSWER_2" rows="4" cols="150">{$ANSWER_2}</textarea></td></tr>
	<tr><td align="right">Corect 2:</td><td>{$CORRECT_2_sel}</td></tr>
        <tr><td colspan="2"><hr></td></tr>
	<tr><td align="right" bgcolor="#d1d2d3">Raspuns 3:</td><td bgcolor="#d1d2d3"> <textarea id="ANSWER_3" name="ANSWER_3" rows="4" cols="150">{$ANSWER_3}</textarea></td></tr>
        <tr><td align="right" bgcolor="#d1d2d3">Corect 3:</td><td  bgcolor="#d1d2d3">{$CORRECT_3_sel}</td></tr>
        <tr><td colspan="2"><hr></td></tr>
	<tr><td align="right">Raspuns 4:</td><td> <textarea id="ANSWER_4" name="ANSWER_4" rows="4" cols="150">{$ANSWER_4}</textarea></td></tr>
        <tr><td align="right">Corect 4:</td><td>{$CORRECT_4_sel}</td></tr>
            {$FROM_IMP_CLASS}
	{if $gact == "editRec"}
	<tr><td></td><td>
		<input type="submit" value="salveaza" onClick='submitDetailsForm("saveRec")'></td></tr>
	{else}
		<tr><td><input type="submit" value="adauga" onClick='submitDetailsForm("addRec")'></td><td></td></tr>
	{/if}
	</table>
	</form><hr>
</body>
</html>