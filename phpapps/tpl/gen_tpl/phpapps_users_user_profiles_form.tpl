{$error_msg}
<hr><form name="phpapps_users_user_profiles_form" id="phpapps_users_user_profiles_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
																
			
		                
				<tr><td align="right">SCRIPT_ID  :</td><td>
			{$SCRIPT_ID_sel}
		</td></tr>
                        				 
				<tr><td align="right">PROFILE_NAME :</td><td> <input type="text" id="PROFILE_NAME" name="PROFILE_NAME" value="{$PROFILE_NAME}"></td></tr>
																
			
		                
		                				 
				<tr><td align="right">THEME :</td><td> <input type="text" id="THEME" name="THEME" value="{$THEME}"></td></tr>
																
			
		                
		                				 
																
			
		                
				<tr><td align="right">USER_ID  :</td><td>
			{$USER_ID_sel}
		</td></tr>
                        				 
																
			
		                
				<tr><td align="right">THEME_ID  :</td><td>
			{$THEME_ID_sel}
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