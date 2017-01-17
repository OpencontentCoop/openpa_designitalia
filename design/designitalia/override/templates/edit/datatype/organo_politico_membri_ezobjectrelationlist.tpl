{let class_content=$attribute.class_content
     class_list=fetch( class, list, hash( class_filter, $class_content.class_constraint_list ) )
     new_object_initial_node_placement=false()
     browse_object_start_node=false()
}

{default html_class='full' placeholder=false()}

<fieldset class="Form-field {if array(2,3)|contains($class_content.selection_type)}Form-field--choose Grid-cell{/if} {if $attribute.has_validation_error} has-error{/if}">
    <legend class="Form-label {if $attribute.is_required}is-required{/if}">
        {first_set( $contentclass_attribute.nameList[$content_language], $contentclass_attribute.name )|wash}
        {if $attribute.is_information_collector} <em class="collector">{'information collector'|i18n( 'design/admin/content/edit_attribute' )}</em>{/if}
        {if $attribute.is_required} ({'richiesto'|i18n('design/ocbootstrap/designitalia')}){/if}
    </legend>

    {if $contentclass_attribute.description}
        <em class="attribute-description">{first_set( $contentclass_attribute.descriptionList[$content_language], $contentclass_attribute.description)|wash}</em>
    {/if}


    {default attribute_base=ContentObjectAttribute}
    {let parent_node=cond( and( is_set( $class_content.default_placement.node_id ),
                           $class_content.default_placement.node_id|eq( 0 )|not ),
                           $class_content.default_placement.node_id, ezini( 'NodeSettings', 'RootNode', 'content.ini' ) )
     nodesList=cond( and( is_set( $class_content.class_constraint_list ), $class_content.class_constraint_list|count|ne( 0 ) ),
                     fetch( content, tree,
                            hash( parent_node_id, $parent_node,
                                  class_filter_type,'include',
                                  class_filter_array, $class_content.class_constraint_list,
                                  sort_by, array( 'name',true() ),
                                  main_node_only, true() ) ),
                     fetch( content, list,
                            hash( parent_node_id, $parent_node,
                                  sort_by, array( 'name', true() )
                                 ) )
                    )
    }


        {section var=node loop=$nodesList}
            <label class="Form-label Form-label--block">
                <input class="Form-input" type="checkbox" name="{$attribute_base}_data_object_relation_list_{$attribute.id}[{$node.node_id}]" value="{$node.contentobject_id}"
                {if ne( count( $attribute.content.relation_list ), 0)}
                {foreach $attribute.content.relation_list as $item}
                     {if eq( $item.contentobject_id, $node.contentobject_id )}
                            checked="checked"
                            {break}
                     {/if}
                {/foreach}
                {/if}
                />
                <span class="Form-fieldIcon" role="presentation"></span> {$node.name|wash}
            </label>
        {/section}
        {def $dirigenti = fetch( openpa, dirigenti )}
        {if count( $dirigenti )|gt(0)}
            <legend>Dipendenti con ruolo dirigenziale:</legend>
            {foreach $dirigenti as $dirigente}
                <label class="Form-label Form-label--block">
                    <input class="Form-input" type="checkbox" name="{$attribute_base}_data_object_relation_list_{$attribute.id}[{$dirigente.node_id}]" value="{$dirigente.contentobject_id}"
                    {if ne( count( $attribute.content.relation_list ), 0)}
                    {foreach $attribute.content.relation_list as $item}
                         {if eq( $item.contentobject_id, $dirigente.contentobject_id )}
                                checked="checked"
                                {break}
                         {/if}
                    {/foreach}
                    {/if}
                    />
                    <span class="Form-fieldIcon" role="presentation"></span> {$dirigente.name|wash} <br/>
                </label>
            {/foreach}
        {/if}

    {if eq( count( $nodesList ), 0 )}
        {def $parentnode = fetch( 'content', 'node', hash( 'node_id', $parent_node ) )}
        {if is_set( $parentnode )}
            <p>{'Parent node'|i18n( 'design/standard/content/datatype' )}: {node_view_gui content_node=$parentnode view=text_linked} </p>
        {/if}
        <p>{'Allowed classes'|i18n( 'design/standard/content/datatype' )}:</p>
        {if ne( count( $class_content.class_constraint_list ), 0 )}
             <ul>
             {foreach $class_content.class_constraint_list as $class}
                   <li>{$class}</li>
             {/foreach}
             </ul>
        {else}
             <ul>
                   <li>{'Any'|i18n( 'design/standard/content/datatype' )}</li>
             </ul>
        {/if}
        <p>{'There are no objects of allowed classes'|i18n( 'design/standard/content/datatype' )}.</p>
    {/if}

</fieldset>

{/let}

{*
{/if}
*}
