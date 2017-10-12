{extends file=$display_obj->layout}
{block name=body}
<form name="login_form" method="POST">
    <p align="center"><font  style="color: red;" size=1>&nbsp;{$ERROR}</font></p>
<table align="center" bgcolor="#dddddd">
    <tr>
        <td colspan=2><h1><a href="sign_up.php">Sign up</a></h1>
            
        </td>
    </tr>
    <br><br><br><br><br>
    <tr></tr><tr></tr>
    <tr>
        <td class="text_alb"><font color="#145A78">Email</font><br>
	<input class="form-control" type="text" name="user" value="{$USER}" onclick="this.value='';this.form.pass.value=''"></td>
    </tr>
    <tr>
        <td class="text_alb"><font color="#145A78">Password</font><br><input class="form-control" type="password" name="pass" value="{$pass}" onclick="this.value='';"></td>
    </tr>
    <tr>
        <td ><button class="form-control" type="submit" name="Login" value="Login">Login</button></td>
        <td class="text_alb">
    </tr>
</table>
</form>

<table align =center valign=bottom>
<tr><td>
<!-- FOOTER -->
<p align =center bottom=0>
       
</p>
<!-- FOOTER -->
</tr></td>
</table>
{/block}