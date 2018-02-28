{if $openpa.control_cache.no_cache}
  {set-block scope=root variable=cache_ttl}0{/set-block}
{/if}

{if $openpa.content_tools.editor_tools}
  {include uri=$openpa.content_tools.template}
{/if}

{def $curr_ts = currentdate()
     $curr_today = $curr_ts|datetime( custom, '%j')
     $curr_year =  $curr_ts|datetime( custom, '%Y')
     $curr_month = $curr_ts|datetime( custom, '%n')
     $today_ts = makedate( $curr_month, $curr_today, $curr_year )
     $contact_points = array()}


{if $node.data_map.has_contact_point.has_content}
  {foreach $node.data_map.has_contact_point.content.relation_list as $l}
    {def $contact_point = fetch( 'content', 'node', hash( 'node_id', $l.node_id ) )}
    {set $contact_points = $contact_points|append($contact_point)}
    {undef $contact_point}
  {/foreach}
{/if}




{if $openpa.control_menu.side_menu.root_node}
  {def $tree_menu = tree_menu( hash( 'root_node_id', $openpa.control_menu.side_menu.root_node.node_id, 'user_hash', $openpa.control_menu.side_menu.user_hash, 'scope', 'side_menu' ))
  $show_left = and( $openpa.control_menu.show_side_menu, count( $tree_menu.children )|gt(0) )}
{else}
  {def $show_left = false()}
{/if}

{def $extra_template = 'design:openpa/full/parts/section_left/sede.tpl'}

<div class="openpa-full class-{$node.class_identifier}">
  <div class="title">
    {include uri='design:openpa/full/parts/node_languages.tpl'}
    <h2>{$node.name|wash()}</h2>
  </div>
  <div class="content-container">
    <div class="content{if or( $show_left, $openpa.control_menu.show_extra_menu )} withExtra{/if}">

      {include uri=$openpa.content_main.template}

      {if $contact_points|count()|gt(0)}
        <h3 class="u-text-h3"> Contatti</h3>
        <div class="Alert Alert--info u-margin-bottom-l">
          <table class="Table Table--compact u-layout-prose" cellspacing="0">
            <tr>
              {foreach $contact_points as $c}
                <td class="u-size1of4">
                  <strong>{$c.data_map.tipologia.content.keyword_string}</strong>
                </td>
                <td>
                  {if $c.data_map.pec.has_content}<p>{$c.data_map.pec.contentclass_attribute.name}: <strong>{attribute_view_gui attribute=$c.data_map.pec}</strong></p>{/if}
                  {if $c.data_map.fax.has_content}<p>{$c.data_map.fax.contentclass_attribute.name}: <strong>{attribute_view_gui attribute=$c.data_map.fax}</strong></p>{/if}
                  {if $c.data_map.telefono.has_content}<p>{$c.data_map.telefono.contentclass_attribute.name}: <strong>{attribute_view_gui attribute=$c.data_map.telefono}</strong></p>{/if}
                  {if $c.data_map.cellulare.has_content}<p>{$c.data_map.cellulare.contentclass_attribute.name}: <strong>{attribute_view_gui attribute=$c.data_map.cellulare}</strong></p>{/if}
                  {if $c.data_map.sito_web.has_content}<p>{$c.data_map.sito_web.contentclass_attribute.name}: <strong>{attribute_view_gui attribute=$c.data_map.sito_web}</strong></p>{/if}
                </td>
              {/foreach}

            </tr>
          </table>
        </div>
      {/if}

      {include uri=$openpa.content_contacts.template}

      {include uri=$openpa.content_detail.template}

      {include uri=$openpa.content_infocollection.template}

      <div class="Prose">
        {* Orari di apertura *}
        {if $contact_points|count()|gt(0)}
          <h3 class="u-text-h3"><i class="fa fa-clock-o"></i> Orari di apertura</h3>
          {foreach $contact_points as $contact_point}
            <strong>{$contact_point.data_map.tipologia.content.keyword_string}</strong>
            {foreach $contact_point.data_map.opening_hours.content.relation_list as $o}
              {def $hour = fetch( 'content', 'node', hash( 'node_id', $o.node_id ) )}
              {* Verifico la validità degli orari*}
              {*{$hour.data_map.valido_dal.content.timestamp} ------ {$curr_ts} ----- {$hour.data_map.valido_al.content.timestamp}<br />
              {$hour.data_map.valido_dal.has_content|attribute(show)}*}
              {*if or (
                    and( $curr_ts|gt($hour.data_map.valido_dal.content.timestamp), $curr_ts|lt($hour.data_map.valido_al.content.timestamp) ),
                    and( $hour.data_map.valido_dal.has_content|not(), $curr_ts|lt($hour.data_map.valido_al.content.timestamp) ),
                    and( $curr_ts|gt($hour.data_map.valido_dal.content.timestamp), $hour.data_map.valido_al.has_content|not()),
                 )*}
              {if and( $curr_ts|gt($hour.data_map.valido_dal.content.timestamp), $curr_ts|lt($hour.data_map.valido_al.content.timestamp) )}
                {attribute_view_gui attribute=$hour.data_map.orari_di_apertura}
              {/if}
              {undef $hour}
            {/foreach}
          {/foreach}
        {/if}

        {* Eventi nella sede *}
        {*{def $upcoming_events = fetch( 'content', 'list',
            hash( 'parent_node_id', 2,
            'limit', 3,
            'depth', 3,
            'sort_by', array( 'attribute', true(), 'event/from_time'),
            'main_node_only', true(),
            'class_filter_type', 'include',
            'class_filter_array', array( 'event' ),
            'attribute_filter', array(
              'and',
              concat('submeta_site___id____si:', $node.contentobject_id),
              array(
                'or',
                array( 'event/from_time', '>=', $curr_ts ),
                array( 'event/to_time', '>=', $curr_ts )
              )
            ) ) ) }*}

        {def $upcoming_events = fetch( 'ezfind', 'search', hash(
          'class_id', array( 'event' ),
          'filter', array(
            'and',
            concat( 'submeta_site___id____si:', $node.contentobject_id )
            array(
              'or',
              'event/from_time:[NOW TO *]',
              'event/to_time:[NOW TO *]',
            )
          ),
          'sort_by', hash( 'event/from_time', 'asc' ),
          'limit', 3
        ) )}

        {if $upcoming_events.SearchCount|gt(0)}
          <h3 class="u-text-h3 u-margin-top-m"><i class="fa fa-calendar" aria-hidden="true"></i> Eventi in questa sede</h3>
          <div class="u-layout-prose">
            {foreach $upcoming_events.SearchResult as $e}
              {node_view_gui view='panel' content_node=$e}
            {/foreach}
          </div>
        {/if}
      </div>

    </div>

    {include uri='design:openpa/full/parts/section_left.tpl' extra_template=$extra_template}
  </div>
  {if $openpa.content_date.show_date}
    {include uri=$openpa.content_date.template}
  {/if}
</div>



