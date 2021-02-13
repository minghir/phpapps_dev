{extends file=$display_obj->layout_file}
{block name=content}
<div class="container-fluid">	
    <h2>DOMAXCLEAN:  {$display_obj->MODULE_TITLE} | <a href="admin_logout.php">Iesire</a></h2>  
    <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item"><a class="nav-link active" data-toggle="tab" href='#products'>Produse</a></li>
	<li class="nav-item"><a class="nav-link" data-toggle="tab" href='#categories'>Categorii</a></li>
        <li class="nav-item"><a class="nav-link" data-toggle="tab" href='#orders'>Comenzi</a></li>
        <li class="nav-item"><a class="nav-link" data-toggle="tab" href='#clients'>Clienti</a></li>
        <li class="nav-item"><a class="nav-link" data-toggle="tab" href='#msgs'>Mesaje</a></li>
    </ul>
	
        <div class="tab-content container-fluid">    
            <div id="products" class="container-fluid tab-pane active"><p>{$ESHOP_ADMIN_PRODUCTS}</p></div>
            <div id="categories" class="container-fluid tab-pane fade"><p>{$ESHOP_CATEGORIES}</p></div>
            <div id="orders" class="container-fluid tab-pane fade"><p>{$ESHOP_ADMIN_ORDERS}</p></div>
            <div id="clients" class="container-fluid tab-pane fade"><p>{$ESHOP_ADMIN_CLIENTS}</p></div>
            <div id="msgs" class="container-fluid tab-pane fade"><p>{$ESHOP_CLIENTS}</p></div>
        </div>
</div>


{/block}