<div class="Header-navbar Grid Grid--alignMiddle">

    {if and( $pagedata.is_login_page|not(), array( 'edit', 'browse' )|contains( $ui_context )|not() )}
        <div class="Header-toggle Grid-cell">
            <a class="Hamburger-toggleContainer js-fr-offcanvas-open" href="#menu"
               aria-controls="menu" aria-label="accedi al menu" title="accedi al menu">
                <span class="Hamburger-toggle" role="presentation"></span>
                <span class="Header-toggleText" role="presentation">Menu</span>
            </a>
        </div>
    {/if}

    <div class="Header-logo Grid-cell" aria-hidden="true">
        <a href="/" tabindex="-1">
            {if and( is_set($pagedata.header.logo.url), $pagedata.header.logo.url)}
                <img src={$pagedata.header.logo.url|ezroot()} alt="{ezini('SiteSettings','SiteName')}" alt="{ezini('SiteSettings','SiteName')}" />
            {else}
                <img src="//placehold.it/75x80" alt="{ezini('SiteSettings','SiteName')}">
            {/if}
        </a>
    </div>

    <div class="Header-title Grid-cell">
        <h1 class="Header-titleLink">
            <a accesskey="1" href="{"/"|ezurl(no)}">
                {ezini('SiteSettings','SiteName')}{*<br>
                <small>eventuale sottotitolo</small>*}
            </a>
        </h1>
    </div>

    {if $pagedata.is_login_page|not()}
        {include uri='design:header/tools.tpl'}
    {/if}

</div><!-- Header-navbar -->
