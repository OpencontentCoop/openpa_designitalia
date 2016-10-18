{def $openpa= object_handler($block)}
{set_defaults(hash('show_title', true(), 'items_per_row', 1))}

<div class="openpa-widget {$block.view} {if is_set($block.custom_attributes.color_style)}color color-{$block.custom_attributes.color_style}{/if}">
    {if and( $show_title, $block.name|ne('') )}
        <h3 class="openpa-widget-title">{$block.name|wash()}</h3>
    {/if}
    <div class="openpa-widget-content">
        <div class="{if and( $show_title, $block.name|ne('') )}widget_content {/if}carousel-both-control">
            {include name="carousel"
                    uri='design:atoms/carousel.tpl'
                    items=$openpa.content
                    css_id=$block.id
                    root_node=$openpa.root_node
                    autoplay=10000
                    pagination=true()
                    navigation= false()
                    items_per_row=$items_per_row}
        </div>
    </div>
</div>

{unset_defaults(array('show_title'))}
