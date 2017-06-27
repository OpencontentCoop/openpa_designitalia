<ul class="Skiplinks js-fr-bypasslinks u-hiddenPrint">
  <li><a href="#main">Vai al Contenuto</a></li>
  <li><a class="js-fr-offcanvas-open" href="#menu" aria-controls="menu" aria-label="accedi al menu" title="accedi al menu">Vai alla navigazione del sito</a></li>
</ul>

<header class="Header u-hiddenPrint">
    {include uri='design:header/service.tpl'}
    {include uri='design:header/navigation.tpl'}
    {include uri='design:menu/header_menu.tpl'}
</header>

{*if and( or($pagedata.is_homepage, is_area_tematica()), array( 'edit', 'browse' )|contains( $ui_context )|not() )}
    {include uri='design:header/banner.tpl'}
{/if*}
