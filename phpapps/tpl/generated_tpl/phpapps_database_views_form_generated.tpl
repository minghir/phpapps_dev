<div class="container">
<hr><form name="phpapps_database_views_form" id="phpapps_database_views_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	                								<input id="MODULE_ID" type="hidden" name="MODULE_ID" value="{$MODULE_ID}">
                										                		                		                        		<div class="form-group">
                    <label >
                        VIEW_NAME :
                    </label>
                        <input class="form-control" type="text" id="VIEW_NAME" name="VIEW_NAME" value="{$VIEW_NAME}">
                </div>
																		                		                		                        						<div class="form-group">
                    <label >
                        CREATE_VIEW_QUERY  :
                    </label>
                        <textarea class="form-control" id="CREATE_VIEW_QUERY" name="CREATE_VIEW_QUERY">{$CREATE_VIEW_QUERY}</textarea>
                </div>
                												                		                		                        						<div class="form-group">
                    <label >
                        DESCRIPTION  :
                    </label>
                        <textarea class="form-control" id="DESCRIPTION" name="DESCRIPTION">{$DESCRIPTION}</textarea>
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
