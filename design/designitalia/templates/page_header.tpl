<header class="Header Headroom--fixed">
    {include uri='design:header/service.tpl'}
    {include uri='design:header/navigation.tpl'}
    {if and( or($pagedata.is_homepage, is_area_tematica()), array( 'edit', 'browse' )|contains( $ui_context )|not() )}
        {include uri='design:header/banner.tpl'}
    {else}
        {include uri='design:menu/header_menu.tpl'}
    {/if}
</header>
