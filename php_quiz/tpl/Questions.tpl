<html>
<head>
<link rel="stylesheet" href="css/curs.css" type="text/css">    
{include file="{$PHPAPPS_SMARTY_TPL_DIR}commun_header.tpl" }
{literal}
<script type="text/javascript">
function confirmation(url) {
	var answer = confirm("SIGUR STERGETI INREGISTRAREA????")
	if (answer){
		window.open(url,'popup','width=500,height=500,scrollbars=no,resizable=no,toolbar=no,directories=no,location=no,menubar=no,status=no,left=0,top=0'); return false;
	}
}
</script>
{/literal}
</head>
<body>
    <form name="select_cat" method="POST">
        <select name="catg_id" onChange="this.form.submit();">
        <option value=" "> -- </option>
 <option value="1" {if $category_id=="1"}selected{/if} >(D) Marinarie</option>
 <option value="2" {if $category_id=="2"}selected{/if}> (D) Conducere / Manevra</option>
 <option value="3" {if $category_id=="3"}selected{/if}> (D) RND</option>
 <option value="4" {if $category_id=="4"}selected{/if}> (C) Manevra Agrement</option>
 <option value="5" {if $category_id=="5"}selected{/if}> (C) Marinarie Agrement</option>
 <option value="6" {if $category_id=="6"}selected{/if}> (C) Navigatie Agrement</option>
 <option value="7" {if $category_id=="7"}selected{/if}> (C) Colreg Agrement</option>
        </select> | <a href="php_quiz_questions_questions_form_imp.php?gact=newRec&CATEG_ID={$category_id}" onclick="window.open('php_quiz_questions_questions_form_imp.php?gact=newRec&CATEG_ID={$category_id}','popup','width=0,height=0,scrollbars=no,resizable=no,toolbar=no,directories=no,location=no,menubar=no,status=no,left=0,top=0'); return false"> <font color="blue">new</font></a> | <a href="quiz_test.php?cat=C">test categoria C</a>| <a href="quiz_test.php?cat=D">test categoria D</a>
    </form>
    <br><br>
    <hr>
 {section name=qus loop=$QUESTIONS}
     <font color="#565656" size="0.9">{$QUESTIONS[qus]->CTEG_NAME}</font><br>
     <b>{$QUESTIONS[qus]->NO} : </b> {stripslashes($QUESTIONS[qus]->QUESTION)}<br>
     {if $QUESTIONS[qus]->ANSWER_1 != ""}
            {if $QUESTIONS[qus]->CORRECT_1 == 1}
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font color="#0c3563">{stripslashes($QUESTIONS[qus]->ANSWER_1)}</font></b><br>
            {else}
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{stripslashes($QUESTIONS[qus]->ANSWER_1)}<br>
            {/if}
      {/if}
      {if $QUESTIONS[qus]->ANSWER_2 != ""}    
            {if $QUESTIONS[qus]->CORRECT_2 == 1}
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font color="#0c3563">{stripslashes($QUESTIONS[qus]->ANSWER_2)}</font></b><br>
            {else}
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{stripslashes($QUESTIONS[qus]->ANSWER_2)}<br>
            {/if}
       {/if}
       {if $QUESTIONS[qus]->ANSWER_3 != ""}
            {if $QUESTIONS[qus]->CORRECT_3 == 1}
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font color="#0c3563">{stripslashes($QUESTIONS[qus]->ANSWER_3)}</font></b><br>
            {else}
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{stripslashes($QUESTIONS[qus]->ANSWER_3)}<br>
            {/if}
        {/if}
        {if $QUESTIONS[qus]->ANSWER_4 != ""}
            {if $QUESTIONS[qus]->CORRECT_4 == 1}
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font color="#0c3563">{stripslashes($QUESTIONS[qus]->ANSWER_4)}</font></b><br>
            {else}
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{stripslashes($QUESTIONS[qus]->ANSWER_4)}<br>
        {/if}
        {/if}
        <br>
        {if file_exists("imgs/{$QUESTIONS[qus]->CATEG_ID}/{$QUESTIONS[qus]->NO}.jpg")}
            <img src="imgs/{$QUESTIONS[qus]->CATEG_ID}/{$QUESTIONS[qus]->NO}.jpg">
            <br>    
        {/if}
     <a href="php_quiz_questions_questions_form_imp.php?gact=editRec&gfield=ID&gfield_value={$QUESTIONS[qus]->ID}" onclick="window.open('php_quiz_questions_questions_form_imp.php?gact=editRec&gfield=ID&gfield_value={$QUESTIONS[qus]->ID}','popup','width=0,height=0,scrollbars=no,resizable=no,toolbar=no,directories=no,location=no,menubar=no,status=no,left=0,top=0'); return false"><font color="green">edit</font></a> |
     <a href="php_quiz_questions_questions_form_imp.php?gact=deleteRec&gfield=ID&gfield_value={$QUESTIONS[qus]->ID}" onclick="if(confirm('Sigur stergeti inregistrarea?')) window.open('php_quiz_questions_questions_form_imp.php?gact=deleteRec&gfield=ID&gfield_value={$QUESTIONS[qus]->ID}','popup','width=0,height=0,scrollbars=no,resizable=no,toolbar=no,directories=no,location=no,menubar=no,status=no,left=0,top=0'); return false"><font color="red">delete</font></a>
     

     
     <hr>
 {/section}
</body>
</html>