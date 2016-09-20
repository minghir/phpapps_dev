<?php
/* Smarty version 3.1.30, created on 2016-09-20 14:40:41
  from "D:\linuxport\work\www\phpapps_dev\phpapps\libs\DB\tpl\db_select.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_57e14a693a9339_08351707',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '58f8618c9cb2d1cd55e5a85caa3f91caf3b08973' => 
    array (
      0 => 'D:\\linuxport\\work\\www\\phpapps_dev\\phpapps\\libs\\DB\\tpl\\db_select.tpl',
      1 => 1474286246,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_57e14a693a9339_08351707 (Smarty_Internal_Template $_smarty_tpl) {
if ($_smarty_tpl->tpl_vars['db_select_multiple']->value === true) {?>
<select id="<?php echo $_smarty_tpl->tpl_vars['html_id']->value;?>
" name="<?php echo $_smarty_tpl->tpl_vars['db_select_name']->value;?>
[]" multiple <?php echo $_smarty_tpl->tpl_vars['disabled']->value;?>
>
<?php } else { ?>
<select <?php if ($_smarty_tpl->tpl_vars['html_id']->value != '') {?>id="<?php echo $_smarty_tpl->tpl_vars['html_id']->value;?>
"<?php }?> name="<?php echo $_smarty_tpl->tpl_vars['db_select_name']->value;?>
" <?php echo $_smarty_tpl->tpl_vars['disabled']->value;?>
>
<?php }
if ($_smarty_tpl->tpl_vars['empty_option']->value === true) {?>
<option value=""> -- </option>
<?php }
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['db_select_options']->value, 'db_select_option');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['db_select_option']->value) {
?>
    <option value="<?php echo $_smarty_tpl->tpl_vars['db_select_option']->value['value'];?>
" <?php echo $_smarty_tpl->tpl_vars['db_select_option']->value['selected'];?>
> <?php echo $_smarty_tpl->tpl_vars['db_select_option']->value['label'];?>
</option>
<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>
 
</select>
<?php }
}
