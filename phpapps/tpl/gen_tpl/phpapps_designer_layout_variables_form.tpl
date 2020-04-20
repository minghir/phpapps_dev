<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_designer_themes_form").submit();
}
  </script>
 
{$error_msg}
<hr><form name="phpapps_designer_layout_variables_form" id="phpapps_designer_layout_variables_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
										<input id="ID" type="hidden" name="ID" value="{$ID}">
        								
			
		                
		                				 
																
			
		                
				<tr><td align="right">LAYOUT_ID  :</td><td>
			{$LAYOUT_ID_sel}
		</td></tr>
                        				 
				<tr><td align="right">VARIABLE_NAME :</td><td> <input type="text" id="VARIABLE_NAME" name="VARIABLE_NAME" value="{$VARIABLE_NAME}"></td></tr>
																
			
		                
		                				 
								<tr><td align="right">VARIABLE_CONTENT  :</td><td> <textarea id="VARIABLE_CONTENT" name="VARIABLE_CONTENT">{$VARIABLE_CONTENT}</textarea></td></tr>
        										
			
		                
		                				{$FROM_IMP_CLASS}
		{if $gact == "editRec"}
		<tr><td></td><td>
			<input type="submit" value="salveaza" onClick='submitDetailsForm("saveRec")'></td></tr>
		{else}
			<tr><td><input type="submit" value="adauga" onClick='submitDetailsForm("addRec")'></td><td></td></tr>
		{/if}
		
	</table>
	</form><hr>