{def $roles = fetch( 'openpa', 'ruoli', hash( 'struttura_object_id', $struttura.contentobject_id ) )}

{def $dipendenti = fetch( 'openpa', 'dipendenti', hash( 'struttura', $struttura ) )
     $informatici = fetch( 'openpa', 'dipendenti', hash( 'struttura', $struttura, 'subtree', array( openpaini( 'ControlloUtenti', 'referenti_informatici' ) ) ) )
     $editors = fetch( 'openpa', 'dipendenti', hash( 'struttura', $struttura, 'subtree', array( openpaini( 'ControlloUtenti', 'redattori' ) ) ) )}

{if or( $dipendenti|count(), or( $roles|count(), and( is_set( $struttura.data_map.responsabile ), $struttura.data_map.responsabile.has_content ) ) )}

    {def $already_output = array()}    

    <section class="Prose Alert Alert--info">

        <h3 class="openpa-widget-title">Personale</h3>

        <div class="openpa-widget attribute-ruoli Prose">             
        
            <ul>            
            
                {if or( $roles|count(), and( is_set( $struttura.data_map.responsabile ), $struttura.data_map.responsabile.has_content ) )}
                    {if $roles|count()}
                        {foreach $roles as $item}
                            <li>
                                <strong>{$item.name|wash()}: </strong>
                                <a href= {$item.url_alias|ezurl()}>                                    
                                    {foreach $item.data_map.utente.content.relation_list as $relation}
                                        {set $already_output = $already_output|append($relation.contentobject_id)}
                                        {content_view_gui view=dipendente_link_e_telefono content_object=fetch(content, object, hash(object_id, $relation.contentobject_id))}
                                    {/foreach}
                                </a>
                            </li>
                        {/foreach}

                    {elseif and( is_set( $struttura.data_map.responsabile ), $struttura.data_map.responsabile.has_content )}
                        <li>
                            <strong>{$struttura.data_map.responsabile.contentclass_attribute_name}</strong>
                            {if $struttura.data_map.responsabile.has_content}                                
                                {foreach $struttura.data_map.responsabile.content.relation_list as $relation}
                                    {set $already_output = $already_output|append($relation.contentobject_id)}
                                    {content_view_gui view=dipendente_link_e_telefono content_object=fetch(content, object, hash(object_id, $relation.contentobject_id))}
                                {/foreach}
                            {/if}
                        </li>
                    {/if}
                {/if}

                {if $dipendenti|count()}

                    {def $output_dipendenti = array()}
                    {def $output_informatici = array()}
                    {def $output_editors = array()}

                    {foreach $dipendenti as $item}
                        {if $already_output|contains($item.contentobject_id)|not()}
                            {set $output_dipendenti = $output_dipendenti|append($item)}
                        {/if}
                    {/foreach}

                    {foreach $informatici as $item}
                        {if $already_output|contains($item.contentobject_id)|not()}
                            {set $output_informatici = $output_informatici|append($item)}
                        {/if}
                    {/foreach}

                    {foreach $editors as $item}
                        {if $already_output|contains($item.contentobject_id)|not()}
                            {set $output_editors = $output_editors|append($item)}
                        {/if}
                    {/foreach}

                    {if or($output_dipendenti|count(), $output_informatici|count(), $output_editors|count())}
                        {if $output_dipendenti|count()}
                            <li>
                                <strong>Dipendenti:</strong>
                                <ul style="max-height: 180px; overflow-y: auto; margin-bottom: 20px;">
                                {foreach $output_dipendenti as $item}
                                    <li>
                                        {content_view_gui view=dipendente_link_e_telefono content_object=$item.object}
                                    </li>
                                {/foreach}
                                </ul>
                            </li>
                        {/if}

                        {if $output_informatici|count()}
                            <li>
                                <strong>Referenti informatici:</strong>
                                <ul>
                                {foreach $output_informatici as $item}
                                    <li>
                                        {content_view_gui view=dipendente_link_e_telefono content_object=$item.object}
                                    </li>
                                {/foreach}
                                </ul>
                            </li>
                        {/if}

                        {if $output_editors|count()}
                            <li>
                                <strong>Redattori:</strong>
                                <ul>
                                {foreach $ouput_editors as $item}
                                    <li>
                                        {content_view_gui view=dipendente_link_e_telefono content_object=$item.object}
                                    </li>
                                {/foreach}
                                </ul>
                            </li>
                        {/if}
                    {/if}
                {/if}
            </ul>
        </div>
    </section>
{/if}

