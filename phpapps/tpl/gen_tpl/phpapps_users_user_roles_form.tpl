{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_users_user_roles_form").submit();
}
  </script>
{/literal}
{$error_msg}
<hr><form name="phpapps_users_user_roles_form" id="phpapps_users_user_roles_form" method="POST">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
										<input id="UID" type="hidden" name="UID" value="{$UID}">
        								
			
		
				 
																
			
		
				<tr><td align="right">ROLE_ID  :</td><td>
			{$ROLE_ID_sel}
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