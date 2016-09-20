<?php
/* Smarty version 3.1.30, created on 2016-09-20 10:59:25
  from "D:\linuxport\work\www\phpapps_dev\phpapps\libs\DB\tpl\db_grid3.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_57e1168d7343b5_18547561',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '387b362c5362a9a75ac6285b6db2baf94c578448' => 
    array (
      0 => 'D:\\linuxport\\work\\www\\phpapps_dev\\phpapps\\libs\\DB\\tpl\\db_grid3.tpl',
      1 => 1438671576,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_57e1168d7343b5_18547561 (Smarty_Internal_Template $_smarty_tpl) {
?>

<?php echo '<script'; ?>
 type="text/javascript">
<!--
function confirmation(url) {
	var answer = confirm("SIGUR STERGETI INREGISTRAREA????")
	if (answer){
		window.open(url,'popup','width=500,height=500,scrollbars=no,resizable=no,toolbar=no,directories=no,location=no,menubar=no,status=no,left=0,top=0'); return false;
	}
}
//-->
<?php echo '</script'; ?>
>

  <table valign="top" border=0 cellpadding=0 cellspacing=0 bgcolor="#C0C0C0"><tr><td bgcolor="#FFFFFF">
  <div>
		<div style="float:left;">
		<?php echo $_smarty_tpl->tpl_vars['grid_title']->value;?>

		</div>
		<div style="float:right;">			
		<?php echo $_smarty_tpl->tpl_vars['grid_href_actions']->value;?>

		</div>
  </div>
  </td></tr><tr><td>
    <table valign="top" align="center" border=0 cellpadding=1 cellspacing=1>
    <tr bgcolor=<?php if ($_smarty_tpl->tpl_vars['mode_search']->value == true) {?>"#BFD4FF"<?php } else { ?>"#e8e8e8"<?php }?>>
           <?php
$__section_flds_0_saved = isset($_smarty_tpl->tpl_vars['__smarty_section_flds']) ? $_smarty_tpl->tpl_vars['__smarty_section_flds'] : false;
$__section_flds_0_loop = (is_array(@$_loop=$_smarty_tpl->tpl_vars['fields']->value) ? count($_loop) : max(0, (int) $_loop));
$__section_flds_0_total = $__section_flds_0_loop;
$_smarty_tpl->tpl_vars['__smarty_section_flds'] = new Smarty_Variable(array());
if ($__section_flds_0_total != 0) {
for ($__section_flds_0_iteration = 1, $_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index'] = 0; $__section_flds_0_iteration <= $__section_flds_0_total; $__section_flds_0_iteration++, $_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index']++){
?>
              <td align="center">
			  <?php if ($_smarty_tpl->tpl_vars['sortable']->value == 1) {?>
					  <?php if ($_smarty_tpl->tpl_vars['current_order_field']->value == $_smarty_tpl->tpl_vars['fields']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index'] : null)]) {?>
						<?php if ($_smarty_tpl->tpl_vars['current_order_rule']->value == "ASC") {?>
							<a href="<?php echo $_smarty_tpl->tpl_vars['order_hrefs']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index'] : null)];?>
:current_order_field=<?php echo $_smarty_tpl->tpl_vars['fields']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index'] : null)];?>
:current_order_rule=DESC"><b><?php if ($_smarty_tpl->tpl_vars['labels']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index'] : null)] == '') {
echo $_smarty_tpl->tpl_vars['fields']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index'] : null)];
} else {
echo $_smarty_tpl->tpl_vars['labels']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index'] : null)];
}?></b>&nbsp;<img src="imgs/up.gif" border="0"></a>
						<?php } else { ?>
							<a href="<?php echo $_smarty_tpl->tpl_vars['order_hrefs']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index'] : null)];?>
:current_order_field=<?php echo $_smarty_tpl->tpl_vars['fields']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index'] : null)];?>
:current_order_rule=ASC"><b><?php if ($_smarty_tpl->tpl_vars['labels']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index'] : null)] == '') {
echo $_smarty_tpl->tpl_vars['fields']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index'] : null)];
} else {
echo $_smarty_tpl->tpl_vars['labels']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index'] : null)];
}?></b>&nbsp;<img src="imgs/dn.gif" border="0"></a>
						<?php }?>
					  <?php } else { ?>
							<a href="<?php echo $_smarty_tpl->tpl_vars['order_hrefs']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index'] : null)];?>
:current_order_field=<?php echo $_smarty_tpl->tpl_vars['fields']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index'] : null)];?>
:current_order_rule=ASC"><b><?php if ($_smarty_tpl->tpl_vars['labels']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index'] : null)] == '') {
echo $_smarty_tpl->tpl_vars['fields']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index'] : null)];
} else {
echo $_smarty_tpl->tpl_vars['labels']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index'] : null)];
}?></b></a>
					  <?php }?>
				<?php } else { ?>
							<b><?php if ($_smarty_tpl->tpl_vars['labels']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index'] : null)] == '') {
echo $_smarty_tpl->tpl_vars['fields']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index'] : null)];
} else {
echo $_smarty_tpl->tpl_vars['labels']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index'] : null)];
}?></b>
				<?php }?>
              </td>
           <?php
}
}
if ($__section_flds_0_saved) {
$_smarty_tpl->tpl_vars['__smarty_section_flds'] = $__section_flds_0_saved;
}
?>
           <?php if ($_smarty_tpl->tpl_vars['row_href_actions']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_vls']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_vls']->value['index'] : null)] == '') {?> 
           <td>&nbsp;</td>
           <?php }?>
       </tr>
	   <form name="filter" method="POST" action="">
	   <?php if ($_smarty_tpl->tpl_vars['filterable']->value == true) {?>
	   <tr bgcolor=<?php if ($_smarty_tpl->tpl_vars['mode_search']->value == true) {?>"#BFD4FF"<?php } else { ?>"#e8e8e8"<?php }?>>
           <?php
$__section_flds_1_saved = isset($_smarty_tpl->tpl_vars['__smarty_section_flds']) ? $_smarty_tpl->tpl_vars['__smarty_section_flds'] : false;
$__section_flds_1_loop = (is_array(@$_loop=$_smarty_tpl->tpl_vars['fields']->value) ? count($_loop) : max(0, (int) $_loop));
$__section_flds_1_total = $__section_flds_1_loop;
$_smarty_tpl->tpl_vars['__smarty_section_flds'] = new Smarty_Variable(array());
if ($__section_flds_1_total != 0) {
for ($__section_flds_1_iteration = 1, $_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index'] = 0; $__section_flds_1_iteration <= $__section_flds_1_total; $__section_flds_1_iteration++, $_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index']++){
?>
              <td align="center">
              <!-- <input type="text" name="<?php echo $_smarty_tpl->tpl_vars['fields']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index'] : null)];?>
" value="" size=5">-->
			  <input type="hidden" name="filter_rle[]" value = "like">
			  <input type="hidden" name="filter_fld[]" value = "<?php echo $_smarty_tpl->tpl_vars['fields']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index'] : null)];?>
">
			  <input type="text" name="filter_val[]" value="<?php echo $_smarty_tpl->tpl_vars['filter_val']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_flds']->value['index'] : null)];?>
"  style="width:100%">
			<!--  <select name="rule">
				<option>=</option>
				<option>%</option>
				<option><</option>
				<option>></option>
			  </select>-->
              </td>
           <?php
}
}
if ($__section_flds_1_saved) {
$_smarty_tpl->tpl_vars['__smarty_section_flds'] = $__section_flds_1_saved;
}
?>
           <td><input type="submit" name="pact" value="Go"><input type="submit" name="pact" value="X"></td>
        </form>   
       </tr>
	   <?php }?>


        <?php
$__section_vls_2_saved = isset($_smarty_tpl->tpl_vars['__smarty_section_vls']) ? $_smarty_tpl->tpl_vars['__smarty_section_vls'] : false;
$__section_vls_2_loop = (is_array(@$_loop=$_smarty_tpl->tpl_vars['vals']->value) ? count($_loop) : max(0, (int) $_loop));
$__section_vls_2_total = $__section_vls_2_loop;
$_smarty_tpl->tpl_vars['__smarty_section_vls'] = new Smarty_Variable(array());
if ($__section_vls_2_total != 0) {
for ($__section_vls_2_iteration = 1, $_smarty_tpl->tpl_vars['__smarty_section_vls']->value['index'] = 0; $__section_vls_2_iteration <= $__section_vls_2_total; $__section_vls_2_iteration++, $_smarty_tpl->tpl_vars['__smarty_section_vls']->value['index']++){
?>
           <?php if ((isset($_smarty_tpl->tpl_vars['__smarty_section_vls']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_vls']->value['index'] : null)%2 == 0) {?>
           <tr bgcolor="#E0E0E0">
           <?php } else { ?>
           <tr bgcolor="white">
           <?php }?>

           <?php
$__section_flds2_3_saved = isset($_smarty_tpl->tpl_vars['__smarty_section_flds2']) ? $_smarty_tpl->tpl_vars['__smarty_section_flds2'] : false;
$__section_flds2_3_loop = (is_array(@$_loop=$_smarty_tpl->tpl_vars['fields']->value) ? count($_loop) : max(0, (int) $_loop));
$__section_flds2_3_total = $__section_flds2_3_loop;
$_smarty_tpl->tpl_vars['__smarty_section_flds2'] = new Smarty_Variable(array());
if ($__section_flds2_3_total != 0) {
for ($__section_flds2_3_iteration = 1, $_smarty_tpl->tpl_vars['__smarty_section_flds2']->value['index'] = 0; $__section_flds2_3_iteration <= $__section_flds2_3_total; $__section_flds2_3_iteration++, $_smarty_tpl->tpl_vars['__smarty_section_flds2']->value['index']++){
?>
              <td align="center">
                <?php echo $_smarty_tpl->tpl_vars['vals']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_vls']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_vls']->value['index'] : null)][(isset($_smarty_tpl->tpl_vars['__smarty_section_flds2']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_flds2']->value['index'] : null)];?>

              </td>
            <?php
}
}
if ($__section_flds2_3_saved) {
$_smarty_tpl->tpl_vars['__smarty_section_flds2'] = $__section_flds2_3_saved;
}
?>
           
			  <td>
				<?php echo $_smarty_tpl->tpl_vars['row_href_actions']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_vls']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_vls']->value['index'] : null)];?>

             </td>
              
       </tr>
       <?php
}
}
if ($__section_vls_2_saved) {
$_smarty_tpl->tpl_vars['__smarty_section_vls'] = $__section_vls_2_saved;
}
?>
</table>
 </table>
<?php if ($_smarty_tpl->tpl_vars['paginable']->value == 1) {?>(<?php if ($_smarty_tpl->tpl_vars['mode_search']->value == true) {?><font color="blue"><b>Found:</b><?php }
echo $_smarty_tpl->tpl_vars['num_rows']->value;?>
 recs/<?php echo $_smarty_tpl->tpl_vars['pages']->value;?>
 pgs</font>)<?php }?>&nbsp;
<?php if ($_smarty_tpl->tpl_vars['pages']->value > 1) {
$__section_pgs_4_saved = isset($_smarty_tpl->tpl_vars['__smarty_section_pgs']) ? $_smarty_tpl->tpl_vars['__smarty_section_pgs'] : false;
$__section_pgs_4_loop = (is_array(@$_loop=$_smarty_tpl->tpl_vars['pgs_hrefs']->value) ? count($_loop) : max(0, (int) $_loop));
$__section_pgs_4_total = $__section_pgs_4_loop;
$_smarty_tpl->tpl_vars['__smarty_section_pgs'] = new Smarty_Variable(array());
if ($__section_pgs_4_total != 0) {
for ($__section_pgs_4_iteration = 1, $_smarty_tpl->tpl_vars['__smarty_section_pgs']->value['index'] = 0; $__section_pgs_4_iteration <= $__section_pgs_4_total; $__section_pgs_4_iteration++, $_smarty_tpl->tpl_vars['__smarty_section_pgs']->value['index']++){
?> <?php echo $_smarty_tpl->tpl_vars['pgs_hrefs']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_pgs']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_pgs']->value['index'] : null)];?>
 <?php
}
}
if ($__section_pgs_4_saved) {
$_smarty_tpl->tpl_vars['__smarty_section_pgs'] = $__section_pgs_4_saved;
}
}?>
</div>
     </td></tr>
	</table><?php }
}
