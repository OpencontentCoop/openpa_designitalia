{if $openpa.content_detail.has_content}

{foreach $openpa.content_detail.attributes as $openpa_attribute}
    <div class="content-detail-item{if and( $openpa_attribute.full.show_label, $openpa_attribute.full.collapse_label|not() )} withLabel{/if}">
        {if and( $openpa_attribute.full.show_label, $openpa_attribute.full.collapse_label|not() )}
            <div class="label">
                <strong>{$openpa_attribute.label}</strong>
            </div>
        {/if}
        <div class="value">
            {if and( $openpa_attribute.full.show_label, $openpa_attribute.full.collapse_label )}
                <strong>{$openpa_attribute.label}</strong>
            {/if}
            {attribute_view_gui attribute=$openpa_attribute.contentobject_attribute href=cond($openpa_attribute.full.show_link|not, 'no-link', '')}
        </div>
    </div>
{/foreach}

{/if}

{include uri=$openpa.content_attachment.template}

{include uri=$openpa.content_gallery.template}
