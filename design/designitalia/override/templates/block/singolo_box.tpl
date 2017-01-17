{def $valid_node = $block.valid_nodes[0]
$link = '#'}

{if object_handler($valid_node).content_link.full_link|ne('')}
    {set $link = object_handler($valid_node).content_link.full_link}
{/if}

<div class="Entrypoint-item u-sizeFill u-background-compl-80">
    <p><a class="u-textClean u-text-h3 u-color-white" href="{$link}">{$valid_node.name|wash()}</a></p>
</div>


{*if count($block.valid_nodes)}
{def $valid_node = $block.valid_nodes[0]}
  <div class="openpa-widget openpa-panels-container {$block.view} {if is_set($block.custom_attributes.color_style)}color color-{$block.custom_attributes.color_style}{/if}">
    {if and( $block.name|ne(''), $valid_node|has_attribute( 'image' ) )}
      <h3 class="openpa-panel-label">{$block.name|wash()}</h3>
    {/if}
    <div class="openpa-widget-content">
        {node_view_gui content_node=$valid_node view=panel image_class=large}
    </div>
  </div>

{undef $valid_node}
{/if*}
