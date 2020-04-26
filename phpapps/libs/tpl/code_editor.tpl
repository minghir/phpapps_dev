<!doctype html>

<title>PHPApps: Code Editor</title>
<meta charset="utf-8"/>
<link rel=stylesheet href="{$smarty.const.CODEMIRROR_DIR}/doc/docs.css">

<link rel="stylesheet" href="{$smarty.const.CODEMIRROR_DIR}/lib/codemirror.css">
<script src="{$smarty.const.CODEMIRROR_DIR}/lib/codemirror.js"></script>
<script src="{$smarty.const.CODEMIRROR_DIR}/addon/edit/matchbrackets.js"></script>
<script src="{$smarty.const.CODEMIRROR_DIR}/mode/htmlmixed/htmlmixed.js"></script>
<script src="{$smarty.const.CODEMIRROR_DIR}/mode/xml/xml.js"></script>
<script src="{$smarty.const.CODEMIRROR_DIR}/mode/javascript/javascript.js"></script>
<script src="{$smarty.const.CODEMIRROR_DIR}/mode/css/css.js"></script>
<script src="{$smarty.const.CODEMIRROR_DIR}/mode/clike/clike.js"></script>
<script src="{$smarty.const.CODEMIRROR_DIR}/mode/php/php.js"></script>
<script src="{$smarty.const.CODEMIRROR_DIR}/mode/sql/sql.js"></script>
{literal}

<style type="text/css">.CodeMirror {border-top: 1px solid black; border-bottom: 1px solid black; height: auto;}</style>
{/literal}
<h2>PHPApps Code Editor: <b>{$file_name}</b></h2>
<form method="POST">
<input type="hidden" name="file_path" value="{$file_path}">
<textarea id="code" name="code">
{$file_content}
</textarea>
<input type="submit" name="pact" value="reload"> | <input type="submit" name="pact" value="save">
</form>

{literal}
   <script>
      var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
        lineNumbers: true,
        matchBrackets: true,
        mode: "application/x-httpd-php",
        indentUnit: 4,
        indentWithTabs: true
      });
	  //editor.setSize("100%", 800);
    </script>
  

{/literal}