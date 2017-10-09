{extends file=$display_obj->layout}
{block name=body}
    <div class="navbar navbar-inverse"> 
        <ul class="nav navbar-nav">
            <li><a href="forum_categs.php">Forum &gt;</a> </li>
        </ul>
        <p class="navbar-text"> {$categ_name}</p>
    </div>
    
    
    <ul class="list-group"> 
            <li class="list-group-item active">{$categ_name}</li>
    
    
    {section name=topics loop=$topic_ids}
       
        <li class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp;<a href="topic.php?topic_id={$topic_ids[topics]}">{$topic_subjects[topics]}</a></li>
      
           
       
    {/section}
    </ul>    
{/block}
