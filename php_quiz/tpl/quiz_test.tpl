<html>
<head>
{include file="{$PHPAPPS_SMARTY_TPL_DIR}commun_header.tpl" }
</head>
<body>
    Raspunsuri corecte:{$CORRECT_ANS} din {count($QUESTIONS)} intrebari.
    <form name="test" method ="POST">
{section name=qus loop=$QUESTIONS}
       <b> {$smarty.section.qus.index + 1} : </b> {stripslashes($QUESTIONS[qus]->QUESTION)}<br>
       <input type="hidden" name="question_id[]" value="{$QUESTIONS[qus]->ID}">
       <h1>{$QUESTIONS[qus]->correct_answer}</h1>
       {if $QUESTIONS[qus]->ANSWER_1 != ""}
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="answer[{$QUESTIONS[qus]->ID}]" value="1">{stripslashes($QUESTIONS[qus]->ANSWER_1)}<br>
       {/if}
       {if $QUESTIONS[qus]->ANSWER_2 != ""}
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="answer[{$QUESTIONS[qus]->ID}]" value="2">{stripslashes($QUESTIONS[qus]->ANSWER_2)}<br>
       {/if}
       {if $QUESTIONS[qus]->ANSWER_3 != ""}
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="answer[{$QUESTIONS[qus]->ID}]" value="3">{stripslashes($QUESTIONS[qus]->ANSWER_3)}<br>
       {/if}
       {if $QUESTIONS[qus]->ANSWER_4 != ""}
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="answer[{$QUESTIONS[qus]->ID}]" value="4">{stripslashes($QUESTIONS[qus]->ANSWER_4)}<br>
       {/if}
     <br>
     <hr>
 {/section}
 <input type="submit" name="act" value="Verifica test">
 <form>
</body>
</html>