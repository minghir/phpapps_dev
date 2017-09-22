{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#imp_exp_test_import_form").submit();
}
  </script>
{/literal}
{$error_msg}
<hr><form name="imp_exp_test_import_form" id="imp_exp_test_import_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
																
			
		                
		                				<tr><td align="right">FILE_PATH :</td><td> <input type="file" id="FILE_PATH" name="FILE_PATH" value="{$FILE_PATH}"></td></tr>
				 
				<tr><td align="right">NUME :</td><td> <input type="text" id="NUME" name="NUME" value="{$NUME}"></td></tr>
																
			
		                
		                				{$FROM_IMP_CLASS}
		{if $gact == "editRec"}
		<tr><td></td><td>
			<input type="submit" value="salveaza" onClick='submitDetailsForm("saveRec")'></td></tr>
		{else}
			<tr><td><input type="submit" value="adauga" onClick='submitDetailsForm("addRec")'></td><td></td></tr>
		{/if}
		
	</table>
	</form><hr>