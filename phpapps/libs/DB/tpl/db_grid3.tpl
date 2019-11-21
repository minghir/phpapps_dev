{literal}
<script type="text/javascript">
<!--
function confirmation(url) {
	var answer = confirm("SIGUR STERGETI INREGISTRAREA????")
	if (answer){
		window.open(url,'popup','width=500,height=500,scrollbars=no,resizable=no,toolbar=no,directories=no,location=no,menubar=no,status=no,left=0,top=0'); return false;
	}
}
//-->
</script>
{/literal}
  <table valign="top" border=0 cellpadding=0 cellspacing=0 bgcolor="#C0C0C0">
     <tr><td bgcolor="#FFFFFF">
  <div>
		<div style="float:left;">
		{$grid_title}
		</div>
		<div style="float:right;">			
		{$grid_href_actions}
		</div>
  </div>
  </td></tr><tr><td>
    <table valign="top" align="center" class="width: 100%; height: auto;">
    <tr bgcolor={if $mode_search == true }"#BFD4FF"{else}"#e8e8e8"{/if}>
           {section name=flds loop=$fields}
              <td>
			  {if $sortable == 1}
					  {if $current_order_field == $fields[flds] }
						{if $current_order_rule == "ASC" }
							<a href="{$order_hrefs[flds]}:current_order_field={$fields[flds]}:current_order_rule=DESC"><b>{if $labels[flds] == ""}{$fields[flds]}{else}{$labels[flds]}{/if}</b>&nbsp;<img src="imgs/up.gif" border="0"></a>
						{else}
							<a href="{$order_hrefs[flds]}:current_order_field={$fields[flds]}:current_order_rule=ASC"><b>{if $labels[flds] == ""}{$fields[flds]}{else}{$labels[flds]}{/if}</b>&nbsp;<img src="imgs/dn.gif" border="0"></a>
						{/if}
					  {else}
							<a href="{$order_hrefs[flds]}:current_order_field={$fields[flds]}:current_order_rule=ASC"><b>{if $labels[flds] == ""}{$fields[flds]}{else}{$labels[flds]}{/if}</b></a>
					  {/if}
				{else}
							<b>{if $labels[flds] == ""}{$fields[flds]}{else}{$labels[flds]}{/if}</b>
				{/if}
              </td>
           {/section}
           {if $row_href_actions[1] != ""  } 
               <td><a><b>ACTIONS</b></a></td>
           {/if}
       </tr>
	   <form name="filter" method="POST" action="">
	   {if $filterable == true }
	   <tr bgcolor={if $mode_search == true }"#BFD4FF"{else}"#e8e8e8"{/if}>
           {section name=flds loop=$fields}
              <td align="center">
              <!-- <input type="text" name="{$fields[flds]}" value="" size=5">-->
			  <input type="hidden" name="filter_rle[]" value = "like">
			  <input type="hidden" name="filter_fld[]" value = "{$fields[flds]}">
			  <input type="text" name="filter_val[]" value="{$filter_val[flds]}"  style="width:100%">
			<!--  <select name="rule">
				<option>=</option>
				<option>%</option>
				<option><</option>
				<option>></option>
			  </select>-->
              </td>
           {/section}
           <td><input type="submit" name="pact" value="Go"><input type="submit" name="pact" value="X"></td>
        </form>   
       </tr>
	   {/if}


        {section name=vls loop=$values}
           {if $smarty.section.vls.index % 2 == 0 }
           <tr bgcolor="#E0E0E0">
           {else}
           <tr bgcolor="white">
           {/if}

           {section name=flds2 loop=$fields}
              <td>
                {$values[vls][flds2]}
              </td>
            {/section}
         
            {if $row_href_actions[vls]  != "" } 
			  <td>
				{$row_href_actions[vls]}
             </td>
             {/if}
         
       </tr>
       {/section}
</table>
 </table>
{if $paginable == 1 }({if $mode_search == true }<font color="blue"><b>Found:</b>{/if}{$num_rows} recs/{$pages} pgs</font>){/if}&nbsp;
{if $pages > 1 }{section name=pgs loop=$pgs_hrefs} {$pgs_hrefs[pgs]} {/section}{/if}
</div>
     </td></tr>
	</table>