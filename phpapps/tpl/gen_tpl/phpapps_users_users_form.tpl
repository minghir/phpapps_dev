{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_users_users_form").submit();
}
  </script>
{/literal}
{$error_msg}
<hr><form name="phpapps_users_users_form" id="phpapps_users_users_form" method="POST">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
				<tr><td align="right">USERNAME :</td><td> <input type="text" id="USERNAME" name="USERNAME" value="{$USERNAME}"></td></tr>
																
			
		
				 
				<tr><td align="right">PASSWORD :</td><td> <input type="text" id="PASSWORD" name="PASSWORD" value="{$PASSWORD}"></td></tr>
																
			
		
				 
				<tr><td align="right">FIRSTNAME :</td><td> <input type="text" id="FIRSTNAME" name="FIRSTNAME" value="{$FIRSTNAME}"></td></tr>
																
			
		
				 
				<tr><td align="right">LASTNAME :</td><td> <input type="text" id="LASTNAME" name="LASTNAME" value="{$LASTNAME}"></td></tr>
																
			
		
				 
				<tr><td align="right">EMAIL :</td><td> <input type="text" id="EMAIL" name="EMAIL" value="{$EMAIL}"></td></tr>
																
			
		
				 
																
			
				<tr><td align="right">USER_TYPE  :</td><td>
			{$USER_TYPE_sel}
		</td></tr>
        
				 
								<tr><td align="right">DESCRIPTION  :</td><td> <textarea id="DESCRIPTION" name="DESCRIPTION">{$DESCRIPTION}</textarea></td></tr>
        										
			
		
				 
																
			
		
				<tr><td align="right">PROFILE_ID  :</td><td>
			{$PROFILE_ID_sel}
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