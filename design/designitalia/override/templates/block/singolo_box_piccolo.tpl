{def $valid_node = $block.valid_nodes[0]}
<div class="openpa-widget {$block.view} {if is_set($block.custom_attributes.color_style)}color color-{$block.custom_attributes.color_style}{/if}">
    <h3 class="openpa-widget-title">{node_view_gui content_node=$valid_node view=text_linked text=$block.name}</h3>
    <div class="openpa-widget-content">
        {node_view_gui content_node=$valid_node view=accordion_content image_class=small}
        <a class="readmore" href="{object_handler($valid_node).content_link.full_link}" title="{$valid_node.name|wash()}">Leggi</a>
    </div>
</div>