{extends file=$display_obj->layout_file}
{block name=content}
<div class="container">	
    <h1>Grid: {$display_obj->GRID_NAME}</h1>   
 <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item"><a class="nav-link active" data-toggle="tab" href='#tab1'>Details</a></li>
	<li class="nav-item"><a class="nav-link" data-toggle="tab" href='#tab2'>Columns</a></li>
	<li class="nav-item"><a class="nav-link" data-toggle="tab" href='#tab3'>Actions</a></li>
</ul>
	   <div class="tab-content container-fluid">    
            <div id="tab1" class="container-fluid tab-pane active"><p>{include file="gen_tpl/phpapps_designer_grids_form.tpl"}</p></div>
            <div id="tab2" class="container-fluid tab-pane fade"><p>{$grid_grid_columns}</p></div>
            <div id="tab3" class="container-fluid tab-pane fade"><p>{$PHPAPPS_DESIGNER_GRID_ACTIONS}</p></div>
        </div>
</div>
{/block}