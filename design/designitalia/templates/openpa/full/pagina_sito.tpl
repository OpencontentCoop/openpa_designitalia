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

            {include uri=$openpa.content_detail.template}

            {if and( is_set( $openpa.content_albotelematico ), $openpa.content_albotelematico.is_container )}
                {include uri=$openpa.content_albotelematico.container_template}
            {else}
                {node_view_gui content_node=$node view=children view_parameters=$view_parameters}
            {/if}

            {include name=reverse_related_objects_specific_class_and_attribute
            node=$node
            classe='pagina_sito'
            attrib='riferimento'
            title="Riferimenti:"
            uri='design:parts/reverse_related_objects_specific_class_and_attribute.tpl'}

            {if $openpa.content_date.show_date}
                <div class="row"><div class="col-md-12">
                        <p class="pull-right">{include uri=$openpa.content_date.template}</p>
                    </div>
                </div>
            {/if}

        </div>

        {include uri='design:openpa/full/parts/section_left.tpl'}
    </div>
    {if $openpa.content_date.show_date}
        {include uri=$openpa.content_date.template}
    {/if}
</div>
