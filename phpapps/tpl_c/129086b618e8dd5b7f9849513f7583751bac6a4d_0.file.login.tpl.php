<?php
/* Smarty version 3.1.30, created on 2016-09-20 14:39:16
  from "D:\linuxport\work\www\phpapps_dev\phpapps\tpl\login.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_57e14a146fd8b6_31420471',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '129086b618e8dd5b7f9849513f7583751bac6a4d' => 
    array (
      0 => 'D:\\linuxport\\work\\www\\phpapps_dev\\phpapps\\tpl\\login.tpl',
      1 => 1440148259,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:commun_header.tpl' => 1,
  ),
),false)) {
function content_57e14a146fd8b6_31420471 (Smarty_Internal_Template $_smarty_tpl) {
?>
<html>
<head>
<title>PHP Applications Login</title>
<?php $_smarty_tpl->_subTemplateRender("file:commun_header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

</head>

<body bgcolor="#dddddd">
<form name="login_form" method="POST">
    <p align="center"><span class="titlu_rosu">&nbsp;<?php echo $_smarty_tpl->tpl_vars['ERROR']->value;?>
</span></p>
<table align="center" bgcolor="#dddddd">
    <tr>
        <td colspan=2><font size=5><font color="black">PHPApps</font></font></td>
    </tr>
    <br><br><br><br><br>
    <tr></tr><tr></tr>
    <tr>
        <td class="text_alb"><font color="black">User:</font></td>
	<td> <input type="text" name="user" value="<?php echo $_smarty_tpl->tpl_vars['USER']->value;?>
" onclick="this.value='';this.form.pass.value=''"></td>
    </tr>
    <tr>
        <td class="text_alb"><font color="black">Parola:</font></td>
	<td> <input type="password" name="pass" value="<?php echo $_smarty_tpl->tpl_vars['pass']->value;?>
" onclick="this.value='';"></td>
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




<?php }
}
