<div class="container">
<hr><form name="eshop_admin_messages_form" id="eshop_admin_messages_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	                								<input id="ID" type="hidden" name="ID" value="{$ID}">
                						                				                		                		                        												                				<!-- <div class="form-group"><label >CLIENT_NAME :<td> <input type="text" class="tcal" name="CLIENT_NAME" value="{$CLIENT_NAME}"></div> -->
		<div class="form-group">
                    <label >
                        CLIENT_NAME :
                    </label>
                        {$CLIENT_NAME} <input id="CLIENT_NAME" type="hidden" name="CLIENT_NAME" value="{$CLIENT_NAME}">
                </div>
                		                		                		                        												                				<!-- <div class="form-group"><label >EMAIL :<td> <input type="text" class="tcal" name="EMAIL" value="{$EMAIL}"></div> -->
		<div class="form-group">
                    <label >
                        EMAIL :
                    </label>
                        {$EMAIL} <input id="EMAIL" type="hidden" name="EMAIL" value="{$EMAIL}">
                </div>
                		                		                		                        												                				<!-- <div class="form-group"><label >MESSAGE :<td> <input type="text" class="tcal" name="MESSAGE" value="{$MESSAGE}"></div> -->
		<div class="form-group">
                    <label >
                        MESSAGE :
                    </label>
                        {$MESSAGE} <input id="MESSAGE" type="hidden" name="MESSAGE" value="{$MESSAGE}">
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
