<div class="Grid Grid--withGutter">
    {def $i = 0}
    {foreach $blocks as $block}
        <div class="Grid-cell u-padding-bottom-l">
          <div class="u-nbfc u-border-all-xxs u-color-grey-30 u-background-white">
            <div class="dashboard-card u-text-r-l u-padding-r-all u-color-black u-layout-prose" style="position: relative;padding-top: 50px !important;">
            {if $block.template}
                {include uri=concat( 'design:', $block.template )}
            {else}
                {include uri=concat( 'design:dashboard/', $block.identifier, '.tpl' )}
            {/if}
            </div>
          </div>
        </div>
    {/foreach}
</div>

<style>.dashboard-card > h2{ldelim}font-weight: 700 !important;font-size: 1.8rem !important;letter-spacing: .007em !important;margin-bottom: 1em !important;position: absolute;top: 0;left: 0;background: #333;color: #fff;padding: 5px 10px;{rdelim}</style>
