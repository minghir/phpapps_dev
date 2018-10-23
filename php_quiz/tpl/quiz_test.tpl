<html>
<head>
{include file="{$PHPAPPS_SMARTY_TPL_DIR}commun_header.tpl" }
</head>
<body>
    {if $CHECK == true}
        <h1> Raspunsuri corecte:{$CORRECT_ANS} din {count($QUESTIONS)} de intrebari. </h1>
        <a href="Questions.php"><font color="blue">Inapoi</font></a> <br><br>
    {/if}
    <form name="test" method ="POST">
{section name=qus loop=$QUESTIONS}
       <font color="#565656" size="0.9">{$QUESTIONS[qus]->CTEG_NAME}</font><br>
       <b> {$smarty.section.qus.index + 1} : </b> {stripslashes($QUESTIONS[qus]->QUESTION)}<br>
       <input type="hidden" name="question_id[]" value="{$QUESTIONS[qus]->ID}">
       
       {if $QUESTIONS[qus]->ANSWER_1 != ""}
           {if $QUESTIONS[qus]->user_answer == 1 && $CHECK == true }<font color="red">{/if}
           {if $QUESTIONS[qus]->CORRECT_1 == 1 && $CHECK == true }<font color="blue">{/if}
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="answer[{$QUESTIONS[qus]->ID}]" value="1" {if $QUESTIONS[qus]->user_answer == 1 && $CHECK == true }checked {/if} {if $CHECK == true }disabled="true"{/if}>{stripslashes($QUESTIONS[qus]->ANSWER_1)}<br>
           </font></font>
       {/if}
       {if $QUESTIONS[qus]->ANSWER_2 != ""}
           {if $QUESTIONS[qus]->user_answer == 2 && $CHECK == true }<font color="red">{/if}
           {if $QUESTIONS[qus]->CORRECT_2 == 1 && $CHECK == true }<font color="blue">{/if}
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="answer[{$QUESTIONS[qus]->ID}]" value="2" {if $QUESTIONS[qus]->user_answer == 2 && $CHECK == true }checked{/if} {if $CHECK == true }disabled="true"{/if}>{stripslashes($QUESTIONS[qus]->ANSWER_2)}<br>
             </font></font>
       {/if}
       {if $QUESTIONS[qus]->ANSWER_3 != ""}
           {if $QUESTIONS[qus]->user_answer == 3 && $CHECK == true }<font color="red">{/if}
           {if $QUESTIONS[qus]->CORRECT_3 == 1 && $CHECK == true }<font color="blue">{/if}
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="answer[{$QUESTIONS[qus]->ID}]" value="3" {if $QUESTIONS[qus]->user_answer == 3 && $CHECK == true }checked {/if} {if $CHECK == true }disabled="true"{/if}>{stripslashes($QUESTIONS[qus]->ANSWER_3)}<br>
             </font></font>
       {/if}
       {if $QUESTIONS[qus]->ANSWER_4 != ""}
           {if $QUESTIONS[qus]->user_answer == 4 && $CHECK == true }<font color="red">{/if}
           {if $QUESTIONS[qus]->CORRECT_4 == 1 && $CHECK == true }<font color="blue">{/if}
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="answer[{$QUESTIONS[qus]->ID}]" value="4" {if $QUESTIONS[qus]->user_answer == 4 && $CHECK == true }checked {/if} {if $CHECK == true }disabled="true"{/if}>{stripslashes($QUESTIONS[qus]->ANSWER_4)}<br>
             </font></font>
       {/if}
       {if file_exists("imgs/{$QUESTIONS[qus]->CATEG_ID}/{$QUESTIONS[qus]->NO}.jpg")}
            <img src="imgs/{$QUESTIONS[qus]->CATEG_ID}/{$QUESTIONS[qus]->NO}.jpg">
            <br>    
        {/if}
     <br>
     <hr>
 {/section}
 {if $CHECK == true}
     <a href="Questions.php"><font color="blue">Inapoi</font></a>
 {else}
 <input type="submit" name="act" value="Verifica test">
 {/if}
 <form>
</body>
</html>