<?php
/* Smarty version 3.1.30, created on 2016-09-20 14:40:41
  from "D:\linuxport\work\www\phpapps_dev\phpapps\tpl\gen_tpl\phpapps_admin_applications_form.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_57e14a6949cf33_83324205',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '6576ce92eb11c65871d3f3bf1d403bdea296276f' => 
    array (
      0 => 'D:\\linuxport\\work\\www\\phpapps_dev\\phpapps\\tpl\\gen_tpl\\phpapps_admin_applications_form.tpl',
      1 => 1471355160,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_57e14a6949cf33_83324205 (Smarty_Internal_Template $_smarty_tpl) {
?>

<?php echo '<script'; ?>
>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_admin_applications_form").submit();
}
  <?php echo '</script'; ?>
>

<?php echo $_smarty_tpl->tpl_vars['error_msg']->value;?>

<hr><form name="phpapps_admin_applications_form" id="phpapps_admin_applications_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="<?php echo $_smarty_tpl->tpl_vars['pact']->value;?>
">
			<input type="hidden" name="gact" value="<?php echo $_smarty_tpl->tpl_vars['gact']->value;?>
">
			<input type="hidden" name="gfield" value="<?php echo $_smarty_tpl->tpl_vars['gfield']->value;?>
">
			<input type="hidden" name="gfield_value" value="<?php echo $_smarty_tpl->tpl_vars['gfield_value']->value;?>
">	
	<table border="1">
	
		 
																
			
		
				<tr><td align="right">User  :</td><td>
			<?php echo $_smarty_tpl->tpl_vars['USER_ID_sel']->value;?>

		</td></tr>
        				 
				<tr><td align="right">Application name :</td><td> <input type="text" id="APP_NAME" name="APP_NAME" value="<?php echo $_smarty_tpl->tpl_vars['APP_NAME']->value;?>
"></td></tr>
																
			
		
						 
				<tr><td align="right">Application title :</td><td> <input type="text" id="APP_TITLE" name="APP_TITLE" value="<?php echo $_smarty_tpl->tpl_vars['APP_TITLE']->value;?>
"></td></tr>
																
			
		
						 
																
			
				<tr><td align="right">Application database  :</td><td>
			<?php echo $_smarty_tpl->tpl_vars['APP_SCHEMA_sel']->value;?>

		</td></tr>
        
						 
				<tr><td align="right">Application Directory :</td><td> <input type="text" id="BASE_DIR" name="BASE_DIR" value="<?php echo $_smarty_tpl->tpl_vars['BASE_DIR']->value;?>
"></td></tr>
																
			
		
						 
																<!-- <tr><td align="right">APP_DATE :</td><td> <input type="text" class="tcal" name="APP_DATE" value="<?php echo $_smarty_tpl->tpl_vars['APP_DATE']->value;?>
"></td></tr> -->
		<tr><td align="right">APP_DATE :</td><td> <input id="APP_DATE" type="date" name="APP_DATE" value="<?php echo $_smarty_tpl->tpl_vars['APP_DATE']->value;?>
"></td></tr>
        		
			
		
						 
								<tr><td align="right">Description  :</td><td> <textarea id="DESCRIPTION" name="DESCRIPTION"><?php echo $_smarty_tpl->tpl_vars['DESCRIPTION']->value;?>
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
