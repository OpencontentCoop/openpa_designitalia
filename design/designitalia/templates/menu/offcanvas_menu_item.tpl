<a data-node="{$menu_item.item.node_id}" {if $menu_item.has_children}class="has_children"{/if}
   href="{if $menu_item.item.internal}{$menu_item.item.url|ezurl(no)}{else}{$menu_item.item.url}{/if}" {if $menu_item.item.target}target="{$menu_item.item.target}"{/if}
   title="Vai a {$menu_item.item.name|wash()}">
    {$menu_item.item.name|wash()}
    {if $menu_item.has_children}
        <span class="menu-handler"></span>
    {/if}
</a>