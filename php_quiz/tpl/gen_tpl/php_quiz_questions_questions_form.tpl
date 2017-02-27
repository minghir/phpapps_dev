{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#php_quiz_questions_questions_form").submit();
}
  </script>
{/literal}
{$error_msg}
<hr><form name="php_quiz_questions_questions_form" id="php_quiz_questions_questions_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
				<tr><td align="right">Nr.: :</td><td> <input type="text" id="NO" name="NO" value="{$NO}"></td></tr>
																
			
		                
		                				 
																
			
		                
				<tr><td align="right">Categorie:  :</td><td>
			{$CATEG_ID_sel}
		</td></tr>
                        				 
								<tr><td align="right">Intrebare:  :</td><td> <textarea id="QUESTION" name="QUESTION">{$QUESTION}</textarea></td></tr>
        										
			
		                
		                				 
								<tr><td align="right">Raspuns 1:  :</td><td> <textarea id="ANSWER_1" name="ANSWER_1">{$ANSWER_1}</textarea></td></tr>
        										
			
		                
		                				 
																
			
				<tr><td align="right">  :</td><td>
			{$CORRECT_1_sel}
		</td></tr>
                        
		                				 
								<tr><td align="right">Raspuns 2:  :</td><td> <textarea id="ANSWER_2" name="ANSWER_2">{$ANSWER_2}</textarea></td></tr>
        										
			
		                
		                				 
																
			
				<tr><td align="right">  :</td><td>
			{$CORRECT_2_sel}
		</td></tr>
                        
		                				 
								<tr><td align="right">Raspuns 3:  :</td><td> <textarea id="ANSWER_3" name="ANSWER_3">{$ANSWER_3}</textarea></td></tr>
        										
			
		                
		                				 
																
			
				<tr><td align="right">  :</td><td>
			{$CORRECT_3_sel}
		</td></tr>
                        
		                				 
								<tr><td align="right">Raspuns 4:  :</td><td> <textarea id="ANSWER_4" name="ANSWER_4">{$ANSWER_4}</textarea></td></tr>
        										
			
		                
		                				 
																
			
				<tr><td align="right">  :</td><td>
			{$CORRECT_4_sel}
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