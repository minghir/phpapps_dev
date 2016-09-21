{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_database_lists_form").submit();
}
  </script>
{/literal}
{$error_msg}
<hr><form name="phpapps_database_lists_form" id="phpapps_database_lists_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
										<input id="ID" type="hidden" name="ID" value="{$ID}">
        								
			
		
						 
										<input id="MODULE_ID" type="hidden" name="MODULE_ID" value="{$MODULE_ID}">
        								
			
		
						 
										<input id="SCHEMA_ID" type="hidden" name="SCHEMA_ID" value="{$SCHEMA_ID}">
        								
			
		
						 
				<tr><td align="right">LIST_NAME :</td><td> <input type="text" id="TABLE_NAME" name="TABLE_NAME" value="{$TABLE_NAME}"></td></tr>
																
			
		
						 
										<input id="TABLE_TYPE" type="hidden" name="TABLE_TYPE" value="{$TABLE_TYPE}">
        								
			
		
						 
								<tr><td align="right">DESCRIPTION  :</td><td> <textarea id="DESCRIPTION" name="DESCRIPTION">{$DESCRIPTION}</textarea></td></tr>
        										
			
		
						{$FROM_IMP_CLASS}
		{if $gact == "editRec"}
		<tr><td></td><td>
			<input type="submit" value="salveaza" onClick='submitDetailsForm("saveRec")'></td></tr>
		{else}
			<tr><td><input type="submit" value="adauga" onClick='submitDetailsForm("addRec")'></td><td></td></tr>
		{/if}
		
	</table>
	</form><hr>