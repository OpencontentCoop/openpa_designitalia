{default attribute_base='ContentObjectAttribute' html_class='full' placeholder=false()}
    <div class="Form-field{if $attribute.has_validation_error} has-error{/if}">
        <label class="Form-label {if $attribute.is_required}is-required{/if}" for="ezcoa-{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}">
            {first_set( $contentclass_attribute.nameList[$content_language], $contentclass_attribute.name )|wash}
            {if $attribute.is_information_collector} <em class="collector">{'information collector'|i18n( 'design/admin/content/edit_attribute' )}</em>{/if}
            {if $attribute.is_required} ({'richiesto'|i18n('design/ocbootstrap/designitalia')}){/if}
        </label>

        {if $contentclass_attribute.description}
            <em class="attribute-description">{first_set( $contentclass_attribute.descriptionList[$content_language], $contentclass_attribute.description)|wash}</em>
        {/if}

        <textarea
                id="ezcoa-{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}"
                class="Form-input ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}"
                name="{$attribute_base}_data_text_{$attribute.id}"
                cols="70"
                rows="{$attribute.contentclass_attribute.data_int1}">{$attribute.content|wash}</textarea>
    </div>
{/default}
