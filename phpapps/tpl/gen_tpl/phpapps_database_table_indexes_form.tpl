{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_database_table_indexes_form").submit();
}
  </script>
{/literal}
{$error_msg}
<hr><form name="phpapps_database_table_indexes_form" id="phpapps_database_table_indexes_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
										<input id="ID" type="hidden" name="ID" value="{$ID}">
        								
			
		
						 
																
			
		
				<tr><td align="right">TABLE_ID  :</td><td>
			{$TABLE_ID_sel}
		</td></tr>
        				 
				<tr><td align="right">INDEX_NAME :</td><td> <input type="text" id="INDEX_NAME" name="INDEX_NAME" value="{$INDEX_NAME}"></td></tr>
																
			
		
						 
																
			
				<tr><td align="right">INDEX_TYPE  :</td><td>
			{$INDEX_TYPE_sel}
		</td></tr>
        
						 
																
			
		
				<tr><td align="right">INDEX_COLUMNS  :</td><td>
			{$INDEX_COLUMNS_sel}
		</td></tr>
        				 
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