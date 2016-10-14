{if $openpa.control_cache.no_cache}
    {set-block scope=root variable=cache_ttl}0{/set-block}
{/if}

{if $openpa.content_tools.editor_tools}
    {include uri=$openpa.content_tools.template}
{/if}

{if $openpa.control_menu.side_menu.root_node}
{def $tree_menu = tree_menu( hash( 'root_node_id', $openpa.control_menu.side_menu.root_node.node_id, 'user_hash', $openpa.control_menu.side_menu.user_hash, 'scope', 'side_menu' ))
     $show_left = and( $openpa.control_menu.show_side_menu, count( $tree_menu.children )|gt(0) )}
{else}
  {def $show_left = false()}
{/if}


{ezcss_require( array(    
    'dataTables.bootstrap.css'
))}
{ezscript_require(array(
    'ezjsc::jquery',
    'plugins/chosen.jquery.js',
    'moment.min.js',
    'jquery.dataTables.js',
    'dataTables.bootstrap.js',
    'jquery.opendataDataTable.js',
    'jquery.opendataTools.js'    
))}
<div class="content-view-full class-{$node.class_identifier}">
<script type="text/javascript" language="javascript" class="init">
    var mainQuery = "{concat( 'raw[', solr_meta_subfield('tipo_evento','id'), '] = ', $node.contentobject_id )}";
    
    console.log(mainQuery);
    {literal}
    
    var facets = [
        {field: 'raw[meta_class_name_ms]', 'limit': 300, 'sort': 'alpha', name: 'Tipologia di contenuto'}
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
                        "order": [[ 1, 'desc' ]],
                        "columns": [
                            {"data": "metadata.name."+tools.settings('language'), "name": 'name', "title": 'Titolo'},
                            {"data": "metadata.published", "name": 'published', "title": 'Data'},
                            {"data": "metadata.classIdentifier","name": 'class',"title": 'Tipologia'}
                        ],
                        "columnDefs": [
                            {
                              "render": function ( data, type, row ) {
                                return '<a href="/openpa/object/'+row.metadata.id+'">'+data+'</a>';
                              },
                              "targets": [0]
                            },
                            {          
                              "render": function ( data, type, row ) {              
                                var date = moment(data,moment.ISO_8601);            
                                return date.format('DD/MM/YYYY');
                                
                              },
                              "targets": [1]
                            },
                            {          
                              "render": function ( data, type, row ) {
                                return '<span data-class="'+data+'">'+data+'</span>';
                                
                              },
                              "targets": [2]
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
                .on( 'draw.dt', function () {
                  $('span[data-class]').each(function(){
                    tools.contentClass($(this).data('class'),function(response){
                      $('span[data-class="'+response.identifier+'"]').html(response.name[tools.settings('language')]);
                    }); 
                  });
                })
                .data('opendataDataTable');

        
        tools.find(mainQuery + ' limit 1', function(response){
            $('.spinner').hide();            
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
        label{font-weight: bold;}
        .form-group{margin-left:5px;}
    </style>
{/literal}

    <div class="u-padding-bottom-l content-title">
        {include uri='design:openpa/full/parts/node_languages.tpl'}
        <h2 class="u-text-h2">{$node.name|wash()}</h2>
    </div>

    <div class="Grid Grid--withGutter">
        <div class="Grid-cell u-padding-bottom-xl{if $show_left|not() } u-sizeFull{else} u-md-size7of12 u-lg-size7of12{/if}">

            {include uri=$openpa.content_main.template}

            {include uri=$openpa.content_detail.template}

            <div class="panel">
              <div class="spinner text-center col-md-12">
                <i class="fa fa-circle-o-notch fa-spin fa-3x fa-fw"></i>
                <span class="sr-only">Loading...</span>
              </div>
              <div class="content-filters" style="display: none"></div>
              <div class="content-data"></div>
            </div>
        </div>

        {if $show_left}
            <div class="Grid-cell u-sizeFull u-md-size4of12 u-lg-size4of12 u-md-before1of12 u-lg-before1of12 u-padding-bottom-xl">
                {include uri='design:openpa/full/parts/section_left.tpl'}
                <a href="#" title="torna all'inizio del contenuto" class="u-hiddenVisually">torna all'inizio del contenuto</a>
            </div>
        {/if}
    </div>
    {if $openpa.content_date.show_date}
        <div class="u-sizeFull u-margin-top-l">
            <p class="u-floatRight">{include uri=$openpa.content_date.template}</p>
        </div>
    {/if}
</div>
