<html>
<head>
<title>SQL:{$DATABASE}</title>
</head>
<body>
    <table border="0">
    <tr>
    {section name=fld loop=$fields}
    <td><b>{$fields[fld]}</b></td>
    {/section}
    </tr>
    {section name=row loop=$rows}
    <tr>{$rows[row]}</tr>
    {/section}
    </table>
    {if $SQL_ERROR != 0 }
    <div align="left">
    <font color="#520202" size=4>{$SQL_ERROR}</font>
    </div>
    {/if}
</body>
</html>
