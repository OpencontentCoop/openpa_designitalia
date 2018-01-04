{if $openpa.control_cache.no_cache}
    {set-block scope=root variable=cache_ttl}0{/set-block}
{/if}

{if $openpa.content_tools.editor_tools}
    {include uri=$openpa.content_tools.template}
{/if}

{def $tree_menu = tree_menu( hash( 'root_node_id', $openpa.control_menu.side_menu.root_node.node_id, 'user_hash', $openpa.control_menu.side_menu.user_hash, 'scope', 'side_menu' ))
     $show_left = and( $openpa.control_menu.show_side_menu, is_set( $tree_menu.children ), count( $tree_menu.children )|gt(0) )}

<div class="openpa-full class-{$node.class_identifier}">
    <div class="title">
        {include uri='design:openpa/full/parts/node_languages.tpl'}
        <h2>{$node.name|wash()}</h2>
    </div>
    <div class="content-container">
        <div class="content{if or( $show_left, $openpa.control_menu.show_extra_menu )} withExtra{/if}">

            {include uri=$openpa.content_main.template}

            {include uri=$openpa.content_contacts.template}

            {if $node|find_first_parent( 'pagina_trasparenza' )}
              {include uri='design:openpa/full/parts/amministrazione_trasparente/children_table.tpl'
                       nodes=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,'sort_by', $node.sort_array, 'load_data_map', false(), 'limit', openpaini( 'GestioneFigli', 'limite_paginazione', 25 ), 'offset', first_set( $view_parameters.offset, 0) ) )
                       nodes_count=fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id ) )
                       class=''}
            {elseif and( is_set( $openpa.content_albotelematico ), $openpa.content_albotelematico.is_container )}
              {include uri=$openpa.content_albotelematico.container_template}
            {else}

                {include uri=$openpa.content_detail.template}

                {node_view_gui content_node=$node view=children view_parameters=$view_parameters}
            {/if}

            {include name=reverse_related_objects_specific_class_and_attribute
                    node=$node
                    classe='folder'
                    attrib='riferimento'
                    title="Riferimenti:"
                    uri='design:parts/reverse_related_objects_specific_class_and_attribute.tpl'}

        </div>

        {include uri='design:openpa/full/parts/section_left.tpl'}
    </div>
    {if $openpa.content_date.show_date}
        {include uri=$openpa.content_date.template}
    {/if}
</div>
