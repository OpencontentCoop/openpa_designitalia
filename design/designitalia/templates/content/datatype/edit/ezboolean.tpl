{default attribute_base=ContentObjectAttribute  html_class='full' placeholder=false()}
<fieldset class="Form-field Form-field--choose Grid-cell">
    <label class="Form-label Form-label--block"
           for="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}">
        <input class="Form-input"
               id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}"
               name="{$attribute_base}_data_boolean_{$attribute.id}"
               {$attribute.data_int|choose( '', 'checked="checked"' )}
               value=""
               {if $attribute.is_required}aria-required="true" required=""{/if} type="checkbox">
        <span class="Form-fieldIcon" role="presentation"></span>

        {$attribute.contentclass_attribute.name|wash()}
        {if $contentclass_attribute.description}
            <em class="attribute-description">{first_set( $contentclass_attribute.descriptionList[$content_language], $contentclass_attribute.description)|wash}</em>
        {/if}

    </label>
</fieldset>

{/default}
