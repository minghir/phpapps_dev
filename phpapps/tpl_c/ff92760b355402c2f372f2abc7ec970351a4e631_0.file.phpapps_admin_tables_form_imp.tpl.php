<?php
/* Smarty version 3.1.30, created on 2016-09-20 14:50:06
  from "D:\linuxport\work\www\phpapps_dev\phpapps\tpl\phpapps_admin_tables_form_imp.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_57e14c9eea80b5_27705292',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'ff92760b355402c2f372f2abc7ec970351a4e631' => 
    array (
      0 => 'D:\\linuxport\\work\\www\\phpapps_dev\\phpapps\\tpl\\phpapps_admin_tables_form_imp.tpl',
      1 => 1473144706,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:commun_header.tpl' => 1,
    'file:gen_tpl/phpapps_admin_tables_form.tpl' => 1,
  ),
),false)) {
function content_57e14c9eea80b5_27705292 (Smarty_Internal_Template $_smarty_tpl) {
?>
<html>
<head>
<?php $_smarty_tpl->_subTemplateRender("file:commun_header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

</head>

<body>
<?php $_smarty_tpl->_subTemplateRender("file:gen_tpl/phpapps_admin_tables_form.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<br>
<div id="tab2" class="test_div"  style="width: 90%;"><?php echo $_smarty_tpl->tpl_vars['table_details_grid']->value;?>
</div>
</body>
</html><?php }
}
