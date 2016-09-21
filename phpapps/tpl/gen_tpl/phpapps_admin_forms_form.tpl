{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_admin_forms_form").submit();
}
  </script>
{/literal}
{$error_msg}
<hr><form name="phpapps_admin_forms_form" id="phpapps_admin_forms_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
										<input id="ID" type="hidden" name="ID" value="{$ID}">
        								
			
		
						 
																
			
		
				<tr><td align="right">MODULE  :</td><td>
			{$MODULE_ID_sel}
		</td></tr>
        				 
				<tr><td align="right">FORM_NAME :</td><td> <input type="text" id="FORM_NAME" name="FORM_NAME" value="{$FORM_NAME}"></td></tr>
																
			
		
						 
																
			
		
				<tr><td align="right">TABLE  :</td><td>
			{$TABLE_ID_sel}
		</td></tr>
        				 
				<tr><td align="right">FORM_QUERY :</td><td> <input type="text" id="FORM_QUERY" name="FORM_QUERY" value="{$FORM_QUERY}"></td></tr>
																
			
		
						 
				<tr><td align="right">FORM_PHP_DIR :</td><td> <input type="text" id="FORM_PHP_DIR" name="FORM_PHP_DIR" value="{$FORM_PHP_DIR}"></td></tr>
																
			
		
						 
				<tr><td align="right">FORM_TPL_DIR :</td><td> <input type="text" id="FORM_TPL_DIR" name="FORM_TPL_DIR" value="{$FORM_TPL_DIR}"></td></tr>
																
			
		
						 
				<tr><td align="right">DESCRIPTION :</td><td> <input type="text" id="DESCRIPTION" name="DESCRIPTION" value="{$DESCRIPTION}"></td></tr>
																
			
		
						{$FROM_IMP_CLASS}
		{if $gact == "editRec"}
		<tr><td></td><td>
			<input type="submit" value="salveaza" onClick='submitDetailsForm("saveRec")'></td></tr>
		{else}
			<tr><td><input type="submit" value="adauga" onClick='submitDetailsForm("addRec")'></td><td></td></tr>
		{/if}
		
	</table>
	</form><hr>