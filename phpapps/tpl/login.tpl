<html>
<head>
<title>PHP Applications Login</title>
{include file='commun_header.tpl'}
</head>

<body bgcolor="#dddddd">
<form name="login_form" method="POST">
    <p align="center"><font  style="color: red;" size=1>&nbsp;{$ERROR}</font></p>
<table align="center" bgcolor="#dddddd">
    <tr>
        <td colspan=2><font size=6 style="color: #145A78;">PHPApps: </font><br>
            <a href="signup.php"><font size=2 style="color: #145A78;">Sign up</font></a>
            <br><br>
        </td>
    </tr>
    <br><br><br><br><br>
    <tr></tr><tr></tr>
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




