{def $openpa= object_handler($block)}
{set_defaults( hash('show_title', true(), 'items_per_row', 3) )}

{if is_set($block.custom_attributes.color_style)}<div class="color color-{$block.custom_attributes.color_style}">{/if}
<div class="{$block.view}">
    {if and( $show_title, $block.name|ne('') )}
      <div  class="widget_title">
        <h3>{$block.name|wash()}</h3>
      </div>
    {/if}

    <div class="Accordion fr-accordion js-fr-accordion" id="accordion-{$block.id}">
      {foreach $openpa.content as $index => $item}
          <h2 class="Accordion-header js-fr-accordion__header fr-accordion__header" id="accordion-header-{$block.id}-{$item.node_id}">
              <span class="Accordion-link u-text-r-s">{$item.name|wash()}</span>
          </h2>
          <div id="accordion-panel-{$block.id}-{$item.node_id}" class="Accordion-panel fr-accordion__panel js-fr-accordion__panel">
              <div class="u-layout-prose u-color-grey-90 u-text-p u-padding-r-all">
                  {node_view_gui content_node=$item view=accordion_content}
                  <a class="Button Button--info u-text-r-xs" href="{object_handler($item).content_link.full_link}" title="{$item.name|wash()}">Leggi</a>
              </div>
          </div>
      {/foreach}
    </div>

</div>
{if is_set($block.custom_attributes.color_style)}</div>{/if}
{unset_defaults( array('show_title', 'items_per_row') )}
