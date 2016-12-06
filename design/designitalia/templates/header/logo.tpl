<div class="Header-logo Grid-cell" aria-hidden="true">
    <a href="/" tabindex="-1">
        {if and( is_set($pagedata.header.logo.url), $pagedata.header.logo.url)}
            <img src="{$pagedata.header.logo.url|ezroot(no)}" alt="{ezini('SiteSettings','SiteName')}" />
        {else}
            <img src="//placehold.it/75x80" alt="{ezini('SiteSettings','SiteName')}" />
        {/if}
    </a>
</div>

{if and( $pagedata.homepage|has_attribute('only_logo'), $pagedata.homepage|attribute('only_logo').data_int|eq(1) )}
    <div class="Header-title Grid-cell"></div>
{else}
    <div class="Header-title Grid-cell">
        <h1 class="Header-titleLink">
            <a accesskey="1" href="{"/"|ezurl(no)}">
                {ezini('SiteSettings','SiteName')}{*<br>
                <small>eventuale sottotitolo</small>*}
            </a>
        </h1>
    </div>
{/if}