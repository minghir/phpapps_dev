{if $error_msg != ''}
<div class="alert alert-warning">
  {$error_msg}
</div>
{/if}
{if $succes_msg != ''}
<div class="alert alert-success">
  {$succes_msg}
</div>
{else}

<form name="admin_contact_form" id="admin_contact_form" method="POST" enctype="multipart/form-data">
     <div class="form-group">
				
                        <label for="NAME">Numele dvs.</label>
                        <input type="text" id="NAME" name="NAME" value="{$NAME}" class="form-control">
                        <label for="EMAIL">Adresa email </label>
                        <input type="text" id="EMAIL" name="EMAIL" value="{$EMAIL}" class="form-control">																
                        <label for="SUBJECT">Subiect</label>
                        <input type="text" id="SUBJECT" name="SUBJECT" value="{$SUBJECT}" class="form-control">
                        <label for="MESSAGE">Mesaj</label>
                        <textarea id="MESSAGE" name="MESSAGE" class="form-control">{$MESSAGE}</textarea>
                        <button type="submit" class="btn btn-default" name="pact" value="addRec">Trimie</button>
	</form>
</div>
{/if}