{if $db_select_multiple === true}
<select class="form-control" id="{$html_id}" name="{$db_select_name}[]" multiple {$disabled}>
{else}
<select class="form-control" {if $html_id!=""}id="{$html_id}"{/if} name="{$db_select_name}" {$disabled}>
{/if}
{if $empty_option === true}
<option value="{$empty_option_value}"> -- </option>
{/if}
{foreach $db_select_options as $db_select_option}
    <option value="{$db_select_option.value}" {$db_select_option.selected}> {$db_select_option.label}</option>
{/foreach} 
</select>
