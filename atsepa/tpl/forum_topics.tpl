{extends file=$display_obj->layout}
{block name=body}
    <div class="navbar navbar-inverse"> 
        <ul class="nav navbar-nav">
            <li><a href="forum_categs.php">Categorii &gt;</a> </li>
        </ul>
        <p class="navbar-text"> {$categ_name}</p>
    </div>
    
    
    <ul class="list-group"> 
            <li class="list-group-item active">{$categ_name}</li>
    
    
    {section name=topics loop=$topic_ids}
        {if $no_posts[topics] == 0}
            <li class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp;{$topic_subjects[topics]} ({$no_posts[topics]} postari)</li>
         {else}   
        <li class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp;<a href="forum_posts.php?topic_id={$topic_ids[topics]}">{$topic_subjects[topics]}</a> ({$no_posts[topics]} postari)</li>
        {/if}
      
           
       
    {/section}
    </ul>    
{/block}
