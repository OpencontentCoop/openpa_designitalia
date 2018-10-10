<a data-node="{$menu_item.item.node_id}"
   href="{if $menu_item.item.internal}{$menu_item.item.url|ezurl(no)}{else}{$menu_item.item.url}{/if}"
   {if $menu_item.item.target}target="{$menu_item.item.target}"{/if}
   title="Vai a {$menu_item.item.name|wash()}">
    {$menu_item.item.name|wash()}
</a>
