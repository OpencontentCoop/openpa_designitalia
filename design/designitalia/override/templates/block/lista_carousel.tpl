{def $openpa= object_handler($block)}
{set_defaults(hash('show_title', true(), 'items_per_row', 1))}

<div class="openpa-widget {$block.view} {if is_set($block.custom_attributes.color_style)}color color-{$block.custom_attributes.color_style}{/if}">
    {if and( $show_title, $block.name|ne('') )}
        <h3 class="openpa-widget-title">{$block.name|wash()}</h3>
    {/if}
    <div class="openpa-widget-content">
        {include name="carousel"
                 uri='design:atoms/carousel.tpl'
                 items=$openpa.content
                 css_id=$block.id
                 root_node=$openpa.root_node
                 pagination=$items_per_row|gt(1)
                 navigation= false()
                 items_per_row=$items_per_row
                 show_items_preview=$items_per_row|eq(1)}
    </div>
</div>

{unset_defaults(array('show_title'))}
