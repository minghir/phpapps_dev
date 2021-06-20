<label for="{$this->NAME}">{$this->ELEMENT_LABEL}</label>
{if $this->multiple === true }
<select id="" name="{$this->NAME}[]" multiple>
{else}
<select id="" name="{$this->NAME}">
{/if}    
    {foreach $this->options as $select_option}
        {$select_option->get_str()}
    {/foreach}
</select>