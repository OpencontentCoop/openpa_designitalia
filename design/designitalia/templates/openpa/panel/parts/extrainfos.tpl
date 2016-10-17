{if $node|has_attribute( 'file' )}
    <p class="Card-extra">
        {attribute_view_gui attribute=$node|attribute( 'file' )}
    </p>
{/if}
{if $openpa.content_gallery.has_images}
    <p class="Card-extra">
        <i class="fa fa-camera"></i>
        <a href="{$openpa.content_link.full_link}"
           title="{$openpa.content_gallery.title|wash()}">{$openpa.content_gallery.title|wash()}</a>
    </p>
{/if}

{if count($openpa.content_related.info)|gt(0)}
    <p class="Card-extra">
        <i class="fa fa-link"></i>
        {foreach $openpa.content_related.info as $class_name => $infos}{foreach $infos as $info}{node_view_gui content_node=$info view=text_linked}{delimiter}, {/delimiter}{/foreach}{delimiter}, {/delimiter}{/foreach}
    </p>
{/if}
