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

            {include uri=$openpa.content_contacts.template}

            {include uri=$openpa.content_detail.template}

            {*OGGETTI INVERSAMENTE CORRELATI - COME MEMBRO DI UN ORGANO POLITICO *}
            {include name=reverse_related_objects_specific_class_and_attribute
                node=$node
                classe='organo_politico'
                attrib='presidente'
                title="Presidente di:"
                uri='design:parts/reverse_related_objects_specific_class_and_attribute.tpl'}

            {include name=reverse_related_objects_specific_class_and_attribute
                    node=$node
                    classe='organo_politico'
                    attrib='membri'
                    title="Membro di:"
                    uri='design:parts/reverse_related_objects_specific_class_and_attribute.tpl'}


            {include uri=$openpa.content_attachment.template}

            {include uri=$openpa.content_infocollection.template}

            {include uri=$openpa.control_children.template}

        </div>

        {include uri='design:openpa/full/parts/section_left.tpl'}
    </div>
    {if $openpa.content_date.show_date}
        {include uri=$openpa.content_date.template}
    {/if}
</div>
