<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_designer_themes_form").submit();
}
  </script>
 
{$error_msg}
<hr><form name="eshop_admin_products_form" id="eshop_admin_products_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table class="table-borderless">
	
		 
										<input id="ID" type="hidden" name="ID" value="{$ID}">
        								
			
		                
		                				 
																
			
		                
				<tr><td align="right">Categorie  :</td><td>
			{$CATEGORY_ID_sel}
		</td></tr>
                        				 
				<tr><td align="right">Denumire :</td><td> <input type="text" id="PRODUCT_TITLE" name="PRODUCT_TITLE" value="{$PRODUCT_TITLE}"></td></tr>
																
			
		                
		                				 
								<tr><td align="right">Descriere  :</td><td> <textarea id="DESCRIPTION" name="DESCRIPTION">{$DESCRIPTION}</textarea></td></tr>
        										
			
		                
		                				 
				<tr><td align="right">Pret :</td><td> <input type="text" id="PRICE" name="PRICE" value="{$PRICE}"></td></tr>
																
			
		                
		                				 
																
			
				<tr><td align="right">Moneda  :</td><td>
			{$CURRENCY_ID_sel}
		</td></tr>
                        
		                				 
				<tr><td align="right">Stoc :</td><td> <input type="text" id="STOCK" name="STOCK" value="{$STOCK}"></td></tr>
																
			
		                
		                				{$FROM_IMP_CLASS}
		{if $gact == "editRec"}
		<tr><td></td><td>
			<input type="submit" value="salveaza" onClick='submitDetailsForm("saveRec")'></td></tr>
		{else}
			<tr><td><input type="submit" value="adauga" onClick='submitDetailsForm("addRec")'></td><td></td></tr>
		{/if}
		
	</table>
	</form><hr>