{ezscript_require( array( "ezjsc::jquery", "plugins/blueimp/jquery.blueimp-gallery.min.js" ) )}
{ezcss_require( array( "plugins/blueimp/blueimp-gallery.css" ) )}

{set_defaults( hash(
'thumbnail_class', 'large',
'wide_class', 'imagefullwide',
'items', array(),
'all_items_count', 0,
'readmore_link', false(),
'fluid', false(),
'mode', 'strip'
))}

{if $openpa.control_cache.no_cache}
    {set-block scope=root variable=cache_ttl}0{/set-block}
{/if}

{if $openpa.content_tools.editor_tools}
    {include uri=$openpa.content_tools.template}
{/if}

{def $tree_menu = tree_menu( hash( 'root_node_id', $openpa.control_menu.side_menu.root_node.node_id, 'user_hash', $openpa.control_menu.side_menu.user_hash, 'scope', 'side_menu' ))
     $show_left = and( $openpa.control_menu.show_side_menu, count( $tree_menu.children )|gt(0) )}

<div class="openpa-full class-{$node.class_identifier}">
    <div class="title">
        {include uri='design:openpa/full/parts/node_languages.tpl'}
        <h2>{$node.name|wash()}</h2>
    </div>
    <div class="content-container">
        <div class="content{if or( $show_left, $openpa.control_menu.show_extra_menu )} withExtra{/if}">

            {include uri=$openpa.content_main.template}

            {if fetch( 'content', 'list_count', hash( 'parent_node_id', $node.node_id,
                                                      'class_filter_type', 'include',
                                                      'class_filter_array', array( 'image', 'video' ) ) )}

                {def $children = fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                                               'class_filter_type', 'include',
                                                               'class_filter_array', array( 'image', 'video' ),
                                                               'sort_by', $node.sort_array ) )}
                {*include name="carousel"
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
                         items_per_row=1*}
                <section class="js-Masonry-container u-layout-wide" data-columns>
                    {foreach $children as $item}

                        {def $caption=$item.name}
                        {if $item|has_attribute( 'caption' )}
                            {set $caption = $item.data_map.caption.data_text|oc_shorten(200)|wash()}
                        {/if}
                        <div class="Masonry-item js-Masonry-item">
                            <a class="gallery-strip-thumbnail"
                               href={$item|attribute('image').content[$wide_class].url|ezroot} title="{$caption}" data-gallery>
                                {attribute_view_gui attribute=$item|attribute('image') image_class=$thumbnail_class fluid=$fluid image_css_class="img-responsive"}
                            </a>
                        </div>
                        {undef $caption}
                    {/foreach}
                </section>
            {/if}


        </div>

        {include uri='design:openpa/full/parts/section_left.tpl' extra_template=false()}
    </div>
    {if $openpa.content_date.show_date}
        {include uri=$openpa.content_date.template}
    {/if}
</div>
