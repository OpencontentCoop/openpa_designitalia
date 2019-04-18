{if $openpa.content_tools.editor_tools}
    {include uri=$openpa.content_tools.template}
{/if}

{def $tree_menu = tree_menu( hash( 'root_node_id', $openpa.control_menu.side_menu.root_node.node_id, 'user_hash', $openpa.control_menu.side_menu.user_hash, 'scope', 'side_menu' ))
     $show_left = and( $openpa.control_menu.show_side_menu, count( $tree_menu.children )|gt(0) )}

{def $current_view = first_set( $openpa.control_children.views.calendar.current_view, 'calendar' )}
{if is_set( $view_parameters.view )}
    {set $current_view = $view_parameters.view}
{/if}
{if $current_view|eq('calendar')}
    {set $current_view = 'agenda'}
{/if}
{if $current_view|eq('program')}
    {set $current_view = 'list'}
{/if}
{if $current_view|eq('calendar')}
  {set $show_left = false()}
{/if}

{def $hide_tags = cond($node|has_attribute('hide_tags'), $node|attribute('hide_tags').content.tag_ids, array())
     $hide_iniziative = array()
     $view_all = false()}

{if $node|has_attribute('hide_tags')}
    {set $hide_tags = $node|attribute('hide_tags').content.tag_ids}
{/if}
{if $node|has_attribute('hide_iniziative')}
    {foreach $node|attribute('hide_iniziative').content.relation_list as $item}
        {set $hide_iniziative = $hide_iniziative|append($item.contentobject_id)}
    {/foreach}
{/if}
{if $node|has_attribute('view_all')}
    {set $view_all = cond($node.data_map.view_all.data_int|eq(1), true(), false())}
{/if}

<div class="openpa-full class-{$node.class_identifier}">
    <div class="title">
        {include uri='design:openpa/full/parts/node_languages.tpl'}
        <h2>{$node.name|wash()}</h2>
    </div>
    <div class="content-container">
        <div class="content{if $show_left} withExtra{/if}">

            {include uri=$openpa.content_main.template}

            {def $agenda_view = openpaini('ViewSettings', 'DefaultAgendaView', "month")}
            {if $node|has_attribute('default_agenda_view')}
                {set $agenda_view = $node|attribute('default_agenda_view').content}
            {/if}

            {include uri='design:agenda/parts/calendar/views.tpl' views=array('list','agenda') view_all=$view_all current_view=$current_view default_agenda_view=$agenda_view}

            {def $base_query_subtree = array($node.node_id)}
            {if and($node|has_attribute('subtree_array'), $node|attribute('subtree_array').data_type_string|eq('ezobjectrelationlist'))}
                {foreach $node|attribute('subtree_array').content.relation_list as $item}
                    {if and(is_set($item.node_id), $item.node_id|gt(0))}
                        {set $base_query_subtree = $base_query_subtree|append($item.node_id)}
                    {/if}
                {/foreach}
            {elseif and($node|has_attribute('subtree'), $node|attribute('subtree').data_type_string|eq('ezobjectrelation'))}
                {def $item = $node|attribute('subtree').content}
                {if and(is_set($item.main_node_id), $item.main_node_id|gt(0))}
                    {set $base_query_subtree = $base_query_subtree|append($item.main_node_id)}
                {/if}
                {undef $item}
            {/if}

            {include uri = 'design:agenda/parts/calendar/calendar.tpl'
                     name = home_calendar
                     calendar_identifier = concat(site_identifier(), $node.contentobject_id)
                     filters = array('date')
                     base_query = concat('classes [event] and subtree [', $base_query_subtree|implode(','), '] and state sort [from_time=>asc]')}

        </div>
        {if $show_left}
          {include uri='design:openpa/full/parts/section_left.tpl'}
        {/if}
    </div>
    {if $openpa.content_date.show_date}
        {include uri=$openpa.content_date.template}
    {/if}
</div>
