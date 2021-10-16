
<div class="container-fluid" >
<hr>
<h3>{$grid_title}{if $mode_search == true } {$num_rows} produse{/if}</h3>
<hr>
    <div class="row row-fluid">  
        {section name=vls loop=$values}
        <div class="card box-shadow mb-1 mr-1" style="width:200px">
         <div style="background: white;">    
                <img class="card-img-top" src="{$values_key_fields[vls]["IMG"]}" alt="{$values_key_fields[vls]["PRODUCT_TITLE"]}" >
         </div>
            <div class="card-body">
                <p class="card-text"><a href="product_details.php?gfield=ID&gfield_value={$values_key_fields[vls]["ID"]}">{$values_key_fields[vls]["PRODUCT_TITLE"]}</a></p>
                <p class="card-text">{$values_key_fields[vls]["PRICE"]} {$values_key_fields[vls]["CURRENCY"]}</p>
                <a href="cart.php?gact=add&gfield=ID&gfield_value={$values_key_fields[vls]["ID"]}" class="btn btn-primary">adauga in cos</a>
            </div>
        </div>
        {/section}
    </div>
</div>    
{if $pages > 1 }    
<div class="container" align="center">
<hr>
{section name=pgs loop=$pgs_hrefs} {$pgs_hrefs[pgs]} {/section}
<hr>
</div>
{/if}