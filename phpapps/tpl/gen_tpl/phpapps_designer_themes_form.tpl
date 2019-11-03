{$error_msg}
<hr><form name="phpapps_designer_themes_form" id="phpapps_designer_themes_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
										<input id="ID" type="hidden" name="ID" value="{$ID}">
        								
			
		                
		                				 
				<tr><td align="right">THEME_NAME :</td><td> <input type="text" id="THEME_NAME" name="THEME_NAME" value="{$THEME_NAME}"></td></tr>
																
			
		                
		                				 
				<tr><td align="right">THEME_CSS_FILE :</td><td> <input type="text" id="THEME_CSS_FILE" name="THEME_CSS_FILE" value="{$THEME_CSS_FILE}"></td></tr>
																
			
		                
		                				{$FROM_IMP_CLASS}
		{if $gact == "editRec"}
		<tr><td></td><td>
			<input type="submit" value="salveaza" onClick='submitDetailsForm("saveRec")'></td></tr>
		{else}
			<tr><td><input type="submit" value="adauga" onClick='submitDetailsForm("addRec")'></td><td></td></tr>
		{/if}
		
	</table>
	</form><hr>