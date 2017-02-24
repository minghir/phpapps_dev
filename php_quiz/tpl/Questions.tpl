<html>
<head>
{include file="{$PHPAPPS_SMARTY_TPL_DIR}commun_header.tpl" }
</head>
<body>
 {section name=qus loop=$QUESTIONS}
     <b>{$QUESTIONS[qus]->NO} : </b> {$QUESTIONS[qus]->QUESTION}<br>
     &nbsp;&nbsp;&nbsp;{$QUESTIONS[qus]->ANSWER_1}<br>
     &nbsp;&nbsp;&nbsp;{$QUESTIONS[qus]->ANSWER_2}<br>
     &nbsp;&nbsp;&nbsp;{$QUESTIONS[qus]->ANSWER_3}<br>
     <hr>
     
 {/section}
</body>
</html>