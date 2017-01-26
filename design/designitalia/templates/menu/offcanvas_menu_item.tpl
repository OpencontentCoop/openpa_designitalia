<a {*class="{if $current} current{/if}"*}{if $menu_item.has_children}class="has_children"{/if}
   href="{if $menu_item.item.internal}{$menu_item.item.url|ezurl(no)}{else}{$menu_item.item.url}{/if}"
        {if $menu_item.item.target}target="{$menu_item.item.target}"{/if}
   title="Vai a {$menu_item.item.name|wash()}">
    {*def $icon = $menu_item.item.node_id|fa_node_icon()}
    {if and( $icon, $recursion|eq(0) )}<span class="fa {$icon}" aria-hidden="true"></span>{/if}
    {undef $icon*}
    {$menu_item.item.name|wash()}
    {if $menu_item.has_children}
        <span class="menu-handler"></span>
    {/if}
</a>