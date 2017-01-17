{if $openpa.content_tools.editor_tools}
    {include uri=$openpa.content_tools.template}
{/if}

{def $tree_menu = tree_menu( hash( 'root_node_id', $openpa.control_menu.side_menu.root_node.node_id, 'user_hash', $openpa.control_menu.side_menu.user_hash, 'scope', 'side_menu' ))
     $show_left = and( $node.data_map.layout.has_content, $openpa.control_menu.show_side_menu, count( $tree_menu.children )|gt(0) )}

<div class="openpa-full class-{$node.class_identifier}">

    <div class="title">
        {include uri='design:openpa/full/parts/node_languages.tpl'}
        <h2 class="u-text-h2">{$node.name|wash()}</h2>
    </div>

    <div class="content-container">
        <div class="{if $node.data_map.layout.has_content}contentLayout{else}content{/if}{if or( $show_left, $openpa.control_menu.show_extra_menu )} withExtra{/if}">

            {if $node.data_map.layout.has_content}
                {attribute_view_gui attribute=$node.data_map.layout}
            {else}
                {include uri=$openpa.control_children.template}
            {/if}
        </div>

        {if or( $show_left, $openpa.control_menu.show_extra_menu )}
            {include uri='design:openpa/full/parts/section_left.tpl'}
        {/if}
    </div>
</div>
