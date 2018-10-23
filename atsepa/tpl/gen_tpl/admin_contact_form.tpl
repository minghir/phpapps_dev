{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#admin_contact_form").submit();
}
  </script>
{/literal}
{$error_msg}
<hr><form name="admin_contact_form" id="admin_contact_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
				<tr><td align="right">SUBJECT :</td><td> <input type="text" id="SUBJECT" name="SUBJECT" value="{$SUBJECT}"></td></tr>
																
			
		                
		                				 
				<tr><td align="right">NAME :</td><td> <input type="text" id="NAME" name="NAME" value="{$NAME}"></td></tr>
																
			
		                
		                				 
				<tr><td align="right">EMAIL :</td><td> <input type="text" id="EMAIL" name="EMAIL" value="{$EMAIL}"></td></tr>
																
			
		                
		                				 
								<tr><td align="right">MESSAGE  :</td><td> <textarea id="MESSAGE" name="MESSAGE">{$MESSAGE}</textarea></td></tr>
        										
			
		                
		                				{$FROM_IMP_CLASS}
		{if $gact == "editRec"}
		<tr><td></td><td>
			<input type="submit" value="salveaza" onClick='submitDetailsForm("saveRec")'></td></tr>
		{else}
			<tr><td><input type="submit" value="adauga" onClick='submitDetailsForm("addRec")'></td><td></td></tr>
		{/if}
		
	</table>
	</form><hr>