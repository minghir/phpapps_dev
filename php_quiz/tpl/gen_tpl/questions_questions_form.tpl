{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#questions_questions_form").submit();
}
  </script>
{/literal}
{$error_msg}
<hr><form name="questions_questions_form" id="questions_questions_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
				<tr><td align="right">Nr. :</td><td> <input type="text" id="NO" name="NO" value="{$NO}"></td></tr>
																
			
		                
		                				 
								<tr><td align="right">Intrebare  :</td><td> <textarea id="QUESTION" name="QUESTION">{$QUESTION}</textarea></td></tr>
        										
			
		                
		                				 
				<tr><td align="right">Raspuns 1 :</td><td> <input type="text" id="ANSWER_1" name="ANSWER_1" value="{$ANSWER_1}"></td></tr>
																
			
		                
		                				 
				<tr><td align="right">Corect 1 :</td><td> <input type="text" id="CORRECT_1" name="CORRECT_1" value="{$CORRECT_1}"></td></tr>
																
			
		                
		                				 
				<tr><td align="right">Raspuns 2 :</td><td> <input type="text" id="ANSWER_2" name="ANSWER_2" value="{$ANSWER_2}"></td></tr>
																
			
		                
		                				 
				<tr><td align="right">Corect 2 :</td><td> <input type="text" id="CORRECT_2" name="CORRECT_2" value="{$CORRECT_2}"></td></tr>
																
			
		                
		                				 
				<tr><td align="right">Raspuns 3 :</td><td> <input type="text" id="ANSWER_3" name="ANSWER_3" value="{$ANSWER_3}"></td></tr>
																
			
		                
		                				 
				<tr><td align="right">Corect 3 :</td><td> <input type="text" id="CORRECT_3" name="CORRECT_3" value="{$CORRECT_3}"></td></tr>
																
			
		                
		                				{$FROM_IMP_CLASS}
		{if $gact == "editRec"}
		<tr><td></td><td>
			<input type="submit" value="salveaza" onClick='submitDetailsForm("saveRec")'></td></tr>
		{else}
			<tr><td><input type="submit" value="adauga" onClick='submitDetailsForm("addRec")'></td><td></td></tr>
		{/if}
		
	</table>
	</form><hr>