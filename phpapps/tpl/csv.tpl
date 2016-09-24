{$fields}
{section name=row loop=$rows}
{$rows[row]}
{/section}
{if $SQL_ERROR != 0 }
{$SQL_ERROR}
{/if}
