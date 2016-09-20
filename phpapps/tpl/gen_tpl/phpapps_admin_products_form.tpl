{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_admin_products_form").submit();
}
  </script>
{/literal}
{$error_msg}
<hr><form name="phpapps_admin_products_form" id="phpapps_admin_products_form" method="POST">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
				<tr><td align="right">ID :</td><td> <input type="text" id="ID" name="ID" value="{$ID}"></td></tr>
																
			
		
				 
				<tr><td align="right">CATEG_ID :</td><td> <input type="text" id="CATEG_ID" name="CATEG_ID" value="{$CATEG_ID}"></td></tr>
																
			
		
				 
				<tr><td align="right">PRODUCT_NAME :</td><td> <input type="text" id="PRODUCT_NAME" name="PRODUCT_NAME" value="{$PRODUCT_NAME}"></td></tr>
																
			
		
				 
				<tr><td align="right">DESCRIPTION :</td><td> <input type="text" id="DESCRIPTION" name="DESCRIPTION" value="{$DESCRIPTION}"></td></tr>
																
			
		
				 
				<tr><td align="right">MODIFY_UID :</td><td> <input type="text" id="MODIFY_UID" name="MODIFY_UID" value="{$MODIFY_UID}"></td></tr>
																
			
		
				 
				<tr><td align="right">CREATE_UID :</td><td> <input type="text" id="CREATE_UID" name="CREATE_UID" value="{$CREATE_UID}"></td></tr>
																
			
		
				 
				<tr><td align="right">MODIFY_DATE :</td><td> <input type="text" id="MODIFY_DATE" name="MODIFY_DATE" value="{$MODIFY_DATE}"></td></tr>
																
			
		
				 
				<tr><td align="right">CREATE_DATE :</td><td> <input type="text" id="CREATE_DATE" name="CREATE_DATE" value="{$CREATE_DATE}"></td></tr>
																
			
		
				{$FROM_IMP_CLASS}
		{if $gact == "editRec"}
		<tr><td></td><td>
			<input type="submit" value="salveaza" onClick='submitDetailsForm("saveRec")'></td></tr>
		{else}
			<tr><td><input type="submit" value="adauga" onClick='submitDetailsForm("addRec")'></td><td></td></tr>
		{/if}
		
	</table>
	</form><hr>