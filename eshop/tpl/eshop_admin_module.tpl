{extends file=$display_obj->layout_file}
{block name=content}
<div class="container-fluid">	
<h2>{$display_obj->APP_NAME}:  {$display_obj->MODULE_TITLE}</h2>
    <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item"><a class="nav-link active" data-toggle="tab" href='#products'>Products</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab" href='#categories'>Categories</a></li>
    </ul>
	
        <div class="tab-content container-fluid">    
            <div id="products" class="container-fluid tab-pane active"><p>{$ESHOP_PRODUCTS}</p></div>
            <div id="categories" class="container-fluid tab-pane fade"><p>{$ESHOP_CATEGORIES}</p></div>
        </div>
</div>


{/block}