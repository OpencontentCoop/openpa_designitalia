<div class="content-related">

  <div class="openpa-widget nav-section">
      <h2 class="openpa-widget-title"><span><i class="fa fa-calendar-o"></i> Quando</span></h2>
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
      <h2 class="openpa-widget-title"><span><i class="fa fa-map-marker"></i> Dove</span></h2>
	<div class="openpa-widget-content">
      {if $node|has_attribute( 'indirizzo' )}
        <p class="Prose">{attribute_view_gui attribute=$node.data_map.indirizzo}</p>
      {/if}
      {if $node|has_attribute( 'luogo_svolgimento' )}
        <p class="Prose">{attribute_view_gui attribute=$node.data_map.luogo_svolgimento}</p>
      {/if}
      {if $node|has_attribute( 'comune' )}
        <p class="Prose">{attribute_view_gui attribute=$node.data_map.comune}</p>
      {/if}
      {if and( $node|has_attribute( 'indirizzo' )|not, $node|has_attribute( 'luogo_svolgimento' )|not, $node|has_attribute( 'comune' )|not, $node.data_map.geo.content.address|ne(''))}
        <p class="Prose">{$node.data_map.geo.content.address}</p>
      {/if}
      {if $node|has_attribute( 'geo' )}
        {attribute_view_gui attribute=$node.data_map.geo zoom=3 map_id=concat('event-',$node.data_map.geo.id)}
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
        <h2 class="openpa-widget-title"><span>Contatti</span></h2>
	  <div class="openpa-widget-content">
        <ul class="Linklist Linklist--padded u-layout-prose">
          {if $node|has_attribute( 'telefono' )}
            <li><a href="tel:{$node.data_map.telefono.content|wash}"><i class="fa fa-phone"></i>  {$node.data_map.telefono.content|wash}</a></li>
          {/if}
          {if $node|has_attribute( 'fax' )}
            <li><a href="tel:{$node.data_map.email.content|wash}"><i class="fa fa-fax"></i> {$node.data_map.fax.content|wash}</a></li>
          {/if}
          {if $node|has_attribute( 'email' )}
            <li><a href="mailto:{$node.data_map.fax.content|wash}"><i class="fa fa-envelope"></i> {$node.data_map.email.content|wash()}</a></li>
          {/if}
          {if $node|has_attribute( 'url' )}
            <li><a href="{$node.data_map.url.content|wash()}"><i class="fa fa-globe"></i> {$node.data_map.url.content|wash}</a></li>
          {/if}
        </ul>
      </div>
    </div>
  {/if}

  {def $classification = $openpa.content_related.classification}
  {if count($classification)|gt(0)}
    <div class="openpa-widget nav-section">
        <h2 class="openpa-widget-title"><span><i class="fa fa-info"></i> Informazioni</span></h2>
    <div class="openpa-widget-content">
        <ul class="Linklist Linklist--padded u-layout-prose">
          {foreach $classification as $className => $objects}
          <li>
            <strong>{$className}: </strong>
            {foreach $objects as $object}{node_view_gui content_node=$object.main_node view='text_linked'}{/foreach}
          </li>
          {/foreach}
        </ul>
      </div>
    </div>
  {/if}
  {undef $classification}

  {if $openpa.content_gallery.has_images}
    <div class="openpa-widget nav-section">
        <h2 class="openpa-widget-title"><span><i class="fa fa-camera"></i> {$openpa.content_gallery.title}</span></h2>
    <div class="openpa-widget-content">
        {include uri='design:atoms/gallery.tpl' items=$openpa.content_gallery.images title=false()}
      </div>
    </div>
  {/if}

  {if count($openpa.content_related.info)|gt(0)}
        <div class="openpa-widget nav-section">
            <h2 class="openpa-widget-title"><span>{'Related information'|i18n('openpa/sidebar')}</span></h2>
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
            <h2 class="openpa-widget-title"><span>{'Referable to'|i18n('openpa/sidebar')} {$node.name|wash()}</span></h2>
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
