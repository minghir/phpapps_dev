{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_database_columns_fks_form").submit();
}
  </script>
{/literal}
{$error_msg}
<hr><form name="phpapps_database_columns_fks_form" id="phpapps_database_columns_fks_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
										<input id="ID" type="hidden" name="ID" value="{$ID}">
        								
			
		
						 
																
			
		
				<tr><td align="right">COLUMN_ID  :</td><td>
			{$COLUMN_ID_sel}
		</td></tr>
        				 
				<tr><td align="right">FK_NAME :</td><td> <input type="text" id="FK_NAME" name="FK_NAME" value="{$FK_NAME}"></td></tr>
																
			
		
						 
																
			
		
				<tr><td align="right">FK_TABLE_ID  :</td><td>
			{$FK_TABLE_ID_sel}
		</td></tr>
        				 
																
			
		
				<tr><td align="right">FK_COLUMN  :</td><td>
			{$FK_COLUMN_sel}
		</td></tr>
        				 
																
			
				<tr><td align="right">ON_UPDATE  :</td><td>
			{$ON_UPDATE_sel}
		</td></tr>
        
						 
																
			
				<tr><td align="right">ON_DELETE  :</td><td>
			{$ON_DELETE_sel}
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