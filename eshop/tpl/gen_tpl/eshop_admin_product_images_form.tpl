<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_designer_themes_form").submit();
}
  </script>
 
{$error_msg}
<hr><form name="eshop_admin_product_images_form" id="eshop_admin_product_images_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table class="table-borderless">
	
		 
										<input id="ID" type="hidden" name="ID" value="{$ID}">
        								
			
		                
		                				 
										<input id="PRODUCT_ID" type="hidden" name="PRODUCT_ID" value="{$PRODUCT_ID}">
        								
			
		                
		                				 
																
			
		                
                                                                                <tr><td align="right">Imagine :</td><td> <input type="file" id="IMG_FILE_NAME" name="IMG_FILE_NAME" value="{$IMG_FILE_NAME}"><br><br>
                                                                                        <a href="{$IMG_FILE_NAME}"><img src="{$IMG_FILE_NAME}"></a></td></tr>
				{$FROM_IMP_CLASS}
		{if $gact == "editRec"}
		<tr><td></td><td>
			<input type="submit" value="salveaza" onClick='submitDetailsForm("saveRec")'></td></tr>
		{else}
			<tr><td><input type="submit" value="adauga" onClick='submitDetailsForm("addRec")'></td><td></td></tr>
		{/if}
		
	</table>
	</form><hr>