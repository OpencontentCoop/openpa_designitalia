{def $openpa= object_handler($block)}
{set_defaults( hash('show_title', true(), 'items_per_row', 3) )}

<div class="openpa-widget {$block.view} {if is_set($block.custom_attributes.color_style)}color color-{$block.custom_attributes.color_style}{/if}">
    {if and( $show_title, $block.name|ne('') )}
        <h3 class="openpa-widget-title">{$block.name|wash()}</h3>
    {/if}

    <div class="Accordion fr-accordion js-fr-accordion" id="accordion-{$block.id}">
      {foreach $openpa.content as $index => $item}
          <h2 class="Accordion-header js-fr-accordion__header fr-accordion__header" id="accordion-header-{$block.id}-{$item.node_id}">
              <span class="Accordion-link u-text-r-s">{$item.name|wash()}</span>
          </h2>
          <div id="accordion-panel-{$block.id}-{$item.node_id}" class="Accordion-panel fr-accordion__panel js-fr-accordion__panel">
              {node_view_gui content_node=$item view=accordion_content}
              <a class="readmore" href="{object_handler($item).content_link.full_link}" title="{$item.name|wash()}">Leggi</a>
          </div>
      {/foreach}
    </div>

</div>
{unset_defaults( array('show_title', 'items_per_row') )}
