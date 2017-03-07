{if $openpa.content_gallery.has_images}
    {if $openpa.content_gallery.has_single_images}
        <div class="openpa-widget u-margin-top-l">
            <h3 class="openpa-widget-title"><i class="fa fa-camera"></i> {$openpa.content_gallery.title}</h3>
            <div class="openpa-widget-content">
                {include uri='design:atoms/gallery.tpl' items=$openpa.content_gallery.images title=false()}
            </div>
        </div>
    {/if}

    {if $openpa.content_gallery.has_galleries}
        {foreach $openpa.content_gallery.galleries as $gallery}
            <div class="openpa-widget">
                <h3 class="openpa-widget-title"><a href="{$gallery.url_alias|ezurl(no)}" title="{$gallery.name|wash()}"><i class="fa fa-camera"></i> {$gallery.name|wash()|trim()}</a></h3>
                <div class="openpa-widget-content">
                    {include uri='design:atoms/gallery.tpl'
                             items=fetch( content, list, hash( 'parent_node_id', $gallery.node_id, 'class_filter_type', 'include', 'class_filter_array', array( 'image' ), limit, 3))
                             all_items_count=fetch( content, list_count, hash( 'parent_node_id', $gallery.node_id, 'class_filter_type', 'include', 'class_filter_array', array( 'image' )))
                             readmore_link=$gallery.url_alias|ezurl(no)
                             title=false()}
                </div>
            </div>
        {/foreach}
    {/if}
{/if}
