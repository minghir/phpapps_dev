{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#forum_topics_form").submit();
}
  </script>
{/literal}
{$error_msg}
<hr><form name="forum_topics_form" id="forum_topics_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
				<tr><td align="right">SUBJECT :</td><td> <input type="text" id="SUBJECT" name="SUBJECT" value="{$SUBJECT}"></td></tr>
																
			
		                
		                				 
								<tr><td align="right">DESCRIPTION  :</td><td> <textarea id="DESCRIPTION" name="DESCRIPTION">{$DESCRIPTION}</textarea></td></tr>
        										
			
		                
		                				 
																
			
		                
				<tr><td align="right">CAT_ID  :</td><td>
			{$CAT_ID_sel}
		</td></tr>
                        				 
										<input id="USER_ID" type="hidden" name="USER_ID" value="{$USER_ID}">
        								
			
		                
		                				{$FROM_IMP_CLASS}
		{if $gact == "editRec"}
		<tr><td></td><td>
			<input type="submit" value="salveaza" onClick='submitDetailsForm("saveRec")'></td></tr>
		{else}
			<tr><td><input type="submit" value="adauga" onClick='submitDetailsForm("addRec")'></td><td></td></tr>
		{/if}
		
	</table>
	</form><hr>