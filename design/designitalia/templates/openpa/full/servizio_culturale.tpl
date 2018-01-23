{if $openpa.control_cache.no_cache}
  {set-block scope=root variable=cache_ttl}0{/set-block}
{/if}

{if $openpa.content_tools.editor_tools}
  {include uri=$openpa.content_tools.template}
{/if}

{def $contact_points = array()}


{if $node.data_map.contact_point.has_content}
  {foreach $node.data_map.contact_point.content.relation_list as $l}
    {def $contact_point = fetch( 'content', 'node', hash( 'node_id', $l.node_id ) )}
    {set $contact_points = $contact_points|append($contact_point)}
    {undef $contact_point}
  {/foreach}
{/if}

{def $tree_menu = tree_menu( hash( 'root_node_id', $openpa.control_menu.side_menu.root_node.node_id, 'user_hash', $openpa.control_menu.side_menu.user_hash, 'scope', 'side_menu' ))
$show_left = and( $openpa.control_menu.show_side_menu, count( $tree_menu.children )|gt(0) )}

<div class="openpa-full class-{$node.class_identifier}">
  <div class="title">
    {include uri='design:openpa/full/parts/node_languages.tpl'}
    <h2>{$node.name|wash()}</h2>
  </div>
  <div class="content-container">
    <div class="content{if or( $show_left, $openpa.control_menu.show_extra_menu )} withExtra{/if}">

      {include uri=$openpa.content_main.template}

      {include uri=$openpa.content_contacts.template}

      {include uri=$openpa.content_detail.template}

      {include uri=$openpa.content_infocollection.template}

      {include uri='design:parts/posizione_in_organigramma.tpl'}

      {include uri=$openpa.control_children.template}

      {if $contact_points|count()|gt(0)}
        {def $sites = array()}
        {foreach $contact_points as $contact_point}
          {def $search_reverse_related = fetch('ezfind','search', hash('limit',20,'filter',array(concat("sede/has_contact_point/id:",$contact_point.object.id))))
          $objects = $search_reverse_related.SearchResult
          $objects_count = $search_reverse_related.SearchCount}

          {if $objects_count|gt(0)}
            {foreach $objects as $object}
              {if $object.can_read}
                {set $sites = $sites|append($object.contentobject_id)}
              {/if}
            {/foreach}
          {/if}
        {/foreach}


        {if $sites|count()|gt(0)}
            <h3 class="u-text-h3"><i class="fa fa-map" aria-hidden="true"></i> Dove usufruire del servizio</h3>



        {ezscript_require( array(
        'leaflet/leaflet.0.7.2.js',
        'ezjsc::jquery',
        'leaflet/leaflet.markercluster.js',
        'leaflet/Leaflet.MakiMarkers.js',
        ) )}
        {ezcss_require( array( 'plugins/leaflet/leaflet.css', 'plugins/leaflet/map.css', 'MarkerCluster.css', 'MarkerCluster.Default.css' ) )}

        {set_defaults(hash(
        'height', 600,
        'map_type', 'osm',
        'class_identifiers', array(),
        'items_per_row', 1,
        'show_list', true()
      ))}

        {set $height = $height|fix_dimension()}

        <div id="map" class="Grid">
          <div class="Grid-cell {if $show_list}{if $items_per_row|eq(1)}u-sizeFull{else} u-md-size3of4 u-lg-size3of4{/if}{else}u-sizeFull{/if}">
            <div id="map-{$node.node_id}" style="height: {$height}px; width: 100%"></div>

            <script>
              {run-once}
              {literal}
              function fixedEncodeURIComponent(str) {
                return encodeURIComponent(str).replace(/[!'()*]/g, function (c) {
                  return '%' + c.charCodeAt(0).toString(16);
                });
              }
              var loadMap = function(mapId,markersId,geoJson){
                geoJson = encodeURI(geoJson);
                var tiles = L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {maxZoom: 18,attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'});
                var map = L.map(mapId).addLayer(tiles);
                map.scrollWheelZoom.disable();
                var markers = L.markerClusterGroup();
                var markerMap = {};
                $.getJSON(geoJson, function(data) {
                  $.each(data.features, function(i,v){
                    var markerListItem = $("<li data-id='"+v.id+"'><a href='#map'><i class='fa fa-map-marker' aria-hidden='true'></i> "+v.properties.name+"</a></li>");
                    markerListItem.bind('click',markerListClick);
                    $('#'+markersId).append(markerListItem);
                  });
                  var geoJsonLayer = L.geoJson(data, { pointToLayer: function (feature, latlng) {
                    var customIcon = L.MakiMarkers.icon({icon: "star", color: "#f00", size: "l"});
                    var marker = L.marker(latlng, {icon: customIcon});
                    markerMap[feature.id] = marker;
                    return marker;
                  } });
                  markers.addLayer(geoJsonLayer);
                  map.addLayer(markers);
                  map.fitBounds(markers.getBounds());
                });
                markers.on('click', function (a) {
                  $.getJSON("{/literal}{'/openpa/data/map_markers'|ezurl(no)}{literal}?contentType=marker&view=panel&id="+a.layer.feature.id, function(data) {
                    var popup = new L.Popup({maxHeight:360});
                    popup.setLatLng(a.layer.getLatLng());
                    popup.setContent(data.content);
                    map.openPopup(popup);
                  });
                });
                markerListClick = function(e){
                  var id = $(e.currentTarget).data('id');
                  var m = markerMap[id];
                  markers.zoomToShowLayer(m, function() { m.fire('click');});
                  //e.preventDefault();
                }
              };
              {/literal}
              {/run-once}
              loadMap('map-{$node.node_id}', 'markers-{$node.node_id}', "{concat('/api/opendata/v2/geo/search/'|ezurl(no), '/id in [', $sites|implode(',') ,'] and classes[sede]')}");
            </script>
          </div>

          {if $show_list}
            <div class="Grid-cell {if $items_per_row|eq(1)}u-sizeFull{else}u-md-size1of4 u-lg-size1of4{/if}">
              <ul id="markers-{$node.node_id}" class="Linklist Linklist--padded"{if $items_per_row|gt(1)} style="height: {$height}px;overflow-y: auto"{/if}></ul>
            </div>
          {/if}

        </div>
        {/if}


      {/if}

    </div>

    {include uri='design:openpa/full/parts/section_left.tpl'}
  </div>
  {if $openpa.content_date.show_date}
    {include uri=$openpa.content_date.template}
  {/if}
</div>
