{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#articles_articles_form").submit();
}
  </script>
{/literal}
{$error_msg}
<hr><form name="articles_articles_form" id="articles_articles_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
				<tr><td align="right">Title :</td><td> <input type="text" id="NAME" name="NAME" value="{$NAME}"></td></tr>
																
			
		                
		                				 
								<tr><td align="right">Tags  :</td><td> <textarea id="ARTICLE_TAGS" name="ARTICLE_TAGS">{$ARTICLE_TAGS}</textarea></td></tr>
        										
			
		                
		                				 
								<tr><td align="right">Content  :</td><td> <textarea id="BODY" name="BODY">{$BODY}</textarea></td></tr>
        										
			
		                
		                				 
																
			
				<tr><td align="right">Category  :</td><td>
			{$CATEG_ID_sel}
		</td></tr>
                        
		                				 
																
			
		                
		                				<tr><td align="right">Title Image :</td><td> <input type="file" id="IMAGE" name="IMAGE" value="{$IMAGE}"></td></tr>
				 
										<input id="USER_ID" type="hidden" name="USER_ID" value="{$USER_ID}">
        								
			
		                
		                				 
										<input id="ARTICLE_DATE" type="hidden" name="ARTICLE_DATE" value="{$ARTICLE_DATE}">
        								
			
		                
		                				 
								<tr><td align="right">Intro  :</td><td> <textarea id="INTRO" name="INTRO">{$INTRO}</textarea></td></tr>
        										
			
		                
		                				 
																
			
				<tr><td align="right">Public  :</td><td>
			{$VISIBLE_sel}
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