{literal}
    <script>
//$('#login_form').submit(function(e) {
    //e.preventDefault();
    // Coding
   //$('#login_form').submit(this);
  // $('#submit').modal('hide'); //or  $('#IDModal').modal('hide');
   //$('#submit').modal('toggle'); //or  $('#IDModal').modal('hide');
   //this.submit();
  // return false;
//});
function myFunction() {
    $("login_form").on("submit", function (event) {
        event.preventDefault();
        $.ajax({
            url: "yoururl",
            type: "POST",
            data: yourData,
            success: function (result) {
                console.log(result)
            }
        });
    })
}
</script>
{/literal}
<form name="login_form" method="POST" id="login_form">
<div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Login</h4>
        </div>
        <div class="modal-body">
            {$ERROR}<br>
            User:
            <input type="text" name="user" value="{$USER}" onclick="this.value='';this.form.pass.value=''"><br>
            Parola:
            <input type="password" name="pass" value="{$pass}" onclick="this.value='';"><br>
            
          <p>Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-default" onClick="myFunction()" data-backdrop="static" name="Login" value="Login" id="submit1">Trimite</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Inchide</button>
        </div>
</form>
<!--

    <p align="center"><font  style="color: red;" size=1> </font></p>
<table align="center" bgcolor="#dddddd">
    <tr>
        <td class="text_alb"><font color="#145A78">Email or User ID</font><br>
	</td>
    </tr>
    <tr>
        <td class="text_alb"><font color="#145A78">Password</font><br></td>
    </tr>
    <tr>
        <td ></td>
        <td class="text_alb">
    </tr>
</table>
</form>
-->