{extends file=$display_obj->layout_file}
{block name=content}

{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#signup").submit();
}
  </script>
{/literal}    
<div class="container">
    {if $SUCCES }
        <hr>
     {else}
<hr><form name="signup" id="signup" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
                        <input id="ID" type="hidden" name="ID" value="{$ID}">
                    <div  class="form-group">										                		                		                        		<div class="form-group">
                        <label > E-mail: </label>
                        <input class="form-control" type="text" id="EMAIL" name="EMAIL" value="{$EMAIL}">
                    </div>    
                    <div  class="form-group">
                        <label > Parola: </label>
                        <input class="form-control" type="password" id="PASSWORD" name="PASSWORD" value="{$PASSWORD}">
                    </div>
                    <div  class="form-group">
                        <label >Reintroduceti parola: </label>
                        <input class="form-control" type="password" id="PASSWORD" name="PASSWORD2" value="{$PASSWORD2}">
                    </div>
                <div class="form-group">
	                <button type="submit" class="btn btn-primary mb-2" name="pact" value="addRec">adauga</button>
	        </div>
	</form>
</div>
                    {/if}
<div class="container">
        {$message_block}
</div>
  <hr>
    <script>
$(".hBack").on("click", function(e){
    if (window.opener && window.opener !== window) {
        window.close();
    }
    e.preventDefault();
    window.history.back();
});
</script>
{literal}
<div id="server-results"><!-- For server results --></div>    
<!--
<script>
$("#signup").submit(function(event){
	event.preventDefault(); //prevent default action 
	//var post_url = $(this).attr("action"); //get form action url
        var post_url="signup_imp.php"
	var request_method = $(this).attr("method"); //get form GET/POST method
	var form_data = $(this).serialize(); //Encode form elements for submission
	
	$.ajax({
		url : post_url,
		type: request_method,
		data : form_data
	}).done(function(response){ //
		$("#server-results").html(response);
	});
});
</script>
-->
{/literal} 

{/block}