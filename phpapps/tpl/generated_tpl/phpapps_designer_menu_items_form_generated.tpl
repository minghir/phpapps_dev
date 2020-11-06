<div class="container">
<hr><form name="phpapps_designer_menu_items_form" id="phpapps_designer_menu_items_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	                																                				<div class="form-group">
                    <label >
                        PARENT  :
                    </label>
			{$PID_sel}
                </div>
                                		                        								<input id="MENU_ID" type="hidden" name="MENU_ID" value="{$MENU_ID}">
                										                		                		                        		<div class="form-group">
                    <label >
                        ACTION :
                    </label>
                        <input class="form-control" type="text" id="ACTION" name="ACTION" value="{$ACTION}">
                </div>
																		                		                		                        		<div class="form-group">
                    <label >
                        LABEL :
                    </label>
                        <input class="form-control" type="text" id="LABEL" name="LABEL" value="{$LABEL}">
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
