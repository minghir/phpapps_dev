<!doctype html>
<html lang="en">
  <head>
     
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
      
      <script src="https://kit.fontawesome.com/098d3aa8b5.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href="{$smarty.const.CURRENT_APP_CSS_DIR}{$display_obj->layout_theme}.css">

<title>{$PAGE_TITLE}</title>
</head>
<style>
    #gradMenu {
 /* background-color: red; /* For browsers that do not support gradients */
 /* background-image: linear-gradient(to right, red , yellow);*/
 background-color: #63cdf1; /* For browsers that do not support gradients */
 background-image: linear-gradient(to right, white, #63cdf1);
}

#gradFooter {
  height: 30px;
  background-color: #666699; /* For browsers that do not support gradients */
  background-image: linear-gradient(to right, white, #63cdf1 );
}
</style>

<body>
        <div class="container">
                
                   <nav class="navbar top navbar-expand-lg navbar-dark bg-dark " id="gradMenu">
                       <!--
                       <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                        </button>
                       -->
                       
                        {$ESHOP_MAIN_MENU} 
                        <div class="nav-item">
                            {$ESHOP_LAYOUT_SETUP}
                        </div>
                     </nav>
     
                        {block name=content}CONTENT BLOCK{/block}
         </div>              
        <div class="container">
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark bottom" id="gradFooter">
                    <div class="input-group">
                      <small class="text-secondary text-dark">Powered by: <a href="https://www.elight.ro" style="color: blue">elight.ro</a> 2021 </small>
                    </div>
                </nav>
         </div>
    </body> 
</html>