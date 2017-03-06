{def $valid_node = cond( is_set( $block.valid_nodes[0] ), $block.valid_nodes[0], false() )
     $show_link = true()}

{if and( $valid_node|not(), is_set( $block.custom_attributes.source ) )}
    {set $valid_node = fetch( content, node, hash( node_id, $block.custom_attributes.source ) )}
{/if}

{if $valid_node|not()}
    {set $valid_node = fetch( content, node, hash( node_id, ezini( 'NodeSettings', 'RootNode', 'content.ini' ) ) )
         $show_link = false()}
{/if}

{def $calendarData = fetch( openpa, calendario_eventi, hash( 'calendar', $valid_node, 'params', hash( 'interval', 'P30D' ) ) )}

{set_defaults(hash('show_title', true(), 'items_per_row', 1))}

<div class="openpa-widget {$block.view} {if and(is_set($block.custom_attributes.color_style), $block.custom_attributes.color_style|ne(''))}color color-{$block.custom_attributes.color_style}{/if}">
    {if and( $show_link, $show_title, $block.name|ne('') )}
        <h3 class="openpa-widget-title">{if $link_top_title}<a href="{$valid_node.url_alias|ezurl(no)}" title="Vai al calendario">{/if}{$block.name|wash()}{if $link_top_title}</a>{/if}</h3>
    {/if}
    <div class="openpa-widget-content">
        <div class="carousel-top-control openpa-panels-container {$block.view}">
            {include uri='design:calendar/carousel.tpl'
                    css_id=$block.id
                    items=$calendarData.events
                    root_node=$valid_node
                    i_view=panel
                    autoplay=0
                    image_class=squaremedium
                    auto_height=true()
					top_pagination_position=true()
                    items_per_row=$items_per_row}
        </div>
    </div>
    {if $link_top_title|not()}
        <p class="u-textCenter u-text-md-right u-text-lg-right u-margin-r-top">
            <a href="{$openpa.root_node.url_alias|ezurl(no)}" class="u-color-50 u-textClean u-text-h4">
                Vedi tutto <span class="Icon Icon-chevron-right"></span></a>
        </p>
    {/if}
</div>
{unset_defaults(array('show_title','items_per_row'))}
