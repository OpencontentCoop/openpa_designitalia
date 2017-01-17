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

<div class="openpa-full class-{$node.class_identifier}">
    <div class="title">
        {include uri='design:openpa/full/parts/node_languages.tpl'}
        <h2>{$node.name|wash()}</h2>
    </div>
    <div class="content-container">
        <div class="content{if $show_left} withExtra{/if}">

            {include uri=$openpa.content_main.template}

            {include uri=$openpa.control_children.views.calendar.template
                     current_calendar_view=$_calendar_view}

        </div>
        {if $show_left}
          {include uri='design:openpa/full/parts/section_left.tpl'}
        {/if}  
    </div>
    {if $openpa.content_date.show_date}
        {include uri=$openpa.content_date.template}
    {/if}
</div>
