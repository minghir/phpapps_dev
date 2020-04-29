<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_designer_themes_form").submit();
}
  </script>
 
{$error_msg}
<hr><form name="phpapps_designer_display_object_elements_form" id="phpapps_designer_display_object_elements_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table class="table-borderless">
	
		 
										<input id="ID" type="hidden" name="ID" value="{$ID}">
        								
			
		                
		                				 
										<input id="DISPLAY_OBJECT_ID" type="hidden" name="DISPLAY_OBJECT_ID" value="{$DISPLAY_OBJECT_ID}">
        								
			
		                
		                				 
										<input id="DISPLAY_OBJECT_TYPE_ID" type="hidden" name="DISPLAY_OBJECT_TYPE_ID" value="{$DISPLAY_OBJECT_TYPE_ID}">
        								
			
		                
		                				 
																
			
		                
				<tr><td align="right">ELEMENT_ID  :</td><td>
			{$ELEMENT_ID_sel}
		</td></tr>
                        				 
																
			
				<tr><td align="right">ELEMENT_TYPE_ID  :</td><td>
			{$ELEMENT_TYPE_ID_sel}
		</td></tr>
                        
		                				 
								<tr><td align="right">DESCRIPTION  :</td><td> <textarea id="DESCRIPTION" name="DESCRIPTION">{$DESCRIPTION}</textarea></td></tr>
        										
			
		                
		                				 
				<tr><td align="right">TEMPLATE_VARIABLE_NAME :</td><td> <input type="text" id="TEMPLATE_VARIABLE_NAME" name="TEMPLATE_VARIABLE_NAME" value="{$TEMPLATE_VARIABLE_NAME}"></td></tr>
																
			
		                
		                				{$FROM_IMP_CLASS}
		{if $gact == "editRec"}
		<tr><td></td><td>
			<input type="submit" value="salveaza" onClick='submitDetailsForm("saveRec")'></td></tr>
		{else}
			<tr><td><input type="submit" value="adauga" onClick='submitDetailsForm("addRec")'></td><td></td></tr>
		{/if}
		
	</table>
	</form><hr>