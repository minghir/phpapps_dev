<div class="container">
<hr><form name="phpapps_admin_applications_form_imp" id="phpapps_admin_applications_form_imp" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	                								<input id="ID" type="hidden" name="ID" value="{$ID}">
                										                		                		                        								<input id="USER_ID" type="hidden" name="USER_ID" value="{$USER_ID}">
                										                		                		                        		<div class="form-group">
                    <label >
                        APP_NAME :
                    </label>
                        <input class="form-control" type="text" id="APP_NAME" name="APP_NAME" value="{$APP_NAME}">
                </div>
																		                		                		                        		<div class="form-group">
                    <label >
                        APP_TITLE :
                    </label>
                        <input class="form-control" type="text" id="APP_TITLE" name="APP_TITLE" value="{$APP_TITLE}">
                </div>
																		                		                		                        																		<div class="form-group">
                    <label >
                        APP_SCHEMA  :
                    </label>
			{$APP_SCHEMA_sel}
                </div>
                                		                		                        																		<div class="form-group">
                    <label >
                        APPLICATION_TYPE_ID  :
                    </label>
			{$APPLICATION_TYPE_ID_sel}
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
