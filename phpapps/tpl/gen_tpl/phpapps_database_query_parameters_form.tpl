<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_designer_themes_form").submit();
}
  </script>
 
{$error_msg}
<hr><form name="phpapps_database_query_parameters_form" id="phpapps_database_query_parameters_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
										<input id="ID" type="hidden" name="ID" value="{$ID}">
        								
			
		                
		                				 
										<input id="QUERY_ID" type="hidden" name="QUERY_ID" value="{$QUERY_ID}">
        								
			
		                
		                				 
				<tr><td align="right">PARAMETER_NAME :</td><td> <input type="text" id="PARAMETER_NAME" name="PARAMETER_NAME" value="{$PARAMETER_NAME}"></td></tr>
																
			
		                
		                				 
				<tr><td align="right">PARAMETER_VALUE :</td><td> <input type="text" id="PARAMETER_VALUE" name="PARAMETER_VALUE" value="{$PARAMETER_VALUE}"></td></tr>
																
			
		                
		                				 
																
			
				<tr><td align="right">PARAMETER_TYPE  :</td><td>
			{$PARAMETER_TYPE_sel}
		</td></tr>
                        
		                				{$FROM_IMP_CLASS}
		{if $gact == "editRec"}
		<tr><td></td><td>
			<input type="submit" value="salveaza" onClick='submitDetailsForm("saveRec")'></td></tr>
		{else}
			<tr><td><input type="submit" value="adauga" onClick='submitDetailsForm("addRec")'></td><td></td></tr>
		{/if}
		
	</table>
	</form><hr>