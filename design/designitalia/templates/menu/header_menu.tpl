{if and( $pagedata.is_login_page|not(), array( 'edit', 'browse' )|contains( $ui_context )|not(), openpaini( 'TopMenu', 'ShowMegaMenu', 'enabled' )|eq('enabled') )}
    
{def $top_menu_node_ids = openpaini( 'TopMenu', 'NodiCustomMenu', array() )}
{def $top_menu_node_ids_count = $top_menu_node_ids|count()}

{def $main_styles = openpaini( 'Stili', 'Nodo_NomeStile', array() )}
{def $item_class = "no-main-style"}


<!-- Header-navbar -->
<div class="Headroom-hideme u-textCenter u-hidden u-sm-block u-md-block u-lg-block">
    {*<nav class="Megamenu Megamenu--styled js-megamenu" data-rel=".Offcanvas .Treeview"></nav>*}

    <nav class="Megamenu Megamenu--default js-megamenu">
        <ul class="Megamenu-list">
            {if $top_menu_node_ids_count}
                {foreach $top_menu_node_ids as $id}
                    {def $tree_menu = tree_menu( hash( 'root_node_id', $id, 'scope', 'top_menu'))}
                    <li class="Megamenu-item">
                        {include recursion=0
                                 name=top_menu
                                 uri='design:menu/header_menu_item.tpl'
                                 menu_item=$tree_menu}
                        {if $tree_menu.has_children}
                            {if $tree_menu.max_recursion|eq(1)}
                                <div class="Megamenu-subnav u-jsDisplayNone u-textCenter">
                                    {foreach $tree_menu.children as $child}
                                        <ul class="Megamenu-subnavGroup u-size1of4">
                                            <li>
                                                {include recursion=1
                                                         name="top_sub_menu"
                                                         uri='design:menu/header_menu_item.tpl'
                                                         menu_item=$child}
                                            </li>
                                        </ul>
                                    {/foreach}
                                </div>
                            {else}
                                <div class="Megamenu-subnav u-jsDisplayNone">
                                    {foreach $tree_menu.children as $child}
                                        <ul class="Megamenu-subnavGroup">
                                            <li>
                                                {include
                                                recursion=2
                                                name="top_sub_menu"
                                                uri='design:menu/header_menu_item.tpl'
                                                menu_item=$child}
                                                <ul>
                                                    {if $child.has_children}
                                                        {foreach $child.children as $sub_child}
                                                            <li>{include recursion=3
                                                                         name="top_sub_menu"
                                                                         uri='design:menu/header_menu_item.tpl'
                                                                         menu_item=$sub_child}
                                                            </li>
                                                        {/foreach}
                                                    {/if}
                                                </ul>
                                            </li>
                                        </ul>
                                    {/foreach}
                                </div>
                            {/if}
                        {/if}
                    </li>
                    {undef $tree_menu}
                {/foreach}
            {/if}
        </ul>
    </nav>
</div>
{/if}
