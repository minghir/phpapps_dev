<div class="container">
<hr><form name="eshop_admin_orders_form" id="eshop_admin_orders_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	                								<input id="ID" type="hidden" name="ID" value="{$ID}">
                						                				                		                		                        												                				<!-- <div class="form-group"><label >CLIENT_ID :<td> <input type="text" class="tcal" name="CLIENT_ID" value="{$CLIENT_ID}"></div> -->
		<div class="form-group">
                    <label >
                        CLIENT_ID :
                    </label>
                        {$CLIENT_ID} <input id="CLIENT_ID" type="hidden" name="CLIENT_ID" value="{$CLIENT_ID}">
                </div>
                		                		                		                        														<!-- <div class="form-group"><label >ORDER_DATE :<td> <input type="text" class="tcal" name="ORDER_DATE" value="{$ORDER_DATE}"></div> -->
		<div class="form-group">
                    <label >
                        ORDER_DATE :
                    </label>
                        <input class="form-control" id="ORDER_DATE" type="date" name="ORDER_DATE" value="{$ORDER_DATE}">
                </div>
                                				                		                		                        												                						<div class="form-group">
                    <label >
                        STATUS_ID  :
                    </label>
			{$STATUS_ID_sel}
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
