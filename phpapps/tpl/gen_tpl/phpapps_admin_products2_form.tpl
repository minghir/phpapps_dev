{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_admin_products2_form").submit();
}
  </script>
{/literal}
{$error_msg}
<hr><form name="phpapps_admin_products2_form" id="phpapps_admin_products2_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
																
			
				<tr><td align="right">CATEG_ID  :</td><td>
			{$CATEG_ID_sel}
		</td></tr>
        
						 
				<tr><td align="right">PRODUCT_NAME :</td><td> <input type="text" id="PRODUCT_NAME" name="PRODUCT_NAME" value="{$PRODUCT_NAME}"></td></tr>
																
			
		
						 
				<tr><td align="right">DESCRIPTION :</td><td> <input type="text" id="DESCRIPTION" name="DESCRIPTION" value="{$DESCRIPTION}"></td></tr>
																
			
		
						{$FROM_IMP_CLASS}
		{if $gact == "editRec"}
		<tr><td></td><td>
			<input type="submit" value="salveaza" onClick='submitDetailsForm("saveRec")'></td></tr>
		{else}
			<tr><td><input type="submit" value="adauga" onClick='submitDetailsForm("addRec")'></td><td></td></tr>
		{/if}
		
	</table>
	</form><hr>