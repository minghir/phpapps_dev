{extends file=$display_obj->layout}
{block name=body}
<form name="login_form" method="POST">
    <p align="center"><font  style="color: red;" size=1> {$ERROR}</font></p>
<table align="center" bgcolor="#dddddd">
    <tr>
        <td class="text_alb"><font color="#145A78">Email or User ID</font><br>
	<input type="text" name="user" value="{$USER}" onclick="this.value='';this.form.pass.value=''"></td>
    </tr>
    <tr>
        <td class="text_alb"><font color="#145A78">Password</font><br><input type="password" name="pass" value="{$pass}" onclick="this.value='';"></td>
    </tr>
    <tr>
        <td ><button type="submit" name="Login" value="Login">Login</button></td>
        <td class="text_alb">
    </tr>
</table>
</form>
{/block}