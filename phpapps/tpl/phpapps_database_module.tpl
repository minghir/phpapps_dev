{extends file=$display_obj->layout_file}
{block name=content}
<div class="container-fluid">	
<h2>{$module->APP_NAME}: {$module->MODULE_TITLE} </h2>
    <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item"><a class="nav-link active" data-toggle="tab" href='#tab1'>Databases</a></li>
        <li class="nav-item"><a class="nav-link" data-toggle="tab" href='#tab2'>DB Connections</a></li>
        <li class="nav-item"><a class="nav-link" data-toggle="tab" href='#tab3'>Lists</a></li>
        <li class="nav-item"><a class="nav-link" data-toggle="tab" href='#tab4'>Tables</a></li>
	<li class="nav-item"><a class="nav-link" data-toggle="tab" href='#tab5'>Queries</a></li>
	<li class="nav-item"><a class="nav-link" data-toggle="tab" href='#tab6'>Views</a></li>
        <li class="nav-item"><a class="nav-link" data-toggle="tab" href='#tab7'><small>Forms</small></a></li>
        <li class="nav-item"><a class="nav-link" data-toggle="tab" href='#tab8'><small>Scripts</small></a></li>
    </ul>
	
        <div class="tab-content container-fluid">    
            <div id="tab1" class="container-fluid tab-pane active"><p>{$PHPAPPS_DATABASE_DATABASES_GRID}</p></div>
            <div id="tab2" class="container-fluid tab-pane fade"><p>{$DATABASE_CONNECTIONS_GRID}</p></div>
            <div id="tab3" class="container-fluid tab-pane fade"><p>{$db_lists_grid}</p></div>
            <div id="tab4" class="container-fluid tab-pane fade"><p>{$db_tables_grid}</p></div>
            <div id="tab5" class="container-fluid tab-pane fade"><p>{$queries_grid}</p></div>
            <div id="tab6" class="container-fluid tab-pane fade"><p>{$views_grid}</p></div>
            <div id="tab7" class="container-fluid tab-pane fade"><p>{$forms_grid}</p></div>
            <div id="tab8" class="container-fluid tab-pane fade"><p>{$scripts_grid}</p></div>
        </div>
</div>
{/block}