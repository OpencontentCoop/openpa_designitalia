{def $roles = fetch( 'openpa', 'ruoli', hash( 'struttura_object_id', $struttura.contentobject_id ) )}
{if or( $roles|count(), and( is_set( $struttura.data_map.responsabile ), $struttura.data_map.responsabile.has_content ) )}
    {if $roles|count()}
        {foreach $roles as $item}
            <div class="openpa-widget attribute-responsabile">
                <p class="Prose">
                    <strong>{$item.name|wash()}</strong>
                    <a href= {$item.url_alias|ezurl()}>
                        {attribute_view_gui attribute=$item.data_map.utente}
                    </a>
                </p>

            </div>
        {/foreach}

    {elseif and( is_set( $struttura.data_map.responsabile ), $struttura.data_map.responsabile.has_content )}
        <div class="openpa-widget attribute-responsabile">
            <p class="Prose">
                <strong>{$struttura.data_map.responsabile.contentclass_attribute_name}</strong>
                {if $struttura.data_map.responsabile.has_content}
                    {attribute_view_gui attribute=$struttura.data_map.responsabile}
                {/if}
            </p>
        </div>
    {/if}
{/if}
{undef $roles}
