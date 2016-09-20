<html>
<head>
<title>PHP Applications Login</title>
{include file="commun_header.tpl" }
</head>

<body bgcolor="#dddddd">
<form name="login_form" method="POST">
    <p align="center"><span class="titlu_rosu">&nbsp;{$ERROR}</span></p>
<table align="center" bgcolor="#dddddd">
    <tr>
        <td colspan=2><font size=5><font color="black">PHPApps</font></font></td>
    </tr>
    <br><br><br><br><br>
    <tr></tr><tr></tr>
    <tr>
        <td class="text_alb"><font color="black">User:</font></td>
	<td> <input type="text" name="user" value="{$USER}" onclick="this.value='';this.form.pass.value=''"></td>
    </tr>
    <tr>
        <td class="text_alb"><font color="black">Parola:</font></td>
	<td> <input type="password" name="pass" value="{$pass}" onclick="this.value='';"></td>
    </tr>
    <tr>
    <td ><input type="submit" name="Login" value="Login"></td>
        <td class="text_alb">
        </td>
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
</body>
</html>




