{if $openpa.content_tools.editor_tools}
    {include uri=$openpa.content_tools.template}
{/if}

{def $side_menu_root_node = $openpa.control_menu.side_menu.root_node
     $show_left = false()}

{if $side_menu_root_node}
  {def $tree_menu = tree_menu( hash( 'root_node_id', $side_menu_root_node.node_id, 'user_hash', $openpa.control_menu.side_menu.user_hash, 'scope', 'side_menu' ))}
  {set $show_left = and( $openpa.control_menu.show_side_menu, count( $tree_menu.children )|gt(0) )}
{/if}

<div class="openpa-full class-{$node.class_identifier}">
    <div class="openpa-title">
        {include uri='design:openpa/full/parts/node_languages.tpl'}
        <h2>{$node.name|wash()}</h2>
    </div>
    <div class="openpa-content-container">
        <div class="openpa-content{if or( $show_left, $openpa.control_menu.show_extra_menu )}-wide{/if}">

            {if $node.data_map.page.has_content}
                {attribute_view_gui attribute=$node.data_map.page}
            {else}
                {include uri=$openpa.control_children.template}
            {/if}

        </div>

        {include uri='design:openpa/full/parts/section_left.tpl'}
    </div>
    {if $openpa.content_date.show_date}
        {include uri=$openpa.content_date.template}
    {/if}
</div>
