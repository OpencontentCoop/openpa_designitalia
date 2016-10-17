{if $openpa.content_gallery.has_images}
    {if $openpa.content_gallery.has_single_images}
        <div class="openpa-widget">
            <h3 class="openpa-widget-title"><i class="fa fa-camera"></i> {$openpa.content_gallery.title}</h3>
            <div class="openpa-widget-content">
                {include uri='design:atoms/gallery.tpl' items=$openpa.content_gallery.images title=false()}
            </div>
        </div>
    {/if}

    {if $openpa.content_gallery.has_galleries}
        {foreach $openpa.content_gallery.galleries as $gallery}
            <div class="openpa-widget">
                <h3 class="openpa-widget-title"><i class="fa fa-camera"></i> {$gallery.name|wash()}</h3>
                <div class="openpa-widget-content">
                    {include uri='design:atoms/gallery.tpl' items=fetch( content, list, hash( 'parent_node_id', $gallery.node_id, 'class_filter_type', 'include', 'class_filter_array', array( 'image' ), limit, 3)) title=false()}
                    <a class="readmore" href="{$gallery.url_alias|ezurl(no)}" title="Visualizza tutta la galleria">Visualizza tutta la galleria</a>
                </div>
            </div>
        {/foreach}
    {/if}
{/if}
