{if or($openpa.control_menu.show_extra_menu, $show_left, is_set($extra_template))}
    <div class="extra">
        {if or(is_set($extra_template), $openpa.control_menu.show_extra_menu)}            
			{if and(is_set($extra_template), $extra_template|ne(false()))}
                {include uri=$extra_template}
            {else}
                {include uri='design:openpa/full/parts/section_left_extra.tpl'}
            {/if}
        {/if}


        {if $show_left}
            <div class="nav-section" id="subnav">
                {if count($tree_menu.children)|gt(0)}
                    {if $openpa.control_menu.side_menu.root_node}
                        <h2 class="openpa-widget-title">
                            {if $node.node_id|ne($openpa.control_menu.side_menu.root_node.node_id)}
                                <a href="{$openpa.control_menu.side_menu.root_node.url_alias|ezurl(no)}">{$openpa.control_menu.side_menu.root_node.name|wash()}</a>
                            {else}
                                {$openpa.control_menu.side_menu.root_node.name|wash()}
                            {/if}
                        </h2>
                    {/if}
                    <ul class="Linklist Linklist--padded u-layout-prose Treeview js-fr-treeview u-text-r-xs">
                        {foreach $tree_menu.children as $menu_item}
                            {include name=side_menu uri='design:menu/side_menu_item.tpl' menu_item=$menu_item current_node=$node recursion=1}
                        {/foreach}
                    </ul>
                {/if}
            </div>
        {/if}

        {include uri='design:openpa/full/parts/back_to_main_content.tpl'}
    </div>
    {ezpagedata_set('has_sidemenu', true())}
{/if}

