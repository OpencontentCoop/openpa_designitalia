<header class="Header {*Headroom--fixed js-Headroom*} u-hiddenPrint">
    {include uri='design:header/service.tpl'}
    {include uri='design:header/navigation.tpl'}
    {include uri='design:menu/header_menu.tpl'}
</header>

{*if and( or($pagedata.is_homepage, is_area_tematica()), array( 'edit', 'browse' )|contains( $ui_context )|not() )}
    {include uri='design:header/banner.tpl'}
{/if*}
