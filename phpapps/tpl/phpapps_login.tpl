{extends file=$display_obj->layout_file}
{block name=content}
<br><br><br><br><br><br>
<div class="d-flex justify-content-around">        
<div >
<h1><b>WABCO</b></h1>
<p class="text-secondary"><h6><b>W</b><small class="text-secondary">eb</small> <b>A</b><small class="text-secondary">pplications</small> <b>B</b><small class="text-secondary">uilder</small> <b>C</b><small class="text-secondary">loud</small> <b>O</b><small class="text-secondary">riented</small></h6></p>
  <form class="form-inline" action="phpapps_login.php" method="POST">
    <label for="email2" class="mb-2 mr-sm-2">Email:</label>
    <input type="text" class="form-control mb-2 mr-sm-2" id="email2" placeholder="Enter email" name="user" value="{$USER}">
    <label for="pwd2" class="mb-2 mr-sm-2">Password:</label>
    <input type="password" class="form-control mb-2 mr-sm-2" id="pwd2" placeholder="Enter password" name="pass">
    <button type="submit" class="btn btn-primary mb-2">Login</button>
  </form>
  <p><a href>Sign-up</a></p>
  <hr>
  {$MESSAGE_BLOCK}
</div>
</div>
    
{/block}
