<?php
/* Smarty version 3.1.30, created on 2016-09-20 14:39:15
  from "D:\linuxport\work\www\phpapps_dev\phpapps\tpl\phpapps_admin_applications.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_57e14a13eae4b9_16581354',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'fc641894d436a265c93349d586d3eeddc1f92122' => 
    array (
      0 => 'D:\\linuxport\\work\\www\\phpapps_dev\\phpapps\\tpl\\phpapps_admin_applications.tpl',
      1 => 1440148332,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:commun_header.tpl' => 1,
  ),
),false)) {
function content_57e14a13eae4b9_16581354 (Smarty_Internal_Template $_smarty_tpl) {
?>
<html>
<head>
<?php $_smarty_tpl->_subTemplateRender("file:commun_header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

</head>
<body bgcolor="#dddddd"><br>


<div class="test_div">
<a href="phpapps_admin_applications_form_imp.php?gact=addRec"  style="text-decoration:none">
  Add new empty application
</a> | 
<a href="phpapps_admin_applications_form_imp.php?gact=addRec"  style="text-decoration:none">
  Create new application from template
</a>
  </div>

<br>
<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['rows']->value, 'app');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['app']->value) {
?>
	<div class="test_div"><p><?php echo $_smarty_tpl->tpl_vars['app']->value['APP_TITLE'];?>
 ( <a href="phpapps_admin_applications_form_imp.php?gact=editRec&gfield=ID&gfield_value=<?php echo $_smarty_tpl->tpl_vars['app']->value['ID'];?>
"><?php echo $_smarty_tpl->tpl_vars['app']->value['APP_NAME'];?>
</a> ) <br>
	<font style="font-size: 60%;"><?php echo $_smarty_tpl->tpl_vars['app']->value['USERNAME'];?>
 / <?php echo $_smarty_tpl->tpl_vars['app']->value['APP_DATE'];?>
 </font></p>
		<?php echo $_smarty_tpl->tpl_vars['app']->value['DESCRIPTION'];?>
<br>
		<a href="phpapps_admin_modules_form_imp.php?gfield_value=<?php echo $_smarty_tpl->tpl_vars['app']->value['ID'];?>
&gfield=app_id">add new module</a> |
		<a href="phpapps_admin_applications_form_imp.php?gact=deleteRec&gfield=ID&gfield_value=<?php echo $_smarty_tpl->tpl_vars['app']->value['ID'];?>
">delete app</a>
		<br><b>Modules:</b><br>
		<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['modules']->value[$_smarty_tpl->tpl_vars['app']->value['ID']], 'mod');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['mod']->value) {
?>
				<?php if ($_smarty_tpl->tpl_vars['mod']->value['SCRIPT_NAME'] != "phpapps_admin_module") {?>
					<a href="<?php echo $_smarty_tpl->tpl_vars['mod']->value['SCRIPT_NAME'];?>
.php?module_id=<?php echo $_smarty_tpl->tpl_vars['mod']->value['ID'];?>
" title="<?php echo $_smarty_tpl->tpl_vars['mod']->value['DESCRIPTION'];?>
"><?php echo $_smarty_tpl->tpl_vars['mod']->value['MODULE_TITLE'];?>
</a> ( <a href="phpapps_admin_module.php?module_id=<?php echo $_smarty_tpl->tpl_vars['mod']->value['ID'];?>
" title="<?php echo $_smarty_tpl->tpl_vars['mod']->value['DESCRIPTION'];?>
">admin</a> | <a href="phpapps_admin_modules_form_imp.php?gfield_value=<?php echo $_smarty_tpl->tpl_vars['mod']->value['ID'];?>
&gfield=ID&gact=deleteRec">delete</a> ) <br>
				<?php } else { ?>
					<?php echo $_smarty_tpl->tpl_vars['mod']->value['MODULE_TITLE'];?>
 ( <a href="phpapps_admin_module.php?module_id=<?php echo $_smarty_tpl->tpl_vars['mod']->value['ID'];?>
" title="<?php echo $_smarty_tpl->tpl_vars['mod']->value['DESCRIPTION'];?>
">admin</a> | <a href="phpapps_admin_modules_form_imp.php?gfield_value=<?php echo $_smarty_tpl->tpl_vars['mod']->value['ID'];?>
&gfield=ID&gact=deleteRec">delete</a> ) <br>
				<?php }?>
		<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

	</div><br>
<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

</body>
</html><?php }
}
