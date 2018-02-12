{let matrix=$attribute.content}
  <table class="Table Table--withBorder Table--compact u-text-r-xxs u-layout-prose" cellspacing="0">
    <thead>
    <tr class="u-border-bottom-xs">
      {section var=ColumnNames loop=$matrix.columns.sequential}
        <th>{$ColumnNames.item.name}</th>
      {/section}
    </tr>
    {section var=Rows loop=$matrix.rows.sequential sequence=array( bglight, bgdark )}
      <tr class="{$Rows.sequence}">
        {section var=Columns loop=$Rows.item.columns}
          <td>{$Columns.item|wash( xhtml )}</td>
        {/section}
      </tr>
    {/section}
  </table>
{/let}
