{if $fields}
	{def $fieldsParts = $fields|explode( '|' )
       $class = api_class($fieldsParts[0]|trim())
       $identifiers = $fieldsParts[1]|explode( ',' )
       $depth = cond( is_set($fieldsParts[2]), $fieldsParts[2], false() )
       $currentLanguage = ezini('RegionalSettings','Locale')
       $depth_query_part = ''}

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
	  
	    {ezscript_require(array('jquery.dataTables.js', 'jquery.opendataDataTable.js', 'dataTables.bootstrap.js', 'dataTables.responsive.min.js', 'moment-with-locales.min.js', 'moment-timezone-with-data.js'))}
	    {ezcss_require(array('dataTables.bootstrap.css','responsive.dataTables.min.css'))}
	    
	    <script type="text/javascript" language="javascript" class="init">
	    moment.locale('it');
	    $(document).ready(function () {ldelim}
	      $('#container-{$node.node_id}').opendataDataTable({ldelim}
	        "builder":{ldelim}"query": '{$depth_query_part}classes [{$class.identifier}] subtree [{$node.node_id}]'{rdelim},
	        "table":{ldelim}
	          "id": 'trasparenza-{$node.node_id}',
	          "template": '<table class="table table-striped table-bordered display responsive no-wrap" cellspacing="0" width="100%"></table>'
	        {rdelim},
	        "datatable":{ldelim}          
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
	            {foreach $class_fields as $field}
	              {def $title = $field.name[$currentLanguage]}
	              {if is_set($field.matrix_column)}
	                {foreach $field['template']['format'][0][0] as $columnIdentifier => $columnName}
	                  {if $columnIdentifier|eq($field.matrix_column)}
	                    {set $title = concat( $title, $columnName|explode('string (')|implode(' (') )}
	                    {break}
	                  {/if}
	                {/foreach}
	              {/if}
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
	    
	    <div id="container-{$node.node_id}"></div>

	    {def $query = concat($depth_query_part, " classes [",$class.identifier,"] subtree [",$node.node_id,"]")|urlencode}
	    <div class="Callout Callout--could u-text-r-xs u-margin-top-m u-margin-bottom-m">
			<img style="vertical-align: middle" src="data:image/jpg;base64,/9j/4AAQSkZJRgABAQEASABIAAD/2wBDAAYEBAQFBAYFBQYJBgUGCQsIBgYICwwKCgsKCgwQDAwMDAwMEAwODxAPDgwTExQUExMcGxsbHCAgICAgICAgICD/2wBDAQcHBw0MDRgQEBgaFREVGiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICD/wAARCAASAGEDAREAAhEBAxEB/8QAGwAAAQUBAQAAAAAAAAAAAAAAAAEDBAUHAgb/xAA2EAABAwIDBAgEBQUAAAAAAAACAQMEBREABhITFCHRBxUWIjFBVZMyUVSUI0JW0tNSYWJxc//EABkBAQADAQEAAAAAAAAAAAAAAAABAgMEBf/EACcRAAICAQIFBQADAAAAAAAAAAABAhEDBBITITFRkRQVMkFhcYGh/9oADAMBAAIRAxEAPwDU8l5O6PzyDSqxWqYw488zd54hMjM9S+AhdSWyeCJi0YOTpEN0W0jKfRDHZivHS45BM1JG2bbzhEoJcu6Gok0+d04YusMn/RG9HT2T+iNmRFjrSo5uzR2kZGm3XdQXQdV29SIl1TiuIWGXgbkK5k7ohbCcZU2IiU00bnJY7tkVtN08eN+GHCly5deg3IrukDJuTcvZZeqdPoMJZLZtiO2AzCxmiLwQk8sa6XEsk6fQrllSsz+U3Jiwm5r+V6OMZ0BcA9kpLoP4TIEeUhFfmqY71o8Ddc7MHlmNvE6wy087likA28qCKqyV0Uvh2ibW7d/LXbErQ4X3HGmPSo8uLUAp7+V6MMtwdojaN6kQF/MRi8oin9yXELR4Gr50OLMhyZ7cV8mJGW6QDo+KbA14L4Kio7ZUXyVOGLrQYn3I48hrrmH+nqP9u5/JifbsX75I9RIOuYf6eo/27n8mHt2L98j1EibRnaXVJbsJ+hUxpsoktxHGGTBwTaYIwUSU18CT5Yw1OihDG5K7NMeZt0JvD/8AWuPKOk1TIlIWpdGmXNm7u8qKKSYjyjrEXRUxRSC46ksa8L40xz2/wyslZbLkOnON05qQ4TzMJ2RIdDiO1dk3UluKooohEqomNfUvn+1/hXhjtXyg3OrFPqDToMBADZjGVpVG2sT7ug29K923mmIx56i13EoWxioZEjTGqgm9E1InSd424CiKgLs7snx74Lsk8cWjqWq/EHjI3S3FlSskyWYrDkh1XWbNsgplbaJfujdcW0DSycyM/wATKagVdk09Y7WXZrMp6CzTZUlWnjQ2GC1Dpb0JpLUicbrj1YqKfyVXZyu+w/XKlm+sQZkF+izBjySjEyO7ufhbuGlUujaKev8AyXhiMcMcGna+/vuTKTf0NNyM0s1iRVI9DmNPvQ9zBN3cXQuyFpHOIKhfBeypidsNu1yXWyLd3RErjGaKxNbmP0eaLwx2Y5ru7neVkdOvgCImr5J4Ytj2QVWuvciVsr+z+YfSZ32zv7cacSPdeSu1h2fzD6TO+2d/bhxI915G1lrlij1mPVXXpFOlMMjBnanXWXABLxTtciRExy62cXifNGuFPcRceEdp4Q6rVGS2TMx9tseAgDhoKf6RFwAnXda+vk+6fPAB13Wvr5PunzwAdd1r6+T7p88ACV2tot0qElF/7Oc8Addoa/6lK99znhQDtDX/AFKV77nPCgHaGv8AqUr33OeFAO0Nf9Sle+5zwoB2hr/qUr33OeFAO0Nf9Sle+5zwoB17W3Pw3KhJMC4EBPOKip8lS+ANQ0D8kwB//9k="/>
			Ottieni questi contenuti in <a href={concat("exportas/custom/csv_trasparenza/", $query, "/",$node.node_id)|ezurl()}>formato <abbr title="Comma-separated values">CSV</abbr></a>, in <a href="{concat("/api/opendata/v2/content/search/",$query)}">formato <abbr title="JavaScript Object Notation">JSON</abbr></a>            
		</div>
		{undef $query}

	{elseif fetch( 'user', 'has_access_to', hash( 'module', 'openpa', 'function', 'editor_tools' ) )}
		<div class="alert alert-warning message-warning warning">
			Classe {$fieldsParts[0]} non trovata
		</div>
	{/if}
{/if}