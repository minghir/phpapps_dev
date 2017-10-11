{extends file=$display_obj->layout}
{block name=body}
<div class="navbar navbar-inverse"> 
        <ul class="nav navbar-nav">
            <li><a href="forum_categs.php">Categorii &gt; </a> </li>
            <li><a href="forum_topics.php?categ_id={$categ_id}">{$categ_name} &gt;</a> </li>
        </ul>
        <p class="navbar-text">{$topic_name}</p>
    </div>
    {$FORUM_POSTS_GRID}
{/block}