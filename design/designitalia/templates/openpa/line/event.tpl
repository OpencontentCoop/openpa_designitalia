{set_defaults(hash('image_class', 'small'))}
<div class="openpa-line class-{$node.class_identifier} media {$node|access_style}">

    {if $node|has_attribute( 'image' )}
        <div class="media-image">
            <a href="{if is_set( $node.url_alias )}{$node.url_alias|ezurl('no')}{else}#{/if}">
                {attribute_view_gui attribute=$node|attribute( 'image' ) href=false() image_class=$image_class image_css_class="media-object" fluid=false()}
            </a>
        </div>
    {/if}

    <div class="media-body">
        <h3 class="media-heading">
            <a href="{$openpa.content_link.full_link}">{$node.name|wash()}</a>
        </h3>
        {if $node|has_abstract()}
            {$node|abstract()}
        {/if}
    </div>
</div>
