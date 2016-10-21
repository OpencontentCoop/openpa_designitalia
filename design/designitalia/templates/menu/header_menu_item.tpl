{if $menu_item.item.internal}
    {def $href = $menu_item.item.url|ezurl(no)}
{else}
    {def $href = $menu_item.item.url}
{/if}

<a class="{if $current} current{/if}" href="{$href}" {if $menu_item.item.target}target="{$menu_item.item.target}"{/if} title="Vai a {$menu_item.item.name|wash()}">
    {$menu_item.item.name|wash()}
</a>

{undef $href}
