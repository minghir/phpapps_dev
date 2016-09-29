{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_database_table_details_form").submit();
}
  </script>
{/literal}
{$error_msg}
<hr><form name="phpapps_database_table_details_form" id="phpapps_database_table_details_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
										<input id="ID" type="hidden" name="ID" value="{$ID}">
        								
			
		
						 
										<input id="TABLE_ID" type="hidden" name="TABLE_ID" value="{$TABLE_ID}">
        								
			
		
						 
				<tr><td align="right">COLUMN_NAME :</td><td> <input type="text" id="COLUMN_NAME" name="COLUMN_NAME" value="{$COLUMN_NAME}"></td></tr>
																
			
		
						 
																
			
				<tr><td align="right">COLUMN_TYPE_ID  :</td><td>
			{$COLUMN_TYPE_ID_sel}
		</td></tr>
        
						 
				<tr><td align="right">COLUMN_SIZE :</td><td> <input type="text" id="COLUMN_SIZE" name="COLUMN_SIZE" value="{$COLUMN_SIZE}"></td></tr>
																
			
		
						 
				<tr><td align="right">COLUMN_DEFAULT_VALUE :</td><td> <input type="text" id="COLUMN_DEFAULT_VALUE" name="COLUMN_DEFAULT_VALUE" value="{$COLUMN_DEFAULT_VALUE}"></td></tr>
																
			
		
						 
																
			
		
				<tr><td align="right">FOREIGN_KEY_TABLE  :</td><td>
			{$FOREIGN_KEY_TABLE_ID_sel}
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