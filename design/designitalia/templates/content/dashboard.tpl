<h1 class="u-size-h1 u-padding-bottom-l">{'Dashboard'|i18n( 'design/admin/content/dashboard' )}</h1>

<div class="Grid Grid--withGutter">
    {def $i = 0}
    {foreach $blocks as $block}
        <div class="Grid-cell u-md-size1of2 u-lg-size1of2 u-padding-bottom-l">
            {if $block.template}
                {include uri=concat( 'design:', $block.template )}
            {else}
                {include uri=concat( 'design:dashboard/', $block.identifier, '.tpl' )}
            {/if}
        </div>
    {/foreach}
</div>
