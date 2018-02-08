{def $openpa = object_handler($block)
     $bg_class = 'u-background-grey-20'
     $count = $openpa.content|count()
     $size = 2}

{if and(is_set($block.custom_attributes.color_style), $block.custom_attributes.color_style|ne(''))}
    {set $bg_class = 'u-background-white'}
{/if}
{set_defaults(hash('show_title', true()))}

{for 4 to 2 as $counter}
    {if $count|mod($counter)|eq(0)}
        {set $size = $counter}
        {break}
    {/if}
{/for}

{if $items_per_row|le(6)}
  {set $size = $items_per_row}
{/if}

{if count($openpa.content)|gt(0)}
<div class="openpa-widget {$block.view} {if and(is_set($block.custom_attributes.color_style), $block.custom_attributes.color_style|ne(''))}color color-{$block.custom_attributes.color_style}{/if}">
    {if and( $show_title, $block.name|ne('') )}
        <h3 class="openpa-widget-title">{if and($openpa.root_node, $link_top_title)}<a href={$openpa.root_node.url_alias|ezurl()}>{/if}{$block.name|wash()}{if and($openpa.root_node, $link_top_title)}</a>{/if}</h3>
    {/if}
    <div class="openpa-widget-content">
        <div class="Grid Grid--withGutter">
            {foreach $openpa.content as $item}
                {def $openpa_item = object_handler($item)}
                <div class="Grid-cell u-md-size1of{$size} u-lg-size1of{$size} u-padding-bottom-xs">
                    <a class="u-sizeFull u-textClean u-text-m {$bg_class} u-floatLeft {if $item|has_attribute('image')|not} u-textCenter{/if} u-borderShadow-xxs u-borderRadius-m" href="{$openpa_item.content_link.full_link}" style="height: 100px; overflow: hidden;">
                        {if $item|has_attribute('image')}
                            <img src="{$item|attribute('image').content['agid_square'].full_path|ezroot(no)}"
                                 alt="Immagine decorativa per il contenuto {$item.name|wash()}"
                                 class="u-margin-right-xs u-floatLeft" height="100" />
                        {/if}
                        <span class="u-block u-padding-all-s" style="display: flex !important;align-items: center;height: 100%;">{$item.name|oc_shorten(120)}</span>
                    </a>
                </div>
                {undef $openpa_item}
            {/foreach}
        </div>
    </div>
    {if and($openpa.root_node, $link_top_title|not(), $block.type|eq('Lista'))}
      <p class="goto">
        <a href="{$openpa.root_node.url_alias|ezurl(no)}">Vedi tutto <span></span></a>
      </p>
    {/if}
</div>
{/if}
