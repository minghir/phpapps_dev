<h1>MUMU</h1>
{$flabel1}
{$flabel2}

<form name="{$this->FORM_NAME}" method="{$this->FORM_METHOD}">
{foreach from=$this->form_elements item=form_el}
    {$form_el->get_str()}<br>
 {/foreach}
</form>