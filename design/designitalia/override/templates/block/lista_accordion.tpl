{def $openpa= object_handler($block)}
{set_defaults( hash('show_title', true(), 'link_top_title', true(), 'items_per_row', 3) )}

{if count($openpa.content)}
  <div class="openpa-widget {$block.view} {if and(is_set($block.custom_attributes.color_style), $block.custom_attributes.color_style|ne(''))}color color-{$block.custom_attributes.color_style}{/if}">
    {if and( $show_title, $block.name|ne('') )}
      <h3 class="openpa-widget-title">{if and($openpa.root_node, $link_top_title)}<a href={$openpa.root_node.url_alias|ezurl()}>{/if}{$block.name|wash()}{if and($openpa.root_node, $link_top_title)}</a>{/if}</h3>
    {/if}

    <div class="Accordion Accordion--default fr-accordion js-fr-accordion" id="accordion-{$block.id}">
      {foreach $openpa.content as $index => $item}
        <h2 class="Accordion-header js-fr-accordion__header fr-accordion__header" id="accordion-header-{$block.id}-{$item.node_id}">
          <span class="Accordion-link">{$item.name|wash()}</span>
        </h2>
        <div id="accordion-panel-{$block.id}-{$item.node_id}" class="Accordion-panel fr-accordion__panel js-fr-accordion__panel">
          {node_view_gui content_node=$item view=accordion_content}
          <a class="readmore" href="{object_handler($item).content_link.full_link}" title="{$item.name|wash()}">Leggi</a>
        </div>
      {/foreach}
    </div>

  </div>
{/if}
{unset_defaults( array('show_title', 'items_per_row') )}
