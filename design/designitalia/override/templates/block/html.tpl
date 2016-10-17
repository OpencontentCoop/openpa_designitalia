<div class="openpa-widget {$block.view} {if is_set($block.custom_attributes.color_style)}color color-{$block.custom_attributes.color_style}{/if}">

    {if $block.name}
        <h3 class="openpa-widget-title">{$block.name}</h3>
    {/if}
    <div class="openpa-widget-content">
            {$block.custom_attributes.html}
    </div>
</div>