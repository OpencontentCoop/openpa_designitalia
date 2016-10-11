{*<div class="navbar yamm">
    <div class="container">
        <div class="row">
        <div class="navbar-header col-md-4">
            {if $pagedata.is_login_page|not()}
            <button type="button" data-toggle="collapse" data-target="#main-menu" class="navbar-toggle"><span class="glyphicon glyphicon-menu-hamburger"></span></button>

            {if and( $pagedata.homepage|has_attribute('only_logo'), $pagedata.homepage|attribute('only_logo').data_int|eq(1) )}
                <a href={"/"|ezurl} title="{ezini('SiteSettings','SiteName')}" class="navbar-brand" style="height: 80px;">
                    <img src={$pagedata.homepage|attribute('logo').content['header_only_logo'].url|ezroot()} alt="{ezini('SiteSettings','SiteName')}" />
                </a>
            {else}
                <a href={"/"|ezurl} title="{ezini('SiteSettings','SiteName')}" class="navbar-brand">
                    {if and( is_set($pagedata.header.logo.url), $pagedata.header.logo.url)}
                        <img class="hidden-xs navbar-logo" src={$pagedata.header.logo.url|ezroot()} alt="{ezini('SiteSettings','SiteName')}" />
                    {/if}
                    <span class="navbar-title">
                        {ezini('SiteSettings','SiteName')}
                    </span>
                </a>
            {/if}
        </div>
        {if $pagedata.is_login_page|not()}
        <div class="menu-container col-md-8">
            <div id="main-menu" class="navbar-collapse collapse">
                {include uri='design:menu/top_menu.tpl'}
            </div>
        </div>
        {/if}
        </div>
    </div>
</div>*}


<div class="Header-navbar Grid Grid--alignMiddle">

    {if $pagedata.is_login_page|not()}
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
                <img class="header-logo" src={$pagedata.header.logo.url|ezroot()} alt="{ezini('SiteSettings','SiteName')}" alt="{ezini('SiteSettings','SiteName')}" />
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
