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
    {$FORUM_TOPICS_GRID}
      </ul>  
{/block}
