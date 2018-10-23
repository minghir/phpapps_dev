{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_admin_modules_form").submit();
}
  </script>
{/literal}
{$error_msg}
<hr><form name="phpapps_admin_modules_form" id="phpapps_admin_modules_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
										<input id="APP_ID" type="hidden" name="APP_ID" value="{$APP_ID}">
        								
			
		                
		                				 
																
			
		                
				<tr><td align="right">START SCRIPT  :</td><td>
			{$SCRIPT_ID_sel}
		</td></tr>
                        				 
				<tr><td align="right">MODULE NAME :</td><td> <input type="text" id="MODULE_NAME" name="MODULE_NAME" value="{$MODULE_NAME}"></td></tr>
																
			
		                
		                				 
				<tr><td align="right">MODULE TITLE :</td><td> <input type="text" id="MODULE_TITLE" name="MODULE_TITLE" value="{$MODULE_TITLE}"></td></tr>
																
			
		                
		                				 
										<input id="MODULE_DATE" type="hidden" name="MODULE_DATE" value="{$MODULE_DATE}">
        								
			
		                
		                				 
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