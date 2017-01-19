<div class="content-related">
  
  <div class="openpa-widget nav-section">
	<h2 class="openpa-widget-title"><i class="fa fa-calendar-o"></i> Quando</h2>
	<div class="openpa-widget-content">
       
        {if $node|has_attribute( 'periodo_svolgimento' )}
          <p class="Prose">
            <strong>{$node.data_map.periodo_svolgimento.contentclass_attribute_name}</strong>
            {attribute_view_gui attribute=$node.data_map.periodo_svolgimento}
          </p>
        {else}
          <p class="Prose">
           {include uri='design:atoms/dates.tpl' item=$node}
          </p>
        {/if}
                
        {if $node|has_attribute( 'orario_svolgimento' )}
          <p class="Prose">
            <strong>{$node.data_map.orario_svolgimento.contentclass_attribute_name}</strong>
            {attribute_view_gui attribute=$node.data_map.orario_svolgimento}
          </p>        
        {/if}
        
        {if $node|has_attribute( 'durata' )}
          <p class="Prose">
            <strong>{$node.data_map.durata.contentclass_attribute_name}</strong>
            {attribute_view_gui attribute=$node.data_map.durata}
          </p>        
        {/if}
        
        {if $node|has_attribute( 'iniziativa' )}
        <div class="well well-sm">
          parte di:{attribute_view_gui attribute=$node|attribute( 'iniziativa' ) show_link=true()}
        </div>
        {/if}
    </div>
  </div>
  
  {if or($node|has_attribute( 'indirizzo' ),
          $node|has_attribute( 'luogo_svolgimento' ),
          $node|has_attribute( 'comune' ),
          $node|has_attribute( 'geo' )
    )}

  
  <div class="openpa-widget nav-section">
	<h2 class="openpa-widget-title"><i class="fa fa-map-marker"></i> Dove</h2>
	<div class="openpa-widget-content">
      {if $node|has_attribute( 'indirizzo' )}
        <p class="Prose">{attribute_view_gui attribute=$node.data_map.indirizzo}</p>
      {/if}
      {if $node|has_attribute( 'luogo_svolgimento' )}
        <p class="Prose">{attribute_view_gui attribute=$node.data_map.luogo_svolgimento}</p>
      {/if}
      {if $node|has_attribute( 'comune' )}
        {*if $node|has_attribute( 'cap' )}
          {attribute_view_gui attribute=$node.data_map.cap}
        {/if*}
        <p class="Prose">{attribute_view_gui attribute=$node.data_map.comune}</p>
      {/if}
      {if $node|has_attribute( 'geo' )}
        {attribute_view_gui attribute=$node.data_map.geo zoom=3}        
      {/if}
    </div>
  </div>

  {/if}

  {if or($node|has_attribute( 'url' ),
        $node|has_attribute( 'email' ),
        $node|has_attribute( 'telefono' ),
        $node|has_attribute( 'fax' )
  )}
    <div class="openpa-widget nav-section">
	  <h2 class="openpa-widget-title">Contatti</h2>
	  <div class="openpa-widget-content">
        <ul class="list-group">
          {if $node|has_attribute( 'telefono' )}
            <li class="list-group-item"><i class="fa fa-phone"></i> {attribute_view_gui attribute=$node.data_map.telefono}</li>
          {/if}
          {if $node|has_attribute( 'fax' )}
            <li class="list-group-item"><i class="fa fa-fax"></i> {attribute_view_gui attribute=$node.data_map.fax}</li>
          {/if}
          {if $node|has_attribute( 'email' )}
            <li class="list-group-item"><i class="fa fa-envelope"></i> {attribute_view_gui attribute=$node.data_map.email}</li>
          {/if}
          {if $node|has_attribute( 'url' )}
            <li class="list-group-item"><i class="fa fa-globe"></i> {attribute_view_gui attribute=$node.data_map.url}</li>
          {/if}
        </ul>
      </div>
    </div>        
  {/if}
  
  {def $classification = $openpa.content_related.classification}
  {if count($classification)|gt(0)}  
    <div class="openpa-widget nav-section">
	  <h2 class="openpa-widget-title"><i class="fa fa-info"></i> Informazioni</h2>    
    <div class="openpa-widget-content">
        <ul class="list-unstyled">
          {foreach $classification as $className => $objects}
          <li>
            <strong>{$className}: </strong>
            {foreach $objects as $object}{node_view_gui content_node=$object.main_node view='text_linked'}{delimiter}, {/delimiter}{/foreach}            
          </li>
          {/foreach}
        </ul>
      </div>
    </div>
  {/if}
  {undef $classification}

  {if $openpa.content_gallery.has_images}
    <div class="openpa-widget nav-section">
	  <h2 class="openpa-widget-title"><i class="fa fa-camera"></i> {$openpa.content_gallery.title}</h2>
    <div class="openpa-widget-content">
        {include uri='design:atoms/gallery.tpl' items=$openpa.content_gallery.images title=false()}
      </div>
    </div>
  {/if}
  
  {if count($openpa.content_related.info)|gt(0)}
        <div class="openpa-widget nav-section">
            <h2 class="openpa-widget-title">Informazioni correlate</h2>
            <div class="openpa-widget-content">
                {foreach $openpa.content_related.info as $class_name => $infos}
                    <ul class="Linklist Linklist--padded u-layout-prose">
                        {foreach $infos as $info}
                            <li>
                                {node_view_gui content_node=$info view=text_linked}
                            </li>
                        {/foreach}
                    </ul>
                {/foreach}
            </div>
        </div>
    {/if}


    {if $openpa.content_facets.has_data}
        <div class="openpa-widget nav-section">
            <h2 class="openpa-widget-title">Riferibili a {$node.name|wash()}</h2>
            <div class="openpa-widget-content">
                {foreach $openpa.content_facets.items as $item}
                    <ul class="Linklist Linklist--padded u-layout-prose">
                        {foreach $item as $data}
                            <li>
                                <a href="{concat( "content/advancedsearch?Data[",$data.attribute_identifier,"][]=", $node.contentobject_id|urlencode, '&ClassArray[]=', $data.class_id)|ezurl(no)}"
                                   title="Link a {$data.class_name|wash}">{$data.class_name|wash} {if count($item)|gt(1)}
                                        <small>{$data.attribute_name}</small>{/if} <span
                                            class="badge">{$data.value}</span></a>
                            </li>
                        {/foreach}
                    </ul>
                {/foreach}
            </div>
        </div>
    {/if}
  
  {if $openpa.content_globalinfo.has_content}        
    <div class="data_map_layout nav-section">
		{attribute_view_gui attribute=$openpa.content_globalinfo.object.data_map.page}
	</div>
  {/if}
  
</div>