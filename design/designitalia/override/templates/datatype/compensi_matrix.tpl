{def $notes = hash()}
{let matrix=$attribute.content}

    {ezscript_require(array('jquery.dataTables.js', 'jquery.opendataDataTable.js', 'dataTables.bootstrap.js', 'dataTables.responsive.min.js', 'moment-with-locales.min.js', 'moment-timezone-with-data.js'))}
    {ezcss_require(array('dataTables.bootstrap.css','responsive.dataTables.min.css'))}
    <script type="text/javascript" language="javascript">
    $(document).ready( function () {ldelim}
        $('#table-{$attribute.id}').DataTable({ldelim}
            "searching": false,
            "paging": false,
            "responsive": true,
            "language":{ldelim}
                "decimal":        "",
                "emptyTable":     "Nessun dato presente nella tabella",
                "info":           "Vista da _START_ a _END_ di _TOTAL_ elementi",
                "infoEmpty":      "Zero elementi",
                "infoFiltered":   "(filtrati da _MAX_ elementi totali)",
                "infoPostFix":    "",
                "thousands":      ",",
                "lengthMenu":     "Visualizza _MENU_ elementi",
                "loadingRecords": "Caricamento...",
                "processing":     "Elaborazione...",
                "search":         "Cerca:",
                "zeroRecords":    "La ricerca non ha portato alcun risultato",
                "paginate": {ldelim}
                    "first":      "Inizio",
                    "last":       "Fine",
                    "next":       "Successivo",
                    "previous":   "Precedente"
                {rdelim},
                "aria": {ldelim}
                    "sortAscending":  ": attiva per ordinare la colonna in ordine crescente",
                    "sortDescending": ": attiva per ordinare la colonna in ordine decrescente"
                {rdelim}
            {rdelim},
        {rdelim});
    {rdelim});
    </script>

    <div class="u-text-h5"><strong>{$attribute.contentclass_attribute_name}</strong></div>
    <table id="table-{$attribute.id}" class="Table Table--withBorder js-TableResponsive tablesaw tablesaw-stack" data-tablesaw-mode="stack">
            <thead>
            <tr>
                {section var=ColumnNames loop=$matrix.columns.sequential}
                    {def $header = $ColumnNames.item.name|explode('|')}
                    <th scope="col">
                        <small>{$header[0]}{if is_set( $header[1] )}{$header[1]}{/if}</small>
                    </th>
                    {if and( is_set( $header[1] ), is_set( $header[2] ) )}
                        {set $notes = $notes|merge( hash( $header[1], $header[2] ) )}
                    {/if}
                    {undef $header}
                {/section}
            </tr>
        </thead>
        <tbody>
            {section var=Rows loop=$matrix.rows.sequential sequence=array( bglight, bgdark )}
                <tr class="{$Rows.sequence}">
                    {section var=Columns loop=$Rows.item.columns}
                        <td{if or($Columns.item|begins_with('€'), $Columns.item|ends_with('€'))} style="white-space:nowrap"{/if}>{$Columns.item|wash( xhtml )}</td>
                    {/section}
                </tr>
            {/section}
        </tbody>
    </table>
{/let}
{if count( $notes )|gt(0)}
    <p>
        {foreach $notes as $key => $note}
            <small>({$key}) {$note}</small>
            {delimiter}<br/>{/delimiter}
        {/foreach}
    </p>
{/if}
{undef $notes}
