<a href={$object.main_node.url_alias|ezurl()}>{$object.name}</a>

{if and(is_set( $object.data_map.telefono), $object.data_map.telefono.has_content)}
    <small>{attribute_view_gui attribute=$object.data_map.telefono}</small>
{else}
    {def $telefoni_correlati = fetch('content', 'list', hash(
        'parent_node_id', openpaini( 'ControlloUtenti', 'telefoni' ),
        'extended_attribute_filter', hash('id', 'ObjectRelationFilter',
        'params', array(openpaini( 'ControlloUtenti', 'utente_telefono_attribute_ID' ), $object.contentobject_id) ) 
    ) )}
    {if $telefoni_correlati|count()}
        {foreach $telefoni_correlati as $tel_correlato}
            <small>
                <i class="fa fa-phone"></i>
                {$tel_correlato.name}
                {if $tel_correlato.data_map.numero_interno.has_content}
                    (interno: {attribute_view_gui attribute=$tel_correlato.data_map.numero_interno})
                {/if}
            </small>
        {/foreach}
    {undef $telefoni_correlati}
    {/if}
{/if}
