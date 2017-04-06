{def $fields = $openpa.control_children.current_extra_configs}
{if is_set($fields.advanced_datatable)}
    {def $fieldsParts = $fields.advanced_datatable|explode( '|' )
         $class = api_class($fieldsParts[0]|trim())
         $identifiers = $fieldsParts[1]|explode( ',' )
         $depth = cond( is_set($fieldsParts[2]), $fieldsParts[2], false() )
         $currentLanguage = ezini('RegionalSettings','Locale')
         $moment_language = $currentLanguage|explode('-')[1]|downcase()
         $depth_query_part = ''}

    {def $root_nodes = array($node.node_id)}
    {if is_set( $openpa.content_virtual.folder.subtree )}
        {set $root_nodes = $openpa.content_virtual.folder.subtree}
    {/if}

    {if is_set($class.identifier)}

        {if is_numeric($depth)}
            {set $depth_query_part = concat('raw[meta_depth_si] range [', $node.depth, ',', $node.depth|sum($depth), '] and ')}
        {/if}

        {def $class_fields = array()
             $identifierParts = array()}
        {foreach $identifiers as $identifier}
            {set $identifierParts = $identifier|explode('.')}
            {foreach $class.fields as $field}
                {if $identifierParts[0]|eq($field.identifier)}
                    {if and( $field.dataType|eq('ezmatrix'), is_set($identifierParts[1]) )}
                        {set $field = $field|merge(hash('matrix_column',$identifierParts[1]))}
                    {/if}
                    {set $class_fields = $class_fields|append($field)}
                {/if}
            {/foreach}
        {/foreach}

        {ezscript_require(array('jquery.dataTables.js', 'jquery.opendataDataTable.js', 'dataTables.bootstrap.js', 'dataTables.responsive.min.js', 'moment-with-locales.min.js', 'moment-timezone-with-data.js', 'plugins/datatables/dataTables.overrides.js'))}
        {ezcss_require(array('dataTables.bootstrap.css','responsive.dataTables.min.css'))}


        <table id="advanced_datatable-{$node.node_id}" class='dt-column-filter Table Table--striped Table--withBorder'></table>

{literal}
<style>
    table.dataTable thead .sorting:after, table.dataTable thead .sorting_asc:after, table.dataTable thead .sorting_desc:after, table.dataTable thead .sorting_asc_disabled:after, table.dataTable thead .sorting_desc_disabled:after{
        font-family: 'FontAwesome';
        top: 1.1em;
    }
    table.dataTable thead .sorting:after{
        content: "\f0dc";
    }
    table.dataTable thead .sorting_desc:after {
        content: "\f0dd";
    }
    table.dataTable thead .sorting_asc:after {
        content: "\f0de";
    }
</style>
{/literal}
<script type="text/javascript" language="javascript" class="init">
    moment.locale('{$moment_language}');
    $(document).ready(function () {ldelim}
        var elem = '#advanced_datatable-{$node.node_id}';
        if ($(elem).data("pagination-top-bottom") === true) {ldelim}
            sdom = "<'Grid Grid--withGutter'<'Grid-cell u-size1of2'l><'Grid-cell u-size1of2'pf>r>t<'Grid'<'Grid-cell u-size1of2'<'u-padding-all-s'i>><'Grid-cell u-size1of2'<'u-padding-all-s'p>>>";
        {rdelim} else if ($(elem).data("pagination-top") === true) {ldelim}
            sdom = "<'Grid Grid--withGutter'<'Grid-cell u-size1of2'l><'Grid-cell u-size1of2'pf>r>t<'Grid'<'Grid-cell u-size1of2'<'u-padding-all-s'i>><'Grid-cell u-size1of2'<'u-padding-all-s'>>>";
            {rdelim} else {ldelim}
            sdom = "<'Grid Grid--withGutter'<'Grid-cell u-size1of2'l><'Grid-cell u-size1of2'f>r>t<'Grid'<'Grid-cell u-size1of2'<'u-padding-all-s'i>><'Grid-cell u-size1of2'<'u-padding-all-s'p>>>";
        {rdelim}

        $(elem).opendataDataTable({ldelim}
            "builder":{ldelim}"query": '{$depth_query_part}classes [{$class.identifier}] subtree [{$root_nodes|implode(',')}]'{rdelim},
            "table":{ldelim}
                "id": 'advanced_datatable--{$node.node_id}',
                "template": '<table class="table table-striped table-bordered display responsive no-wrap" cellspacing="0" width="100%"></table>'
                {rdelim},
            "datatable":{ldelim}
                "sDom": sdom,
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
                "ajax": {ldelim}url: "{'opendata/api/datatable/search'|ezurl(no,full)}/"{rdelim},
                "lengthMenu": [ 30, 60, 90, 120 ],
                "columns": [

{foreach $class_fields as $field}{def $title = $field.name[$currentLanguage]}
{if is_set($field.matrix_column)}{foreach $field['template']['format'][0][0] as $columnIdentifier => $columnName}{if $columnIdentifier|eq($field.matrix_column)}{set $title = concat( $title, $columnName|explode('string (')|implode(' (') )}{break}{/if}{/foreach}{/if}
{ldelim}
    "data": "data.{$currentLanguage}.{$field.identifier}",
    "name": '{$field.identifier}',
    "title": '{$title|wash(javascript)}',
    "searchable": {if and($field.isSearchable|eq(true()), $field.dataType|ne('ezmatrix'))}true{else}false{/if}, {*@todo ricercabilità per sottoelemento matrice*}
    "orderable": {if and($field.isSearchable|eq(true()), $field.dataType|ne('ezmatrix'))}true{else}false{/if}
{rdelim}
{undef $title}
{delimiter},{/delimiter}

{/foreach}
                ],
                "columnDefs": [
                    {foreach $class_fields as $index => $field}
                    {ldelim}
                        "render": function ( data, type, row, meta ) {ldelim}
                            if (data) {ldelim}
                                {if is_set($field.matrix_column)}
                                var result = [];
                                $.each(data, function () {ldelim}
                                    var row = this;
                                    $.each(row, function (index, value) {ldelim}
                                        if (index == '{$field.matrix_column}') {ldelim}
                                            result.push(value);
                                            {rdelim}
                                        {rdelim});
                                    {rdelim});
                                return result.join('<br />');
                                {else}
                                return opendataDataTableRenderField( '{$field.dataType}', '{$field.template.type}', '{$currentLanguage}', data, type, row, meta {if $index|eq(0)},'/content/view/full/'+row.metadata.mainNodeId{/if});
                                {/if}
                                {rdelim}
                            return '';
                            {rdelim},
                        "targets": [{$index}]
                        {rdelim}
                    {delimiter},{/delimiter}
                    {/foreach}
                ]
                {rdelim}
            {rdelim}).data('opendataDataTable').loadDataTable();
        {rdelim});
</script>



    {elseif fetch( 'user', 'has_access_to', hash( 'module', 'openpa', 'function', 'editor_tools' ) )}
        <div class="alert alert-warning message-warning warning">
            Classe {$fieldsParts[0]} non trovata
        </div>
    {/if}
{elseif is_set($openpa.control_children.views['table'])}
    {include uri=$openpa.control_children.views['table'].template}
{/if}
