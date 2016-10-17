{def $valid_node = $block.valid_nodes[0]}
<div class="openpa-widget {$block.view} {if is_set($block.custom_attributes.color_style)}color color-{$block.custom_attributes.color_style}{/if}">
    <div class="openpa-widget-content">
        <div class="owl-item">
            <div class="item">
                {node_view_gui content_node=$valid_node view=carousel image_class=carousel}
            </div>
        </div>
    </div>
</div>
