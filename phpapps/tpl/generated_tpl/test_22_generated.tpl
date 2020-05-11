<div class="container">
<hr><form name="test_22" id="test_22" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	                		<div class="form-group">
                    <label >
                        ID :
                    </label>
                        <input class="form-control" type="text" id="ID" name="ID" value="{$ID}">
                </div>
																		                		                		                        		<div class="form-group">
                    <label >
                        APP_ID :
                    </label>
                        <input class="form-control" type="text" id="APP_ID" name="APP_ID" value="{$APP_ID}">
                </div>
																		                		                		                        		<div class="form-group">
                    <label >
                        SCRIPT_ID :
                    </label>
                        <input class="form-control" type="text" id="SCRIPT_ID" name="SCRIPT_ID" value="{$SCRIPT_ID}">
                </div>
																		                		                		                        		<div class="form-group">
                    <label >
                        MODULE_NAME :
                    </label>
                        <input class="form-control" type="text" id="MODULE_NAME" name="MODULE_NAME" value="{$MODULE_NAME}">
                </div>
																		                		                		                        		<div class="form-group">
                    <label >
                        MODULE_TITLE :
                    </label>
                        <input class="form-control" type="text" id="MODULE_TITLE" name="MODULE_TITLE" value="{$MODULE_TITLE}">
                </div>
																		                		                		                        		<div class="form-group">
                    <label >
                        MODULE_LABEL :
                    </label>
                        <input class="form-control" type="text" id="MODULE_LABEL" name="MODULE_LABEL" value="{$MODULE_LABEL}">
                </div>
																		                		                		                        		<div class="form-group">
                    <label >
                        MODULE_DATE :
                    </label>
                        <input class="form-control" type="text" id="MODULE_DATE" name="MODULE_DATE" value="{$MODULE_DATE}">
                </div>
																		                		                		                        		<div class="form-group">
                    <label >
                        DESCRIPTION :
                    </label>
                        <input class="form-control" type="text" id="DESCRIPTION" name="DESCRIPTION" value="{$DESCRIPTION}">
                </div>
																		                		                		                        		<div class="form-group">
                    <label >
                        MODIFY_UID :
                    </label>
                        <input class="form-control" type="text" id="MODIFY_UID" name="MODIFY_UID" value="{$MODIFY_UID}">
                </div>
																		                		                		                        		<div class="form-group">
                    <label >
                        CREATE_UID :
                    </label>
                        <input class="form-control" type="text" id="CREATE_UID" name="CREATE_UID" value="{$CREATE_UID}">
                </div>
																		                		                		                        		<div class="form-group">
                    <label >
                        MODIFY_DATE :
                    </label>
                        <input class="form-control" type="text" id="MODIFY_DATE" name="MODIFY_DATE" value="{$MODIFY_DATE}">
                </div>
																		                		                		                        		<div class="form-group">
                    <label >
                        CREATE_DATE :
                    </label>
                        <input class="form-control" type="text" id="CREATE_DATE" name="CREATE_DATE" value="{$CREATE_DATE}">
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
