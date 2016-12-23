{set_defaults(hash('show_title', true(), 'items_per_row', 1, 'image_class', 'agid_carousel', 'enable_pagination', false()))}
{def $valid_node = $block.valid_nodes[0]}

<div class="openpa-widget {$block.view} {if is_set($block.custom_attributes.color_style)}color color-{$block.custom_attributes.color_style}{/if}">
    {if and( $show_title, $block.name|ne('') )}
        <h3 class="openpa-widget-title"><a href={$valid_node.url_alias|ezurl()}>{$block.name|wash()}</a></h3>
    {/if}
    <div class="openpa-widget-content openpa-full">
        {if fetch( 'content', 'list_count', hash( 'parent_node_id', $valid_node.node_id,
        'class_filter_type', 'include',
        'class_filter_array', array( 'image', 'video' ) ) )}

            {def $children = fetch( 'content', 'list', hash( 'parent_node_id', $valid_node.node_id,
            'class_filter_type', 'include',
            'class_filter_array', array( 'image', 'video' ),
            'sort_by', $valid_node.sort_array ) )}

            {include name="carousel"
            uri='design:atoms/carousel.tpl'
            items=$children
            css_id=concat( 'gallery', $valid_node.node_id)
            root_node=$valid_node
            autoplay=0
            i_view=image
            pagination=$enable_pagination
            navigation=and( $show_title, $block.name|ne(''), $items_per_row|gt(1) )
            items_per_row=$items_per_row
            top_pagination_position=true()
            image_class=$image_class}
        {/if}
    </div>
</div>
{undef $valid_node}
