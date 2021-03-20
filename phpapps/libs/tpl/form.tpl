<h1>MUMU</h1>
{$flabel1}
{$flabel2}


{foreach from=$this->form_elements item=form_el}
    {$form_el->get_str()}
 {/foreach}