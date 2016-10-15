<div class="openpa-panel {$node|access_style} Card Card--withBorder u-color-grey-30">

    {if $node|has_attribute('image')}
        {include uri='design:atoms/image.tpl' item=$node image_class=imagefull css_classes="Card-image" image_css_classes="u-sizeFull"}
    {/if}

    <div class="Card-content u-padding-r-all">
        <p class="Card-title">
            <a class="Card-titleLink" href="{$openpa.content_link.full_link}"
               title="{$node.name|wash()}">{$node.name|openpa_shorten(60)|wash()}</a>
        </p>

        <div class="Card-text">
            {$node|abstract()}
        </div>

        {if $node|has_attribute( 'file' )}
            <p class="Card-extra"><i
                        class="fa-li fa fa-paperclip"></i> {attribute_view_gui attribute=$node|attribute( 'file' )}</p>
        {/if}
        {if $openpa.content_gallery.has_images}
        <p class="Card-extra"><i class="fa-li fa fa-camera"></i> <a href="{$openpa.content_link.full_link}"
                                                                    title="{$openpa.content_gallery.title|wash()}">{$openpa.content_gallery.title|wash()}</a>
            {/if}
            {if count($openpa.content_related.info)|gt(0)}
        <p class="Card-extra"><i class="fa-li fa fa-link"></i>
            {foreach $openpa.content_related.info as $class_name => $infos}{foreach $infos as $info}{node_view_gui content_node=$info view=text_linked}{delimiter}, {/delimiter}{/foreach}{delimiter}, {/delimiter}{/foreach}
        </p>
        {/if}


    </div>

</div>
