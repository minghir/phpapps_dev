<h3>{$grid_title}</h3>
 
<hr>

<!--Grid row-->


  <!--Grid column-->
  

<div class="row">
  
        {section name=vls loop=$values}
<div class="col-sm-4 col-lg-2">
            <div class="card mx-auto mt-3" style="width:200px;height:300px">
              <img class="card-img-top" src="{$values_key_fields[vls]["IMG"]}" alt="Card image" style="width:100%">
                    <div class="card-body">
                        <h5 class="card-title">{$values_key_fields[vls]["PRODUCT_TITLE"]}</h5>
                        <p class="card-text">{$values_key_fields[vls]["PRICE"]} {$values_key_fields[vls]["CURRENCY"]}</p>
                        <a href="product_details.php" class="btn btn-primary">Detalii</a>
                    </div>
            </div>  
</div>
       {/section}
</div>


<div class="row mt-3">
 <!-- {if $paginable == 1 }
        ({if $mode_search == true }<font color="blue"><b>Found:</b>{/if}{$num_rows} recs/{$pages} pgs</font>)
 {/if}
 --> 
{if $pages > 1 }{section name=pgs loop=$pgs_hrefs} {$pgs_hrefs[pgs]} {/section}{/if}
</div>
<hr>