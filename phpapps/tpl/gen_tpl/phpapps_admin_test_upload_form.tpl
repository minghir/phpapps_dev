{$error_msg}
<hr><form name="phpapps_admin_test_upload_form" id="phpapps_admin_test_upload_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
				<tr><td align="right">ID :</td><td> <input type="text" id="ID" name="ID" value="{$ID}"></td></tr>
																
			
		                
		                				 
																
			
		                
		                				<tr><td align="right">UPLD_FILE :</td><td> <input type="file" id="UPLD_FILE" name="UPLD_FILE" value="{$UPLD_FILE}"></td></tr>
				{$FROM_IMP_CLASS}
		{if $gact == "editRec"}
		<tr><td></td><td>
			<input type="submit" value="salveaza" onClick='submitDetailsForm("saveRec")'></td></tr>
		{else}
			<tr><td><input type="submit" value="adauga" onClick='submitDetailsForm("addRec")'></td><td></td></tr>
		{/if}
		
	</table>
	</form><hr>