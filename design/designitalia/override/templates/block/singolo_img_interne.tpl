{def $valid_node = $block.valid_nodes[0]}

<div class="openpa-widget {$block.view} {if is_set($block.custom_attributes.color_style)}color color-{$block.custom_attributes.color_style}{/if}">
    <h3 class="openpa-widget-title">{node_view_gui content_node=$valid_node view=text_linked text=cond(ne($block.name,''),$block.name,false())}</h3>
    {if and( is_set($valid_node.data_map.image), $valid_node.data_map.image.has_content )}
        <div class="openpa-widget-content">
            {attribute_view_gui alt=$valid_node.name|wash() attribute=$valid_node.data_map.image image_class=large}
        </div>
    {/if}
</div>
