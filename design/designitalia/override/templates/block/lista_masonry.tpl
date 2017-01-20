{def $openpa = object_handler($block)}

<div class="openpa-widget {$block.view} {if is_set($block.custom_attributes.color_style)}color color-{$block.custom_attributes.color_style}{/if} u-background-grey-20 u-layout-centerContent u-cf">
    {if and( $show_title, $block.name|ne('') )}
        <h3 class="openpa-widget-title">{if $openpa.root_node}<a href={$openpa.root_node.url_alias|ezurl()}>{/if}{$block.name|wash()}{if $openpa.root_node}</a>{/if}</h3>
    {/if}
    <div class="openpa-widget-content">
        <section class="js-Masonry-container u-layout-medium u-layoutCenter" data-columns>
            {foreach $openpa.content as $item}
                <div class="Masonry-item js-Masonry-item">
                    {node_view_gui content_node=$item view='panel' image_class='squaremedium'}
                </div>
            {/foreach}
        </section>
    </div>
</div>

