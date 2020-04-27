{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_designer_themes_form").submit();
}
  </script>
{/literal} 
{literal}{$error_msg}{/literal}
<hr><form name="{$form_name}" id="{$form_name}" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{ldelim}$pact{rdelim}">
			<input type="hidden" name="gact" value="{ldelim}$gact{rdelim}">
			<input type="hidden" name="gfield" value="{ldelim}$gfield{rdelim}">
			<input type="hidden" name="gfield_value" value="{ldelim}$gfield_value{rdelim}">	
	<table class="table-borderless">
	
	{section name=fl loop=$fields}
	 
		{if $input_types[fl] == "text" }
		<tr><td align="right">{$labels[fl]} :</td><td> <input type="text" id="{$fields[fl]}" name="{$fields[fl]}" value="{literal}{${/literal}{$fields[fl]}}"></td></tr>
		{/if}
		{if $input_types[fl] ==  "checkbox" }
		<tr><td align="right">{$labels[fl]} :</td><td> <input type="checkbox" id="{$fields[fl]}" name="{$fields[fl]}" value="{literal}{${/literal}{$fields[fl]}}"></td></tr>
        {/if}
		{if $input_types[fl] ==   "textarea" }
		<tr><td align="right">{$labels[fl]}  :</td><td> <textarea id="{$fields[fl]}" name="{$fields[fl]}">{literal}{${/literal}{$fields[fl]}}</textarea></td></tr>
        {/if}
		{if $input_types[fl] == "hidden" }
		<input id="{$fields[fl]}" type="hidden" name="{$fields[fl]}" value="{literal}{${/literal}{$fields[fl]}}">
        {/if}
		{if $input_types[fl] == "select" }
		<tr><td align="right">{$labels[fl]}  :</td><td>
			<select id="{$fields[fl]}" name="{$fields[fl]}">
				<option value="{literal}{${/literal}{$fields[fl]}}">{literal}{${/literal}{$fields[fl]}}</option>
			</select>
		</td></tr>
        {/if}
		{if $input_types[fl] == "mselect" }
		<tr><td align="right">{$labels[fl]}  :</td><td>
			<select id="{$fields[fl]}" multiple="multiple" name="{$fields[fl]}[]">
				<option value="{literal}{${/literal}{$fields[fl]}}">{literal}{${/literal}{$fields[fl]}}</option>
			</select>
		</td></tr>
        {/if}
		{if $input_types[fl] ==  "date" }
		<!-- <tr><td align="right">{$labels[fl]} :</td><td> <input type="text" class="tcal" name="{$fields[fl]}" value="{literal}{${/literal}{$fields[fl]}}"></td></tr> -->
		<tr><td align="right">{$labels[fl]} :</td><td> <input id="{$fields[fl]}" type="date" name="{$fields[fl]}" value="{literal}{${/literal}{$fields[fl]}}"></td></tr>
        {/if}
		
		{if $input_types[fl] ==  "label_field" }
		<!-- <tr><td align="right">{$labels[fl]} :</td><td> <input type="text" class="tcal" name="{$fields[fl]}" value="{literal}{${/literal}{$fields[fl]}}"></td></tr> -->
		<tr><td align="right">{$labels[fl]} :</td><td> {literal}{${/literal}{$fields[fl]}} <input id="{$fields[fl]}" type="hidden" name="{$fields[fl]}" value="{literal}{${/literal}{$fields[fl]}}"></td></tr>
        {/if}
	
		{if $input_types[fl] == "select_list" }
		<tr><td align="right">{$labels[fl]}  :</td><td>
			{ldelim}${$fields[fl]}_sel{rdelim}
		</td></tr>
        {/if}
                {if $input_types[fl] == "select_list_multiple" }
		<tr><td align="right">{$labels[fl]}  :</td><td>
			{ldelim}${$fields[fl]}_sel{rdelim}
		</td></tr>
        {/if}

		{if $input_types[fl] == "select_table" }
		<tr><td align="right">{$labels[fl]}  :</td><td>
			{ldelim}${$fields[fl]}_sel{rdelim}
		</td></tr>
        {/if}
                {if $input_types[fl] == "select_table_multiple" }
		<tr><td align="right">{$labels[fl]}  :</td><td>
			{ldelim}${$fields[fl]}_sel{rdelim}
		</td></tr>
        {/if}
		{if $input_types[fl] == "file" }
		<tr><td align="right">{$labels[fl]} :</td><td> <input type="file" id="{$fields[fl]}" name="{$fields[fl]}" value="{literal}{${/literal}{$fields[fl]}}"><a href="{literal}{${/literal}{$fields[fl]}}">{literal}{${/literal}{$fields[fl]}}</a></td></tr>
		{/if}
	{/section}
	{ldelim}$FROM_IMP_CLASS{rdelim}
		{literal}{if $gact == "editRec"}
		<tr><td></td><td>
			<input type="submit" value="salveaza" onClick='submitDetailsForm("saveRec")'></td></tr>
		{else}
			<tr><td><input type="submit" value="adauga" onClick='submitDetailsForm("addRec")'></td><td></td></tr>
		{/if}
		{/literal}
	</table>
	</form><hr>