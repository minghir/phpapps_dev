
<div class="container-fluid" >
<hr>
<h3>{$grid_title}{if $mode_search == true } {$num_rows} produse{/if}</h3>
<hr>
    <div class="row row-fluid">  
        {section name=vls loop=$values}
        <div class="card box-shadow mt-1 ml-1 mb-1 mr-1" style="width:200px; height:335px">
         <div class="mt-1" style="background: white;height:500px;max-height: 20vh;">  
             <a href="product_details.php?gfield=ID&gfield_value={$values_key_fields[vls]["ID"]}">
                <img class="card-img-top" src="{$values_key_fields[vls]["IMG"]}" alt="{$values_key_fields[vls]["PRODUCT_TITLE"]}" >
             </a>
         </div>
         <span class="align-bottom">
            <div class="card-body">
                <p class="card-text"><a href="product_details.php?gfield=ID&gfield_value={$values_key_fields[vls]["ID"]}">{$values_key_fields[vls]["PRODUCT_TITLE"]}</a><br>
                {$values_key_fields[vls]["PRICE"]} {$values_key_fields[vls]["CURRENCY"]}</p>
                <a href="cart.php?gact=add&gfield=ID&gfield_value={$values_key_fields[vls]["ID"]}" class="mb-1 btn btn-primary">adauga in cos</a>
            </div>
         </span>
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