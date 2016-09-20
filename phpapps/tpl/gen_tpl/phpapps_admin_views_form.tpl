{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_admin_views_form").submit();
}
  </script>
{/literal}
{$error_msg}
<hr><form name="phpapps_admin_views_form" id="phpapps_admin_views_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
																
			
		
				<tr><td align="right">MODULE_ID  :</td><td>
			{$MODULE_ID_sel}
		</td></tr>
        				 
				<tr><td align="right">VIEW_NAME :</td><td> <input type="text" id="VIEW_NAME" name="VIEW_NAME" value="{$VIEW_NAME}"></td></tr>
																
			
		
						 
								<tr><td align="right">CREATE_VIEW_QUERY  :</td><td> <textarea id="CREATE_VIEW_QUERY" name="CREATE_VIEW_QUERY">{$CREATE_VIEW_QUERY}</textarea></td></tr>
        										
			
		
						 
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