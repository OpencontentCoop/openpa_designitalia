{def $valid_node = $block.valid_nodes[0]}

<div class="openpa-widget {$block.view} {if is_set($block.custom_attributes.color_style)}color color-{$block.custom_attributes.color_style}{/if}">
    <div class="openpa-widget-content">
        <div class="owl-item">
            <div class="item">
                {include uri='design:atoms/image.tpl' item=$valid_node image_class=carousel css_classes="" image_css_class="media-object tr_all_long_hover" alignment=center}
            </div>
        </div>
    </div>
</div>