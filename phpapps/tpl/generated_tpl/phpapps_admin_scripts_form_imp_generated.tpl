<div class="container">
<hr><form name="phpapps_admin_scripts_form_imp" id="phpapps_admin_scripts_form_imp" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	                								<input id="ID" type="hidden" name="ID" value="{$ID}">
                										                		                		                        								<input id="MODULE_ID" type="hidden" name="MODULE_ID" value="{$MODULE_ID}">
                										                		                		                        		<div class="form-group">
                    <label >
                        SCRIPT_NAME :
                    </label>
                        <input class="form-control" type="text" id="SCRIPT_NAME" name="SCRIPT_NAME" value="{$SCRIPT_NAME}">
                </div>
																		                		                		                        						<div class="form-group">
                    <label >
                        DESCRIPTION  :
                    </label>
                        <textarea class="form-control" id="DESCRIPTION" name="DESCRIPTION">{$DESCRIPTION}</textarea>
                </div>
                												                		                		                        																		<div class="form-group">
                    <label >
                        WEB_TYPE_ID  :
                    </label>
			{$WEB_TYPE_ID_sel}
                </div>
                                		                		                        																		<div class="form-group">
                    <label >
                        SCRIPT_TYPE_ID  :
                    </label>
			{$SCRIPT_TYPE_ID_sel}
                </div>
                                		                		                        																                				<div class="form-group">
                    <label >
                        LAYOUT_ID  :
                    </label>
			{$LAYOUT_ID_sel}
                </div>
                                		                        																                				<div class="form-group">
                    <label >
                        TEMPLATE_ID  :
                    </label>
			{$TEMPLATE_ID_sel}
                </div>
                                		                        		<div class="form-group">
                    <label >
                        SCRIPT_TITLE :
                    </label>
                        <input class="form-control" type="text" id="SCRIPT_TITLE" name="SCRIPT_TITLE" value="{$SCRIPT_TITLE}">
                </div>
																		                		                		                        		<div class="form-group">
                    <label >
                        SCRIPT_LABEL :
                    </label>
                        <input class="form-control" type="text" id="SCRIPT_LABEL" name="SCRIPT_LABEL" value="{$SCRIPT_LABEL}">
                </div>
																		                		                		                        		<div class="form-group">
                    <label >
                        VERSION :
                    </label>
                        <input class="form-control" type="text" id="VERSION" name="VERSION" value="{$VERSION}">
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
