<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_designer_themes_form").submit();
}
  </script>
 
{$error_msg}
<hr><form name="phpapps_designer_menus_form" id="phpapps_designer_menus_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table class="table-borderless">
	
		 
										<input id="ID" type="hidden" name="ID" value="{$ID}">
        								
			
		                
		                				 
				<tr><td align="right">NAME :</td><td> <input type="text" id="NAME" name="NAME" value="{$NAME}"></td></tr>
																
			
		                
		                				 
				<tr><td align="right">MENU_TITLE :</td><td> <input type="text" id="MENU_TITLE" name="MENU_TITLE" value="{$MENU_TITLE}"></td></tr>
																
			
		                
		                				 
																
			
				<tr><td align="right">MENU_TYPE  :</td><td>
			{$MENU_TYPE_sel}
		</td></tr>
                        
		                				 
																
			
				<tr><td align="right">ORIENTATION  :</td><td>
			{$ORIENTATION_sel}
		</td></tr>
                        
		                				 
																
			
		                
				<tr><td align="right">QUERY_ID  :</td><td>
			{$QUERY_ID_sel}
		</td></tr>
                        				 
								<tr><td align="right">DESCRIPTION  :</td><td> <textarea id="DESCRIPTION" name="DESCRIPTION">{$DESCRIPTION}</textarea></td></tr>
        										
			
		                
		                				 
																
			
		                
				<tr><td align="right">TEMPLATE_ID  :</td><td>
			{$TEMPLATE_ID_sel}
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