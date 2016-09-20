<?php
/* Smarty version 3.1.30, created on 2016-09-20 14:50:06
  from "D:\linuxport\work\www\phpapps_dev\phpapps\tpl\gen_tpl\phpapps_admin_tables_form.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_57e14c9ef21eb4_99492277',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '3a47ce76674917520648d76c8e4f2499ba1631bd' => 
    array (
      0 => 'D:\\linuxport\\work\\www\\phpapps_dev\\phpapps\\tpl\\gen_tpl\\phpapps_admin_tables_form.tpl',
      1 => 1473230084,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_57e14c9ef21eb4_99492277 (Smarty_Internal_Template $_smarty_tpl) {
?>

<?php echo '<script'; ?>
>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_admin_tables_form").submit();
}
  <?php echo '</script'; ?>
>

<?php echo $_smarty_tpl->tpl_vars['error_msg']->value;?>

<hr><form name="phpapps_admin_tables_form" id="phpapps_admin_tables_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="<?php echo $_smarty_tpl->tpl_vars['pact']->value;?>
">
			<input type="hidden" name="gact" value="<?php echo $_smarty_tpl->tpl_vars['gact']->value;?>
">
			<input type="hidden" name="gfield" value="<?php echo $_smarty_tpl->tpl_vars['gfield']->value;?>
">
			<input type="hidden" name="gfield_value" value="<?php echo $_smarty_tpl->tpl_vars['gfield_value']->value;?>
">	
	<table border="1">
	
		 
										<input id="ID" type="hidden" name="ID" value="<?php echo $_smarty_tpl->tpl_vars['ID']->value;?>
">
        								
			
		
						 
										<input id="MODULE_ID" type="hidden" name="MODULE_ID" value="<?php echo $_smarty_tpl->tpl_vars['MODULE_ID']->value;?>
">
        								
			
		
						 
										<input id="SCHEMA_ID" type="hidden" name="SCHEMA_ID" value="<?php echo $_smarty_tpl->tpl_vars['SCHEMA_ID']->value;?>
">
        								
			
		
						 
				<tr><td align="right">TABLE_NAME :</td><td> <input type="text" id="TABLE_NAME" name="TABLE_NAME" value="<?php echo $_smarty_tpl->tpl_vars['TABLE_NAME']->value;?>
"></td></tr>
																
			
		
						 
																
			
				<tr><td align="right">TABLE_TYPE  :</td><td>
			<?php echo $_smarty_tpl->tpl_vars['TABLE_TYPE_sel']->value;?>

		</td></tr>
        
						 
								<tr><td align="right">DESCRIPTION  :</td><td> <textarea id="DESCRIPTION" name="DESCRIPTION"><?php echo $_smarty_tpl->tpl_vars['DESCRIPTION']->value;?>
</textarea></td></tr>
        										
			
		
						<?php echo $_smarty_tpl->tpl_vars['FROM_IMP_CLASS']->value;?>

		<?php if ($_smarty_tpl->tpl_vars['gact']->value == "editRec") {?>
		<tr><td></td><td>
			<input type="submit" value="salveaza" onClick='submitDetailsForm("saveRec")'></td></tr>
		<?php } else { ?>
			<tr><td><input type="submit" value="adauga" onClick='submitDetailsForm("addRec")'></td><td></td></tr>
		<?php }?>
		
	</table>
	</form><hr><?php }
}
