<div class="Breadcrumb-container">
    <nav aria-label="sei qui:" role="navigation">
        <ul class="Breadcrumb">
            {def $root_node_depth = cond(ezini_hasvariable( 'SiteSettings', 'RootNodeDepth', 'site.ini' ), ezini( 'SiteSettings', 'RootNodeDepth', 'site.ini' ), 1)}
            {def $index = 1}
            {foreach openpacontext().path_array as $path}                
                {if $index|ge($root_node_depth)}
                    {if $path.url}
                        <li class="Breadcrumb-item">
                            <a class="Breadcrumb-link u-color-50" href={cond( is_set( $path.url_alias ), $path.url_alias, $path.url )|ezurl}>{$path.text|wash}</a>
                        </li>
                    {else}
                        <li class="Breadcrumb-item">
                            {$path.text|wash}
                        </li>
                    {/if}
                {/if}
                {set $index = $index|inc()}
            {/foreach} 
            {undef $root_node_depth $index}           
        </ul>
    </nav>
</div>
