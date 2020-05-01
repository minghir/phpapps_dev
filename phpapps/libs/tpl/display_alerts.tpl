{foreach name=alerts  item=alert from=$messages}
<div class="alert alert-{$alert->type} alert-dismissible fade show">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>{ucfirst($alert->type)}!</strong> {$alert->message}
</div>
{/foreach}