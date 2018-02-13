{def $openpa= object_handler($block)}
{set_defaults(
  hash(
    'show_title', true(),
    'items_per_row', 1,
    'image_class', 'agid_wide_carousel',
    'enable_pagination', true(),
    'enable_preview', false(),
    'control_buttons', true(),
    'autoplay', true(),
    'loop', true()))}

<div class="openpa-widget {$block.view} {if and(is_set($block.custom_attributes.color_style), $block.custom_attributes.color_style|ne(''))}color color-{$block.custom_attributes.color_style}{/if}">
    {if and( $show_title, $block.name|ne('') )}
        <h3 class="openpa-widget-title"><span>{$block.name|wash()}</span></h3>
    {/if}
    <div class="openpa-widget-content">
        {include name="carousel"
                 uri='design:atoms/carousel.tpl'
                 items=$openpa.content
                 css_id=$block.id
                 root_node=$openpa.root_node
                 pagination= or( $items_per_row|gt(1), $enable_pagination )
                 navigation= and( $show_title, $block.name|ne(''), $items_per_row|gt(1) )
                 control_buttons= $control_buttons
                 autoplay= $autoplay
                 loop= $loop
                 items_per_row=$items_per_row
                 show_items_preview= and( $items_per_row|eq(1), $enable_preview)
                 image_class=$image_class}
    </div>
</div>

{unset_defaults(array('show_title'))}
