{if $openpa.control_cache.no_cache}
    {set-block scope=root variable=cache_ttl}0{/set-block}
{/if}

{if $openpa.content_tools.editor_tools}
    {include uri=$openpa.content_tools.template}
{/if}

{def $tree_menu = tree_menu( hash( 'root_node_id', $openpa.control_menu.side_menu.root_node.node_id, 'user_hash', $openpa.control_menu.side_menu.user_hash, 'scope', 'side_menu' ))
     $show_left = and( $openpa.control_menu.show_side_menu, count( $tree_menu.children )|gt(0) )}


<div class="content-view-full class-{$node.class_identifier}">
    <div class="u-padding-bottom-l content-title">
        {include uri='design:openpa/full/parts/node_languages.tpl'}
        <h2 class="u-text-h2">{$node.name|wash()}</h2>
    </div>


    <div class="Grid Grid--withGutter">
        <div class="Grid-cell u-padding-bottom-xl{if $show_left|not() } u-sizeFull{else} u-md-size7of12 u-lg-size7of12{/if}">

            {include uri=$openpa.content_main.template}

            {if fetch( 'content', 'list_count', hash( 'parent_node_id', $node.node_id,
                                                      'class_filter_type', 'include',
                                                      'class_filter_array', array( 'image', 'video' ) ) )}

                {def $children = fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                                               'class_filter_type', 'include',
                                                               'class_filter_array', array( 'image', 'video' ),
                                                               'sort_by', $node.sort_array ) )}

                {include name="carousel"
                        uri='design:atoms/carousel.tpl'
                        items=$children
                        css_id=concat( 'gallery', $node.node_id)
                        root_node=$node
                        autoplay=0
                        i_view=image
                        pagination=false()
                        navigation=true()
                        top_pagination_position=true()
                        image_class=imagefull
                        items_per_row=1}
            {/if}
        </div>
        {if $show_left}
            <div class="Grid-cell u-sizeFull u-md-size4of12 u-lg-size4of12 u-md-before1of12 u-lg-before1of12 u-padding-bottom-xl">
                {include uri='design:openpa/full/parts/section_left.tpl'}
                <a href="#" title="torna all'inizio del contenuto" class="u-hiddenVisually">torna all'inizio del contenuto</a>
            </div>
        {/if}
    </div>
</div>
