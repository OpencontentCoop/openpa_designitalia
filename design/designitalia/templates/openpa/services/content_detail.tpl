{if $openpa.content_detail.has_content}
<div class="content-detail u-padding-bottom-m">
{foreach $openpa.content_detail.attributes as $openpa_attribute}
    <div class="Grid Grid--withGutter">
        {if and( $openpa_attribute.full.show_label, $openpa_attribute.full.collapse_label|not() )}
            <div class="Grid-cell u-md-size3of12">
                <strong>{$openpa_attribute.label}</strong>
            </div>
        {/if}
        <div class="Grid-cell u-md-size{if and( $openpa_attribute.full.show_label, $openpa_attribute.full.collapse_label|not() )}9{else}12{/if}of12">
            {if and( $openpa_attribute.full.show_label, $openpa_attribute.full.collapse_label )}
            <strong>{$openpa_attribute.label}</strong>
            {/if}
            {attribute_view_gui attribute=$openpa_attribute.contentobject_attribute href=cond($openpa_attribute.full.show_link|not, 'no-link', '')}
        </div>
    </div>
{/foreach}
</div>
{/if}

{include uri=$openpa.content_attachment.template}

{include uri=$openpa.content_gallery.template}