{set_defaults(hash('image_class', 'small'))}
<div class="class-{$node.class_identifier} media {$node|access_style}">

    {if $node|has_attribute( 'image' )}
        <div class="media-left hidden-xs">
            <a href="{if is_set( $node.url_alias )}{$node.url_alias|ezurl('no')}{else}#{/if}">
                {attribute_view_gui attribute=$node|attribute( 'image' ) href=false() image_class=$image_class image_css_class="media-object" fluid=false()}
            </a>
        </div>
    {/if}
    <div class="media-body">
        <h3 class="media-heading">
            <a href="{$openpa.content_link.full_link}">{$node.name|wash()}</a>
            <small>{$openpa.content_link.full_link}</small>
        </h3>
        {$node|abstract()}
        {include uri="design:parts/toolbar/node_edit.tpl" current_node=$node}
        {include uri="design:parts/toolbar/node_trash.tpl" current_node=$node}
    </div>
</div>
