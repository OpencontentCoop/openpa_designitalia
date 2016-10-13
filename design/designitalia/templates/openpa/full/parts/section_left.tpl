{*<div class="nav-section">

    {if count($tree_menu.children)|gt(0)}
    <div class="widget">
        {if and( $openpa.control_menu.side_menu.root_node, $node.node_id|ne($openpa.control_menu.side_menu.root_node.node_id) )}
        <div class="widget_title">
            <h3>{$openpa.control_menu.side_menu.root_node.name|wash()}</h3>
        </div>
        {/if}
        <div class="widget_content">
            <ul class="side_menu">
                {foreach $tree_menu.children as $menu_item}
                    {include name=side_menu uri='design:menu/side_menu_item.tpl' menu_item=$menu_item current_node=$node}
                {/foreach}
           </ul>
        </div>
    </div>
    {/if}
</div>*}

<div class="u-sizeFull u-md-size11of12 u-lg-size11of12 nav-section" id="subnav">
    {if count($tree_menu.children)|gt(0)}
        {if and( $openpa.control_menu.side_menu.root_node, $node.node_id|ne($openpa.control_menu.side_menu.root_node.node_id) )}
            <div class="u-background-50 u-padding-all-xs">
                <h4 class="u-text-h4 u-color-white">{$openpa.control_menu.side_menu.root_node.name|wash()}</h4>
            </div>
        {/if}
        <ul class="Linklist Linklist--padded u-layout-prose Treeview js-fr-treeview u-text-r-xs">
            {foreach $tree_menu.children as $menu_item}
                {include name=side_menu uri='design:menu/side_menu_item.tpl' menu_item=$menu_item current_node=$node}
            {/foreach}
        </ul>
    {/if}
</div>