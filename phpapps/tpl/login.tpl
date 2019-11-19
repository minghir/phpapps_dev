{extends file=$display_obj->layout_file}
{block name=content}
    <style>
    td,th {

    background-color: #12363b;
    text-align: left;
/*	padding: 0.125em 0.5em 0.25em 0.5em; */
    line-height: 0.5;
    border: 0px solid gray;
    background-color: #12363b;
/*    margin: 12px 12px 12px 12px; */
    padding: 10px 5px 10px 5px;
}
   </style>
    <div class="test_div">    
    <p align="center"><font  style="color: red;">&nbsp;{$ERROR}</font></p><br><br>
    <table align="center" cellspacing="0" border="0">
    <form name="login_form" method="POST">
    <tr>
        <td colspan=2><font size=18 style="color: #ffffff;font-family: 'Helvetica'"><b>PHPApps</b></font></td>
    </tr>
    <tr>
        <td colspan=2><font style="color: #fffffff;">&nbsp;Email:</font><br><br>
	<input type="text" name="user" value="{$USER}" onclick="this.value='';this.form.pass.value=''"></td>
    </tr>
    <tr>
        <td class="text_alb"><font style="color: #ffffff;">&nbsp;Password:</font><br><br>
            <input type="password" name="pass" value="{$pass}" onclick="this.value='';"></td>
    </tr>
    <tr>
        <td ><button type="submit" name="Login" value="Login">Login</button><br><br><br>
            <a href="signup.php"><font style="color: #ffffff;">Sign up</font></a></td>
    </tr>
    </form>
</table>

</div>
{/block}
