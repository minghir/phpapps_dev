<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_designer_themes_form").submit();
}
  </script>
 
{$error_msg}
<hr><form name="phpapps_admin_applications_form" id="phpapps_admin_applications_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table class="table-borderless">
	
		 
										<input id="ID" type="hidden" name="ID" value="{$ID}">
        								
			
		                
		                				 
										<input id="USER_ID" type="hidden" name="USER_ID" value="{$USER_ID}">
        								
			
		                
		                				 
				<tr><td align="right">APP_NAME :</td><td> <input type="text" id="APP_NAME" name="APP_NAME" value="{$APP_NAME}"></td></tr>
																
			
		                
		                				 
				<tr><td align="right">APP_TITLE :</td><td> <input type="text" id="APP_TITLE" name="APP_TITLE" value="{$APP_TITLE}"></td></tr>
																
			
		                
		                				 
																
			
				<tr><td align="right">APP_SCHEMA  :</td><td>
			{$APP_SCHEMA_sel}
		</td></tr>
                        
		                				 
																
			
				<tr><td align="right">APPLICATION_TYPE_ID  :</td><td>
			{$APPLICATION_TYPE_ID_sel}
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