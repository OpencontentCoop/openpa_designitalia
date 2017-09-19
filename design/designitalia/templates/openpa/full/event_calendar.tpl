{if $openpa.control_cache.no_cache}
    {set-block scope=root variable=cache_ttl}0{/set-block}
{/if}

{if $openpa.content_tools.editor_tools}
    {include uri=$openpa.content_tools.template}
{/if}

{def $tree_menu = tree_menu( hash( 'root_node_id', $openpa.control_menu.side_menu.root_node.node_id, 'user_hash', $openpa.control_menu.side_menu.user_hash, 'scope', 'side_menu' ))
     $show_left = and( $openpa.control_menu.show_side_menu, count( $tree_menu.children )|gt(0) )}

{def $_calendar_view = first_set( $openpa.control_children.views.calendar.current_view, 'calendar' )}
{if is_set( $view_parameters.view )}
    {set $_calendar_view = $view_parameters.view}
{/if}
{if $_calendar_view|eq('calendar')}
  {set $show_left=false()}
{/if}

{def $hide_tags = $node|attribute('hide_tags').content.tag_ids
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


            {*include uri=$openpa.content_main.template}

            {include uri=$openpa.control_children.views.calendar.template
                     current_calendar_view=$_calendar_view*}

            {include uri='design:agenda/parts/calendar/views.tpl' views=array('list','geo','agenda') view_all=$view_all}


            {include
                uri='design:agenda/parts/calendar/calendar.tpl'
                name=home_calendar
                calendar_identifier=site_identifier()
                filters=array('date', 'type', 'target', 'iniziativa')
                base_query=concat('classes [event] and subtree [', $node.node_id, '] and state sort [from_time=>asc]')
            }

        </div>
        {if $show_left}
          {include uri='design:openpa/full/parts/section_left.tpl'}
        {/if}  
    </div>
    {if $openpa.content_date.show_date}
        {include uri=$openpa.content_date.template}
    {/if}
</div>
