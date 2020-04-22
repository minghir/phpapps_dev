<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_designer_themes_form").submit();
}
  </script>
 
{$error_msg}
<hr><form name="phpapps_designer_grid_columns_form" id="phpapps_designer_grid_columns_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
										<input id="ID" type="hidden" name="ID" value="{$ID}">
        								
			
		                
		                				 
										<input id="GRID_ID" type="hidden" name="GRID_ID" value="{$GRID_ID}">
        								
			
		                
		                				 
																
			
		                
				<tr><td align="right">COLUMN_ID  :</td><td>
			{$COLUMN_ID_sel}
		</td></tr>
                        				 
				<tr><td align="right">LABEL :</td><td> <input type="text" id="LABEL" name="LABEL" value="{$LABEL}"></td></tr>
																
			
		                
		                				 
				<tr><td align="right">ACTION :</td><td> <input type="text" id="ACTION" name="ACTION" value="{$ACTION}"></td></tr>
																
			
		                
		                				 
								<tr><td align="right">ALT_COLUMN_TEXT  :</td><td> <textarea id="ALT_COLUMN_TEXT" name="ALT_COLUMN_TEXT">{$ALT_COLUMN_TEXT}</textarea></td></tr>
        										
			
		                
		                				{$FROM_IMP_CLASS}
		{if $gact == "editRec"}
		<tr><td></td><td>
			<input type="submit" value="salveaza" onClick='submitDetailsForm("saveRec")'></td></tr>
		{else}
			<tr><td><input type="submit" value="adauga" onClick='submitDetailsForm("addRec")'></td><td></td></tr>
		{/if}
		
	</table>
	</form><hr>