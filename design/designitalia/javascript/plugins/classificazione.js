var initClassificazioneDatatable = function (mainQuery,facets) {
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

};
