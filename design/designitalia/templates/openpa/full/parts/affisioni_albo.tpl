{ezscript_require(array('jquery.opendataTools.js', 'jquery.dataTables.js', 'jquery.opendataDataTable.js', 'dataTables.bootstrap.js', 'dataTables.responsive.min.js', 'moment-with-locales.min.js', 'moment-timezone-with-data.js', 'plugins/chosen.jquery.js'))}
{ezcss_require(array('dataTables.bootstrap.css','responsive.dataTables.min.css'))}

<div class="Grid Grid--withGutter">
  <div class="content-data Grid-cell u-sizeFull u-sm-size3of4 u-md-size4of5 u-lg-size4of5"></div>
  <div class="content-filters Grid-cell u-sizeFull u-sm-size1of4 u-md-size1of5 u-lg-size1of5" style="display: none"></div>
</div>


<script type="text/javascript" language="javascript" class="init">
    var mainQuery = "classes [affissione_albo]";
    {literal}
    var facets = [
        {field: 'anno_affissione', 'limit': 300, 'sort': 'alpha', name: 'Anno di affissione'},
        {field: 'tipo_atto', 'limit': 300, 'sort': 'alpha', name: 'Tipo di atto'},
        {field: 'anno_atto', 'limit': 300, 'sort': 'alpha', name: 'Anno dell\' atto'},
        {field: 'descrizione_settore_atto', 'limit': 300, 'sort': 'alpha', name: 'Struttura'}
    ];
    $(document).ready(function () {
        var tools = $.opendataTools;
        mainQuery += ' facets ['+tools.buildFacetsString(facets)+']';
        var datatable;
        datatable = $('.content-data').opendataDataTable({
            "builder":{
                "query": mainQuery
            },
            "datatable":{
                "ajax": {
                    url: "/opendata/api/datatable/search/"
                },
                "order": [[ 0, 'desc' ],[ 1, 'desc' ]],
                "columns": [
                    {"data": "data."+tools.settings('language')+".anno_affissione", "name": 'anno_affissione', "title": 'Anno Aff.'},
                    {"data": "data."+tools.settings('language')+".numero_affissione", "name": 'numero_affissione', "title": 'N.Aff.'},
                    {"data": "data."+tools.settings('language')+".tipo_atto", "name": 'tipo_atto', "title": 'Tipologia'},
                    {"data": "data."+tools.settings('language')+".oggetto_affissione", "name": 'oggetto_affissione', "title": 'Oggetto'}
                ],
                "columnDefs": [
                    {
                        "render": function ( data, type, row ) {
                            return '<a href="/content/view/full/'+row.metadata.mainNodeId+'">'+data+'</a>';
                        },
                        "targets": [3]
                    }
                ],
                "oLanguage": {
                    "sProcessing": "Caricamento",
                    "sLengthMenu": "_MENU_ elementi per pagina",
                    "sZeroRecords": "Oooops! Nessun risultato...",
                    "sInfo": "Da _START_ a _END_ di _TOTAL_ elementi",
                    "sInfoEmpty": "",
                    "sSearch": "Cerca",
                    "oPaginate": {
                        "sFirst":    "Primo",
                        "sPrevious": "Precedente",
                        "sNext":     "Successivo",
                        "sLast":     "Ultimo"
                    }
                }
            }
        })
        .on('xhr.dt', function ( e, settings, json, xhr ) {
            //console.log(datatable.settings.builder.filters);
            var builder = JSON.stringify({
                'builder': datatable.settings.builder,
                'query': datatable.buildQuery()
            });

            $.each(json.facets, function(index,val){
                var facet = this;
                tools.refreshFilterInput(facet, function(select){
                    select.trigger("chosen:updated");
                });
            });
        })
        .data('opendataDataTable');


        tools.find(mainQuery + ' limit 1', function(response){
            datatable.loadDataTable();
            var form = $('<form class="form-inline">');
            $.each(response.facets, function(){
                tools.buildFilterInput(facets, this, datatable, function(selectContainer){
                    form.append(selectContainer);
                });
            });
            $('.content-filters').append(form).show();
        });

    });

    {/literal}
</script>
{literal}
  <style>
    .chosen-search input, .chosen-container-multi input{height: auto !important;}
    .content-data .form-control{padding: 0};
  </style>
{/literal}
