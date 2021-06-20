{if $this->button_type == 1 }
   <button type="submit" >{$this->NAME}</button>
{elseif $this->button_type == 2}
   <button type="button" onclick="">{$this->NAME}</button>
{elseif $this->button_type == 3}
    <button onclick="window.history.back()">{$this->NAME}</button>
{elseif $this->button_type == 4}
   <button type="reset" >{$this->NAME}</button>
{else}
   <button type="button" onclick="">{$this->NAME}</button>
{/if}
