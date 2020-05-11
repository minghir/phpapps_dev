<div class="container">
<hr><form name="phpapps_designer_display_object_elements_form" id="phpapps_designer_display_object_elements_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	                								<input id="ID" type="hidden" name="ID" value="{$ID}">
                										                		                		                        								<input id="DISPLAY_OBJECT_ID" type="hidden" name="DISPLAY_OBJECT_ID" value="{$DISPLAY_OBJECT_ID}">
                										                		                		                        								<input id="DISPLAY_OBJECT_TYPE_ID" type="hidden" name="DISPLAY_OBJECT_TYPE_ID" value="{$DISPLAY_OBJECT_TYPE_ID}">
                										                		                		                        																                				<div class="form-group">
                    <label >
                        ELEMENT_ID  :
                    </label>
			{$ELEMENT_ID_sel}
                </div>
                                		                        																		<div class="form-group">
                    <label >
                        ELEMENT_TYPE_ID  :
                    </label>
			{$ELEMENT_TYPE_ID_sel}
                </div>
                                		                		                        						<div class="form-group">
                    <label >
                        DESCRIPTION  :
                    </label>
                        <textarea class="form-control" id="DESCRIPTION" name="DESCRIPTION">{$DESCRIPTION}</textarea>
                </div>
                												                		                		                        		<div class="form-group">
                    <label >
                        TEMPLATE_VARIABLE_NAME :
                    </label>
                        <input class="form-control" type="text" id="TEMPLATE_VARIABLE_NAME" name="TEMPLATE_VARIABLE_NAME" value="{$TEMPLATE_VARIABLE_NAME}">
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
