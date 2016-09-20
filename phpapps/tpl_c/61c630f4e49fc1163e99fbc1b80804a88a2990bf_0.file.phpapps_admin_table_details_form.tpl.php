<?php
/* Smarty version 3.1.30, created on 2016-09-20 14:50:46
  from "D:\linuxport\work\www\phpapps_dev\phpapps\tpl\gen_tpl\phpapps_admin_table_details_form.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_57e14cc68ae5b9_37777712',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '61c630f4e49fc1163e99fbc1b80804a88a2990bf' => 
    array (
      0 => 'D:\\linuxport\\work\\www\\phpapps_dev\\phpapps\\tpl\\gen_tpl\\phpapps_admin_table_details_form.tpl',
      1 => 1474296109,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_57e14cc68ae5b9_37777712 (Smarty_Internal_Template $_smarty_tpl) {
?>

<?php echo '<script'; ?>
>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_admin_table_details_form").submit();
}
  <?php echo '</script'; ?>
>

<?php echo $_smarty_tpl->tpl_vars['error_msg']->value;?>

<hr><form name="phpapps_admin_table_details_form" id="phpapps_admin_table_details_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="<?php echo $_smarty_tpl->tpl_vars['pact']->value;?>
">
			<input type="hidden" name="gact" value="<?php echo $_smarty_tpl->tpl_vars['gact']->value;?>
">
			<input type="hidden" name="gfield" value="<?php echo $_smarty_tpl->tpl_vars['gfield']->value;?>
">
			<input type="hidden" name="gfield_value" value="<?php echo $_smarty_tpl->tpl_vars['gfield_value']->value;?>
">	
	<table border="1">
	
		 
										<input id="TABLE_ID" type="hidden" name="TABLE_ID" value="<?php echo $_smarty_tpl->tpl_vars['TABLE_ID']->value;?>
">
        								
			
		
						 
				<tr><td align="right">COLUMN_NAME :</td><td> <input type="text" id="COLUMN_NAME" name="COLUMN_NAME" value="<?php echo $_smarty_tpl->tpl_vars['COLUMN_NAME']->value;?>
"></td></tr>
																
			
		
						 
																
			
				<tr><td align="right">COLUMN_TYPE_ID  :</td><td>
			<?php echo $_smarty_tpl->tpl_vars['COLUMN_TYPE_ID_sel']->value;?>

		</td></tr>
        
						 
				<tr><td align="right">COLUMN_SIZE :</td><td> <input type="text" id="COLUMN_SIZE" name="COLUMN_SIZE" value="<?php echo $_smarty_tpl->tpl_vars['COLUMN_SIZE']->value;?>
"></td></tr>
																
			
		
						 
				<tr><td align="right">COLUMN_DEFAULT_VALUE :</td><td> <input type="text" id="COLUMN_DEFAULT_VALUE" name="COLUMN_DEFAULT_VALUE" value="<?php echo $_smarty_tpl->tpl_vars['COLUMN_DEFAULT_VALUE']->value;?>
"></td></tr>
																
			
		
						 
																
			
				<tr><td align="right">FOREIGN_KEY_SCHEMA_ID  :</td><td>
			<?php echo $_smarty_tpl->tpl_vars['FOREIGN_KEY_SCHEMA_ID_sel']->value;?>

		</td></tr>
        
						 
																
			
		
				<tr><td align="right">FOREIGN_KEY_TABLE_ID  :</td><td>
			<?php echo $_smarty_tpl->tpl_vars['FOREIGN_KEY_TABLE_ID_sel']->value;?>

		</td></tr>
        				 
																
			
				<tr><td align="right">COLUMN_INDEX_TYPE_ID  :</td><td>
			<?php echo $_smarty_tpl->tpl_vars['COLUMN_INDEX_TYPE_ID_sel']->value;?>

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
