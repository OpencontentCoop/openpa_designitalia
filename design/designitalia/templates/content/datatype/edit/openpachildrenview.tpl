{default attribute_base=ContentObjectAttribute html_class='full'}
{let selected_id_array=$attribute.content.options
     extra_configs=$attribute.content.extra_configs}

    <div class="Form-field{if $attribute.has_validation_error} has-error{/if}">
        {* Always set the .._selected_array_.. variable, this circumvents the problem when nothing is selected. *}
        <input type="hidden" name="{$attribute_base}_openpachildrenview_selected_array_{$attribute.id}" value=""/>
        <label class="Form-label {if $attribute.is_required}is-required{/if}"
               for="ezcoa-{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}">
            {first_set( $contentclass_attribute.nameList[$content_language], $contentclass_attribute.name )|wash}
            {if $attribute.is_information_collector} <em class="collector">{'information collector'|i18n( 'design/admin/content/edit_attribute' )}</em>{/if}
            {if $attribute.is_required} ({'richiesto'|i18n('design/ocbootstrap/designitalia')}){/if}
        </label>

        {if $contentclass_attribute.description}
            <em class="attribute-description">{first_set( $contentclass_attribute.descriptionList[$content_language], $contentclass_attribute.description)|wash}</em>
        {/if}

        <select id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}"
                class="Form-input ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}"
                name="{$attribute_base}_openpachildrenview_selected_array_{$attribute.id}[]"
                {if $attribute.class_content.is_multiselect}multiple style="background-image: none"{/if}>
            {foreach $attribute.class_content.views as $view}
                <option value="{$view.id}"
                        {if $selected_id_array|contains( $view.id )}selected="selected"{/if}>
                    {$view.label|wash( xhtml )}
                </option>
            {/foreach}
        </select>
    </div>

    {foreach $attribute.class_content.views as $view}
        {if $view.edit_template}
            {include uri=concat('design:content/datatype/edit/openpachildrenview/', $view.identifier, '.tpl')}
        {/if}
    {/foreach}

{/let}
{/default}
