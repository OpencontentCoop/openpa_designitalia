{def $openpa = object_handler($block)}

{set_defaults(hash('show_title', true(), 'items_per_row', 2))}

<div class="Card Card--withBorder u-color-grey-30 u-margin-top-s">
    {if is_set($block.custom_attributes.color_style)}<div class="color color-{$block.custom_attributes.color_style}">{/if}
    {if and( $show_title, $block.name|ne('') )}
        <div class="u-background-50 u-padding-all-xxs">
            <h3 class="u-text-h3">
                {if $openpa.root_node}<a class=" u-color-white" href={$openpa.root_node.url_alias|ezurl()}>{/if}
                    {$block.name|wash()}
                {if $openpa.root_node}</a>{/if}
            </h3>
        </div>
    {/if}
    <div class="Card-content u-color-black u-padding-all-s u-margin-top-s">
        <div class="relative carousel-top-control panels-container {if or( $show_title|not(), $block.name|eq('') )}title-placeholder{/if} {$block.view}">


            {include uri='design:atoms/carousel.tpl'
                 css_id=$block.id
                 items=$openpa.content
                 root_node=$openpa.root_node
                 i_view=panel
                 autoplay=0
                 image_class=squaremedium
                 auto_height=true()
                 items_per_row=$items_per_row}
        </div>
    </div>
    {unset_defaults(array('show_title','items_per_row'))}
    {if is_set($block.custom_attributes.color_style)}</div>{/if}
</div>