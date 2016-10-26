{if $openpa.content_tools.editor_tools}
    {include uri=$openpa.content_tools.template}
{/if}

{def $top_menu_node_ids = openpaini( 'TopMenu', 'NodiCustomMenu', array() )}

<div class="openpa-full class-{$node.class_identifier}">
    <div class="title">
        {include uri='design:openpa/full/parts/node_languages.tpl'}
        <h2>{$node.name|wash()}</h2>
    </div>
    <div class="content-container">
        <div class="content">
            {def $show_content = true()}
            {if $top_menu_node_ids|contains($node.node_id)}
                {def $tree_menu = tree_menu( hash( 'root_node_id', $node.node_id, 'scope', 'top_menu'))}
                {if $tree_menu.has_children}
                    {set $show_content = false()}
                    <section class="Leads u-margin-bottom-l">
                        <ul class="Grid Grid--withGutter">
                            {foreach $tree_menu.children as $menu_item}

                                {def $count = $tree_menu.children|count()}

                                {if $count|gt(4)}
                                    {set $count = 4}
                                {/if}
                                <li class="Leads-item Grid-cell u-md-size1of{$count} u-lg-size1of{$count}">
                                    <a class="Leads-link u-border-top-l"
                                       href="{if $menu_item.item.internal}{$menu_item.item.url|ezurl(no)}{else}{$menu_item.item.url}{/if}"
                                       {if $menu_item.item.target}target="{$menu_item.item.target}"{/if}
                                       title="Vai a {$menu_item.item.name|wash()}">
                                        {$menu_item.item.name|wash()}
                                    </a>
                                    {if $menu_item.has_children}
                                        <ul class="Prose u-padding-bottom-xl">
                                            {foreach $menu_item.children as $sub_menu_item}
                                                <li>
                                                    <a href="{if $sub_menu_item.item.internal}{$sub_menu_item.item.url|ezurl(no)}{else}{$sub_menu_item.item.url}{/if}"
                                                       {if $sub_menu_item.item.target}target="{$sub_menu_item.item.target}"{/if}
                                                       title="Vai a {$sub_menu_item.item.name|wash()}">
                                                        {$sub_menu_item.item.name|wash()}
                                                    </a>
                                                </li>
                                            {/foreach}
                                        </ul>
                                    {/if}
                                </li>
                                {undef $count}
                            {/foreach}
                        </ul>
                    </section>
                {/if}
            {/if}

            {if $node.data_map.page.has_content}
                {attribute_view_gui attribute=$node.data_map.page}
            {elseif $show_content}
                {include uri=$openpa.control_children.template}
            {/if}
        </div>
    </div>
    {if $openpa.content_date.show_date}
        {include uri=$openpa.content_date.template}
    {/if}
</div>
