{def $href = '#'}
{if $recursion|gt(0)}
    {if $menu_item.item.internal}
        {set $href = $menu_item.item.url|ezurl(no)}
    {else}
        {set $href = $menu_item.item.url}
    {/if}
{/if}


<a class="{if $current} current{/if}" href="{$href}" {if $menu_item.item.target}target="{$menu_item.item.target}"{/if} title="Vai a {$menu_item.item.name|wash()}">
    {$menu_item.item.name|wash()}
</a>

{undef $href}