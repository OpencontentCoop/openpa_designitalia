{def $openpa= object_handler($block)}
{set_defaults(hash('show_title', true()))}

<div class="u-sizeFull">
    <div class="Card Card--withBorder u-color-grey-30">
        {if is_set($block.custom_attributes.color_style)}<div class="color color-{$block.custom_attributes.color_style}">{/if}
        {if and( $show_title, $block.name|ne('') )}
            <div class="u-background-50 u-padding-all-xs">
                <h3 class="u-text-h3"><a class=" u-color-white" href={$openpa.root_node.url_alias|ezurl()}>{$block.name|wash()}</a></h3>
            </div>
        {/if}
            <div class="Card-content u-color-black">
                <div class="{if and( $show_title, $block.name|ne('') )}widget_content {/if}carousel-both-control">
                    {include name="carousel"
                            uri='design:atoms/carousel.tpl'
                            items=$openpa.content
                            css_id=$block.id
                            root_node=$openpa.root_node
                            autoplay=10000
                            pagination=true()
                            navigation= false()
                            items_per_row=1}
                </div>
            </div>
        {if is_set($block.custom_attributes.color_style)}</div>{/if}
        {unset_defaults(array('show_title'))}
    </div>
</div>
