<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="{$smarty.const.PHPAPPS_CSS_DIR}{$THEME_CSS}" /> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<link rel="shortcut icon" type="image/png" sizes="32x32" href="{$smarty.const.WEB_BASE_DIR}phpapps/imgs/database-black-icon.png">
    
<title>PHPApps</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}


main_content {
  float: left;
  padding: 0px;
  width: 100%;
  background-color: #f1f1f1;
 /* height: 100%; /* only for demonstration, should be removed */
}

/* Clear floats after the columns */
section:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - makes the two columns/boxes stack on top of each other instead of next to each other, on small screens */
@media (max-width: 600px) {
  vertical_nav, main_content {
    width: 100%;
    height: auto;
  }
}
</style>
</head>
<body>
  <main_content style="overflow:auto; width: 100%;">
       {block name=content}<h2>Cities</h2>{/block}
  </article>


</body>
  </html>