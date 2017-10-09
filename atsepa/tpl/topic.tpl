{extends file=$display_obj->layout}
{block name=body}
<div class="navbar navbar-inverse"> 
        <ul class="nav navbar-nav">
            <li><a href="forum_categs.php">Forum &gt; </a> </li>
            <li><a href="forum_topics.php?categ_id=8{$categ_id}">Subcat 1.1 &gt;</a> </li>
        </ul>
        <p class="navbar-text">{$topic_name}</p>
    </div>
{/block}
