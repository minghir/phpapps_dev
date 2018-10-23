{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#admin_contact_form").submit();
}
  </script>
{/literal}
{$error_msg}

<form name="admin_contact_form" id="admin_contact_form" method="POST" enctype="multipart/form-data">
     <div class="form-group">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
                        <label for="NAME">Numele dvs.</label>
                        <input type="text" id="NAME" name="NAME" value="{$NAME}" class="form-control">
                        <label for="EMAIL">Adresa email </label>
                        <input type="text" id="EMAIL" name="EMAIL" value="{$EMAIL}" class="form-control">																
                        <label for="SUBJECT">Subiect</label>
                        <input type="text" id="SUBJECT" name="SUBJECT" value="{$SUBJECT}" class="form-control">
                        <label for="MESSAGE">Mesaj</label>
                        <textarea id="MESSAGE" name="MESSAGE" class="form-control">{$MESSAGE}</textarea>
                        <button type="submit" class="btn btn-default">Trimie</button>
			<!-- <input type="submit" value="adauga" onClick='submitDetailsForm("addRec")' class="form-control"> -->
		
	</form>
</div>                