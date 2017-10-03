{extends file=$display_obj->layout}
{block name=body}
    <br>
    
   {foreach from=$categ_names key=k item=v}
       
           {foreach from=$v key=l item=i}
               
             
                   {$v[$l]} - {$v}<br>
             
           {/foreach}

    {/foreach}
{/block}
