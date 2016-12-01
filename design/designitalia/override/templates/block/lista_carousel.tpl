{def $openpa= object_handler($block)}
{set_defaults(hash('show_title', true(), 'items_per_row', 1, 'image_class', 'carousel'))}

<div class="openpa-widget {$block.view} {if is_set($block.custom_attributes.color_style)}color color-{$block.custom_attributes.color_style}{/if}">
    {if and( $show_title, $block.name|ne('') )}
        <h3 class="openpa-widget-title"><span>{$block.name|wash()}</span></h3>
    {/if}
    <div class="openpa-widget-content">
        {include name="carousel"
                 uri='design:atoms/carousel.tpl'
                 items=$openpa.content
                 css_id=$block.id
                 root_node=$openpa.root_node
                 pagination=$items_per_row|gt(1)
                 navigation= and( $show_title, $block.name|ne(''), $items_per_row|gt(1) )
                 items_per_row=$items_per_row
                 show_items_preview=0
                 image_class=$image_class}
    </div>
</div>

{unset_defaults(array('show_title'))}
