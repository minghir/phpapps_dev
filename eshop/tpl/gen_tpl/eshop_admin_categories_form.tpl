<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_designer_themes_form").submit();
}
  </script>
 
{$message_block}
<hr><form name="eshop_admin_categories_form" id="eshop_admin_categories_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table class="table-borderless">
	
		 
										<input id="ID" type="hidden" name="ID" value="{$ID}">
        								
			
		                
		                				 
																
			
		                
				<tr><td align="right">Parinte  :</td><td>
			{$PID_sel}
		</td></tr>
                        				 
				<tr><td align="right">Nume :</td><td> <input type="text" id="NAME" name="NAME" value="{$NAME}"></td></tr>
																
			
		                
		                				 
				<tr><td align="right">Titlu :</td><td> <input type="text" id="TITLE" name="TITLE" value="{$TITLE}"></td></tr>
																
			
		                
		                				 
								<tr><td align="right">Descriere  :</td><td> <textarea id="DESCRIPTION" name="DESCRIPTION">{$DESCRIPTION}</textarea></td></tr>
        										
			
		                
		                				{$FROM_IMP_CLASS}
		{if $gact == "editRec"}
		<tr><td></td><td>
			<input type="submit" value="salveaza" onClick='submitDetailsForm("saveRec")'></td></tr>
		{else}
			<tr><td><input type="submit" value="adauga" onClick='submitDetailsForm("addRec")'></td><td></td></tr>
		{/if}
		
	</table>
	</form><hr>