{def $dipendenti = fetch( 'openpa', 'dipendenti', hash( 'struttura', $struttura ) )
$informatici = fetch( 'openpa', 'dipendenti', hash( 'struttura', $struttura, 'subtree', array( openpaini( 'ControlloUtenti', 'referenti_informatici' ) ) ) )
$editors = fetch( 'openpa', 'dipendenti', hash( 'struttura', $struttura, 'subtree', array( openpaini( 'ControlloUtenti', 'redattori' ) ) ) )}

{if $dipendenti|count()}
    <div class="openpa-widget attribute-personale">

        <h3 class="openpa-widget-title">Personale</h3>

        <div class="openpa-widget-content" {if count($dipendenti)|gt(15)}style="height: 180px; overflow-y: scroll; margin-bottom: 20px;"{/if}>
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
                <h5>Referenti informatici</h5>
                {foreach $informatici as $item}
                    <p class="Prose"><a href={$item.url_alias|ezurl()}>{$item.name}</a></p>
                {/foreach}
            {/if}

            {if $editors|count()}
                <h5>Redattori sito/intranet</h5>
                {foreach $editors as $item}
                    <p class="Prose"><a href={$item.url_alias|ezurl()}>{$item.name}</a></p>
                {/foreach}
            {/if}
        </div>

    </div>
{/if}
