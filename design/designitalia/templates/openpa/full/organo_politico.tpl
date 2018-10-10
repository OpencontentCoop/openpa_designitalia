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

            {include uri=$openpa.content_detail.template hide_attachment=true() hide_gallery=true()}

            <div class="content-view-children">
                {if $node.name|downcase()|contains('sindaco')}
                    {foreach $node|attribute( 'membri' ).content.relation_list as $relation_item}
                        {if is_set($relation_item.node_id)}
                            {node_view_gui view=line content_node=fetch(content,node,hash(node_id,$relation_item.node_id)) image_class='small'}
                        {/if}
                    {/foreach}
                {else}
                    {def $attributi_politici = array( 'presidente', 'vicepresidente', 'membri', 'segretario')}
                    {foreach $attributi_politici as $identifier}
                        {if $node|has_attribute( $identifier )}
                            <h2>{$node|attribute( $identifier ).contentclass_attribute.name|wash()}</h2>
                            {foreach $node|attribute( $identifier ).content.relation_list as $relation_item}
                                {if is_set($relation_item.node_id)}
                                    {node_view_gui view=line content_node=fetch(content,node,hash(node_id,$relation_item.node_id)) image_class='small'}
                                {/if}
                            {/foreach}
                        {/if}
                    {/foreach}
                {/if}
            </div>

            {if or( $openpa.content_attachment.has_content, $openpa.content_attachment.children_count )}
                <h3 class="openpa-widget-title"><span>Allegati</span></h3>
                {include uri=$openpa.content_attachment.template}
            {/if}

            {include uri=$openpa.content_gallery.template}

            {include uri=$openpa.content_infocollection.template}

        </div>

        {include uri='design:openpa/full/parts/section_left.tpl'}
    </div>
    {if $openpa.content_date.show_date}
        {include uri=$openpa.content_date.template}
    {/if}
</div>
