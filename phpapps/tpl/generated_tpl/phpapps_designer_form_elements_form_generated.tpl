<div class="container">
<hr><form name="phpapps_designer_form_elements_form" id="phpapps_designer_form_elements_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	                								<input id="ID" type="hidden" name="ID" value="{$ID}">
                						                				                		                		                        												                				                				<div class="form-group">
                    <label >
                        FORM_ID  :
                    </label>
			{$FORM_ID_sel}
                </div>
                                		                        												                						<div class="form-group">
                    <label >
                        ELEMENT_TYPE  :
                    </label>
			{$ELEMENT_TYPE_sel}
                </div>
                                		                		                        		<div class="form-group">
                    <label >
                        ELEMENT_NAME :
                    </label>
                        <input class="form-control" type="text" id="ELEMENT_NAME" name="ELEMENT_NAME" value="{$ELEMENT_NAME}">
                </div>
														                				                		                		        	{$FROM_IMP_CLASS}
                <div class="form-group">
	{if $gact == "editRec"}
                       <button type="submit" class="btn btn-primary mb-2" name="pact" value="saveRec">save</button>
		{elseif $gact == "deleteRec"}
                        <button type="submit" class="btn btn-primary mb-2" name="pact" value="deleteRec">delete</button>
                {else}
                        <button type="submit" class="btn btn-primary mb-2" name="pact" value="addRec">add</button>
		{/if}
                        <button class="btn btn-primary mb-2 hBack" name="pact" value="back">back</button>
		
                </div>
	</form>
        <hr>
</div>
<div class="container">
        {$message_block}
</div>

    <script>
$(".hBack").on("click", function(e){
    if (window.opener && window.opener !== window) {
        window.close();
    }
    e.preventDefault();
    window.history.back();
});
</script>
