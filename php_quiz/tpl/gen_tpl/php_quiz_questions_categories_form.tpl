{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#php_quiz_questions_categories_form").submit();
}
  </script>
{/literal}
{$error_msg}
<hr><form name="php_quiz_questions_categories_form" id="php_quiz_questions_categories_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
																
			
				<tr><td align="right">CATEGORIE  :</td><td>
			{$CATEG_TYPE_sel}
		</td></tr>
                        
		                				 
				<tr><td align="right">DENUMIRE :</td><td> <input type="text" id="NAME" name="NAME" value="{$NAME}"></td></tr>
																
			
		                
		                				{$FROM_IMP_CLASS}
		{if $gact == "editRec"}
		<tr><td></td><td>
			<input type="submit" value="salveaza" onClick='submitDetailsForm("saveRec")'></td></tr>
		{else}
			<tr><td><input type="submit" value="adauga" onClick='submitDetailsForm("addRec")'></td><td></td></tr>
		{/if}
		
	</table>
	</form><hr>