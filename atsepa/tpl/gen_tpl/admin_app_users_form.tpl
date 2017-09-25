{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#admin_app_users_form").submit();
}
  </script>
{/literal}
{$error_msg}
<hr><form name="admin_app_users_form" id="admin_app_users_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
				<tr><td align="right">USERNAME :</td><td> <input type="text" id="USERNAME" name="USERNAME" value="{$USERNAME}"></td></tr>
																
			
		                
		                				 
				<tr><td align="right">PASSWORD :</td><td> <input type="text" id="PASSWORD" name="PASSWORD" value="{$PASSWORD}"></td></tr>
																
			
		                
		                				 
				<tr><td align="right">EMAIL :</td><td> <input type="text" id="EMAIL" name="EMAIL" value="{$EMAIL}"></td></tr>
																
			
		                
		                				 
																
			
				<tr><td align="right">USER_TYPE  :</td><td>
			{$USER_TYPE_sel}
		</td></tr>
                        
		                				 
																<!-- <tr><td align="right">JOIN_DATE :</td><td> <input type="text" class="tcal" name="JOIN_DATE" value="{$JOIN_DATE}"></td></tr> -->
		<tr><td align="right">JOIN_DATE :</td><td> <input id="JOIN_DATE" type="date" name="JOIN_DATE" value="{$JOIN_DATE}"></td></tr>
        		
			
		                
		                				{$FROM_IMP_CLASS}
		{if $gact == "editRec"}
		<tr><td></td><td>
			<input type="submit" value="salveaza" onClick='submitDetailsForm("saveRec")'></td></tr>
		{else}
			<tr><td><input type="submit" value="adauga" onClick='submitDetailsForm("addRec")'></td><td></td></tr>
		{/if}
		
	</table>
	</form><hr>