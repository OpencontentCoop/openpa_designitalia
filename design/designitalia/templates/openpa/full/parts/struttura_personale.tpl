{def $roles = fetch( 'openpa', 'ruoli', hash( 'struttura_object_id', $struttura.contentobject_id ) )}

{def $dipendenti = fetch( 'openpa', 'dipendenti', hash( 'struttura', $struttura ) )
     $informatici = fetch( 'openpa', 'dipendenti', hash( 'struttura', $struttura, 'subtree', array( openpaini( 'ControlloUtenti', 'referenti_informatici' ) ) ) )
     $editors = fetch( 'openpa', 'dipendenti', hash( 'struttura', $struttura, 'subtree', array( openpaini( 'ControlloUtenti', 'redattori' ) ) ) )}

{if or( $dipendenti|count(), or( $roles|count(), and( is_set( $struttura.data_map.responsabile ), $struttura.data_map.responsabile.has_content ) ) )}
    <div class="openpa-widget attribute-personale">

        <h3 class="openpa-widget-title">Personale</h3>

        {if or( $roles|count(), and( is_set( $struttura.data_map.responsabile ), $struttura.data_map.responsabile.has_content ) )}
            <div class="openpa-widget attribute-ruoli u-padding-bottom-xs">
                {if $roles|count()}
                    {foreach $roles as $item}
                        <p class="Prose">
                            <strong>{$item.name|wash()}</strong>
                            <a href= {$item.url_alias|ezurl()}>
                                {attribute_view_gui attribute=$item.data_map.utente}
                            </a>
                        </p>
                    {/foreach}

                {elseif and( is_set( $struttura.data_map.responsabile ), $struttura.data_map.responsabile.has_content )}
                    <p class="Prose">
                        <strong>{$struttura.data_map.responsabile.contentclass_attribute_name}</strong>
                        {if $struttura.data_map.responsabile.has_content}
                            {attribute_view_gui attribute=$struttura.data_map.responsabile}
                        {/if}
                    </p>
                {/if}
            </div>
        {/if}

        {if $dipendenti|count()}
            <div class="openpa-widget-content" {if count($dipendenti)|gt(15)}style="height: 180px; overflow-y: scroll; margin-bottom: 20px;"{/if}>
                <p class="Prose">Dipendenti</p>
                {foreach $dipendenti as $item}
                    <p class="Prose">
                        <a href={$item.url_alias|ezurl()}>{$item.name}</a>
                        {def $telefoni_correlati=fetch('content', 'list',hash('parent_node_id', openpaini( 'ControlloUtenti', 'telefoni' ),'extended_attribute_filter', hash('id', 'ObjectRelationFilter','params', array(openpaini( 'ControlloUtenti', 'utente_telefono_attribute_ID' ), $item.contentobject_id) ) ) )}
                        {if $telefoni_correlati|count()}
                            {foreach $telefoni_correlati as $tel_correlato}
                                <small>
                                    {$tel_correlato.name}
                                    {if $tel_correlato.data_map.numero_interno.has_content}
                                        (interno: {attribute_view_gui attribute=$tel_correlato.data_map.numero_interno})
                                    {/if}
                                </small>
                            {/foreach}
                        {elseif is_set( $item.data_map.telefono )}
                            <small>{attribute_view_gui attribute=$item.data_map.telefono}</small>
                        {/if}
                        {undef $telefoni_correlati}
                    </p>
                {/foreach}


                {if $informatici|count()}
                    <p class="Prose">Referenti informatici</p>
                    {foreach $informatici as $item}
                        <p class="Prose"><a href={$item.url_alias|ezurl()}>{$item.name}</a></p>
                    {/foreach}
                {/if}

                {if $editors|count()}
                    <p class="Prose">Redattori sito/intranet</p>
                    {foreach $editors as $item}
                        <p class="Prose"><a href={$item.url_alias|ezurl()}>{$item.name}</a></p>
                    {/foreach}
                {/if}
            </div>
        {/if}
    </div>
{/if}

