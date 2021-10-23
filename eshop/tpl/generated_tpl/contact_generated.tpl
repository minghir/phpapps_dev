<div class="container">
<hr><form name="contact" id="contact" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	                						<div class="form-group">
                    <label >
                        Mesajul dvs.  :
                    </label>
                        <textarea class="form-control" id="MESSAGE" name="MESSAGE">{$MESSAGE}</textarea>
                </div>
                								                				                		                		                        		<div class="form-group">
                    <label >
                        Numele dvs. :
                    </label>
                        <input class="form-control" type="text" id="CLIENT_NAME" name="CLIENT_NAME" value="{$CLIENT_NAME}">
                </div>
														                				                		                		                        		<div class="form-group">
                    <label >
                        Adresa dvs. de e-mail :
                    </label>
                        <input class="form-control" type="text" id="EMAIL" name="EMAIL" value="{$EMAIL}">
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
