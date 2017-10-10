{def $is_only_logo = cond(and( $pagedata.homepage|has_attribute('only_logo'), $pagedata.homepage|attribute('only_logo').data_int|eq(1) ), true(), false())}
<div class="Header-logo Grid-cell" aria-hidden="true">
    {if $is_only_logo}
        <h1 alt="{ezini('SiteSettings','SiteName')}">
    {/if}
    <a href="{"/"|ezurl(no)}" tabindex="-1">
        {if and( is_set($pagedata.header.logo.url), $pagedata.header.logo.url)}
            <img src="{$pagedata.header.logo.url|ezroot(no)}" alt="{ezini('SiteSettings','SiteName')}" {if $is_only_logo}style="width: auto;"{/if}/>
        {/if}
    </a>
    {if $is_only_logo}
        </h1>
    {/if}
</div>

{if $is_only_logo}
    <div class="Header-title Grid-cell"></div>
{else}
    <div class="Header-title Grid-cell">
        <h1 class="Header-titleLink">
            <a href="{"/"|ezurl(no)}">
                {ezini('SiteSettings','SiteName')}{*<br>
                <small>eventuale sottotitolo</small>*}
            </a>
        </h1>
    </div>
{/if}
{undef $is_only_logo}
