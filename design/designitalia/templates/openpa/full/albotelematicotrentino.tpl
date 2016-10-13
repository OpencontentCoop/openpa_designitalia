{if $openpa.content_tools.editor_tools}
    {include uri=$openpa.content_tools.template}
{/if}

{def $tree_menu = tree_menu( hash( 'root_node_id', $openpa.control_menu.side_menu.root_node.node_id, 'user_hash', $openpa.control_menu.side_menu.user_hash, 'scope', 'side_menu' ))
     $show_left = and( $openpa.control_menu.show_side_menu, count( $tree_menu.children )|gt(0) )}

<div class="u-layout-wide u-layoutCenter u-layout-withGutter u-padding-r-top content-view-full class-{$node.class_identifier} row">

    <div class="u-padding-bottom-l content-title">
        {include uri='design:openpa/full/parts/node_languages.tpl'}
        <h2 class="u-text-h2">{$node.name|wash()}</h2>
    </div>

    <div class="Grid Grid--withGutter">
        <div class="Grid-cell u-padding-bottom-xl{if $show_left|not() } u-sizeFull{else} u-md-size7of12 u-lg-size7of12{/if}">

          {if $node.data_map.page.has_content}
            {attribute_view_gui attribute=$node.data_map.page}
          {else}
            {include uri=$openpa.control_children.template}
          {/if}

        </div>

        {if $show_left}
            <div class="Grid-cell u-sizeFull u-md-size4of12 u-lg-size4of12 u-md-before1of12 u-lg-before1of12 u-padding-bottom-xl">
                {include uri='design:openpa/full/parts/section_left.tpl'}
                <a href="#" title="torna all'inizio del contenuto" class="u-hiddenVisually">torna all'inizio del contenuto</a>
            </div>
        {/if}
    </div>
</div>