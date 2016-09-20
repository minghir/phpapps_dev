<?php
/* Smarty version 3.1.30, created on 2016-09-20 14:50:02
  from "D:\linuxport\work\www\phpapps_dev\phpapps\tpl\phpapps_admin_add_table_form_imp.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_57e14c9ae0a3b3_45116390',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '5658b9e00aec2603b3c88cc64f4224eb8846fb43' => 
    array (
      0 => 'D:\\linuxport\\work\\www\\phpapps_dev\\phpapps\\tpl\\phpapps_admin_add_table_form_imp.tpl',
      1 => 1440148322,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:commun_header.tpl' => 1,
    'file:gen_tpl/phpapps_admin_add_table_form.tpl' => 1,
  ),
),false)) {
function content_57e14c9ae0a3b3_45116390 (Smarty_Internal_Template $_smarty_tpl) {
?>
<html>
<head>
<?php $_smarty_tpl->_subTemplateRender("file:commun_header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

</head>


<body>
<!-- <input type="text" name="TABLE_NAME" value="mumu" form="phpapps_admin_add_table_form"> -->
<?php $_smarty_tpl->_subTemplateRender("file:gen_tpl/phpapps_admin_add_table_form.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

</body>
</html><?php }
}
