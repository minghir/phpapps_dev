<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_designer_themes_form").submit();
}
  </script>
 
{$error_msg}
<hr><form name="phpapps_designer_menu_items_form" id="phpapps_designer_menu_items_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
										<input id="ID" type="hidden" name="ID" value="{$ID}">
        								
			
		                
		                				 
																
			
		                
				<tr><td align="right">PID  :</td><td>
			{$PID_sel}
		</td></tr>
                        				 
																
			
		                
				<tr><td align="right">MENU_ID  :</td><td>
			{$MENU_ID_sel}
		</td></tr>
                        				 
																
			
		                
				<tr><td align="right">ACTION_ID  :</td><td>
			{$ACTION_ID_sel}
		</td></tr>
                        				 
				<tr><td align="right">LABEL :</td><td> <input type="text" id="LABEL" name="LABEL" value="{$LABEL}"></td></tr>
																
			
		                
		                				{$FROM_IMP_CLASS}
		{if $gact == "editRec"}
		<tr><td></td><td>
			<input type="submit" value="salveaza" onClick='submitDetailsForm("saveRec")'></td></tr>
		{else}
			<tr><td><input type="submit" value="adauga" onClick='submitDetailsForm("addRec")'></td><td></td></tr>
		{/if}
		
	</table>
	</form><hr>