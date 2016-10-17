{if count($block.valid_nodes)}
{def $valid_node = $block.valid_nodes[0]}
  <div class="openpa-widget {$block.view} {if is_set($block.custom_attributes.color_style)}color color-{$block.custom_attributes.color_style}{/if}">
    {if and( $block.name|ne(''), $valid_node|has_attribute( 'image' ) )}
      <h3 class="openpa-widget-title">{$block.name|wash()}</h3>
    {/if}
    <div class="openpa-widget-content">
      <div class="relative panels-container {$block.view}">
        {node_view_gui content_node=$valid_node view=panel image_class=large}
      </div>
    </div>
  </div>
{undef $valid_node}
{/if}