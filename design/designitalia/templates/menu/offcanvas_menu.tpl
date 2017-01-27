{def $top_menu_node_ids = openpaini( 'TopMenu', 'NodiCustomMenu', array() )}
{def $top_menu_node_ids_count = $top_menu_node_ids|count()}

{def $main_styles = openpaini( 'Stili', 'Nodo_NomeStile', array() )}
{def $item_class = "no-main-style"}

<section class="Offcanvas Offcanvas--left Offcanvas--modal js-fr-offcanvas u-jsVisibilityHidden u-nojsDisplayNone" id="menu">
    <h2 class="u-hiddenVisually">Menu di navigazione</h2>
    <div class="Offcanvas-content u-background-white">
        <div class="Offcanvas-toggleContainer u-background-70 u-jsHidden">
            <a class="Hamburger-toggleContainer u-block u-color-white u-padding-bottom-xxl u-padding-left-s u-padding-top-xxl js-fr-offcanvas-close"
               aria-controls="menu" aria-label="esci dalla navigazione" title="esci dalla navigazione" href="#">
                <span class="Hamburger-toggle is-active" aria-hidden="true"></span>
            </a>
        </div>
        <nav>
            <ul class="Linklist Linklist--padded Treeview js-fr-treeview u-text-r-xs">

                {*<li class="toplevel firstli {if $current_node_id|eq(ezini( 'NodeSettings', 'RootNode', 'content.ini' ))}current{/if}">
                    <a title="Link a homepage" href={'/'|ezurl()}>
                        <span class="glyphicon glyphicon-heart" aria-hidden="true"></span> Home
                    </a>
                </li>*}

                {if $top_menu_node_ids_count}
                    {foreach $top_menu_node_ids as $id}
                        {def $tree_menu = tree_menu( hash( 'root_node_id', $id, 'scope', 'top_menu'))}

                        {*set $item_class = "no-main-style"}
                        {foreach $main_styles as $style}
                            {set $style = $style|explode(';')}
                            {if $style[0]|eq($tree_menu.item.node_id)}
                                {set $item_class =  $style[1]|slugize()}
                                {break}
                            {/if}
                        {/foreach*}

                        <li>
                            {include
                            recursion=0
                            name=top_menu
                            uri='design:menu/offcanvas_menu_item.tpl'
                            menu_item=$tree_menu current=or($tree_menu.item.node_id|eq($current_node_id), $pagedata.path_id_array|contains($tree_menu.item.node_id))}
                            {if $tree_menu.has_children}
                                {if $tree_menu.max_recursion|eq(1)}
                                    <ul>
                                        {foreach $tree_menu.children as $child}
                                            <li>
                                                {include
                                                    recursion=1
                                                    name="top_sub_menu" uri='design:menu/offcanvas_menu_item.tpl'
                                                    menu_item=$child
                                                    current=or($tree_menu.item.node_id|eq($current_node_id), $pagedata.path_id_array|contains($tree_menu.item.node_id))}
                                            </li>
                                        {/foreach}
                                    </ul>
                                {else}
                                    <ul>
                                        {foreach $tree_menu.children as $child}
                                            <li>
                                                {include
                                                        recursion=2
                                                        name="top_sub_menu"
                                                        uri='design:menu/offcanvas_menu_item.tpl'
                                                        menu_item=$child
                                                        current=or($tree_menu.item.node_id|eq($current_node_id), $pagedata.path_id_array|contains($tree_menu.item.node_id))}
                                                {if $child.has_children}
                                                    <ul>
                                                        {foreach $child.children as $sub_child}
                                                            <li>{include
                                                                    recursion=3
                                                                    name="top_sub_menu"
                                                                    uri='design:menu/offcanvas_menu_item.tpl'
                                                                    menu_item=$sub_child
                                                                    current=or($tree_menu.item.node_id|eq($current_node_id), $pagedata.path_id_array|contains($tree_menu.item.node_id))}
                                                            </li>
                                                        {/foreach}
                                                    </ul>
                                                {/if}
                                            </li>
                                        {/foreach}
                                    </ul>
                                {/if}
                            {/if}
                        </li>
                        {undef $tree_menu}
                    {/foreach}
                {/if}

            </ul>

        </nav>
    </div>
</section>
