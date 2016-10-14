{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{default attribute_base=ContentObjectAttribute html_class='full' placeholder=false()}

{if ne( $attribute_base, 'ContentObjectAttribute' )}
    {def $id_base = concat( 'ezcoa-', $attribute_base, '-', $attribute.contentclassattribute_id, '_', $attribute.contentclass_attribute_identifier )}
{else}
    {def $id_base = concat( 'ezcoa-', $attribute.contentclassattribute_id, '_', $attribute.contentclass_attribute_identifier )}
{/if}

{def $contentclass_attribute = $attribute.contentclass_attribute}
<fieldset class="Form-field{if $attribute.has_validation_error} has-error{/if}">
    <legend class="Form-label {if $attribute.is_required}is-required{/if}">
        {first_set( $contentclass_attribute.nameList[$content_language], $contentclass_attribute.name )|wash}
        {if $attribute.is_information_collector} <em class="collector">{'information collector'|i18n( 'design/admin/content/edit_attribute' )}</em>{/if}
        {if $attribute.is_required} ({'richiesto'|i18n('design/ocbootstrap/designitalia')}){/if}
    </legend>

    {if $contentclass_attribute.description}
        <em>{first_set( $contentclass_attribute.descriptionList[$content_language], $contentclass_attribute.description)|wash}</em>
    {/if}

    <label class="Form-label" for="{$id_base}_url">Url</label>
    <input placeholder="http://www.google.com" id="{$id_base}_url" class="Form-input" type="text" name="{$attribute_base}_ezurl_url_{$attribute.id}" value="{$attribute.content|wash( xhtml )} {if $attribute.is_required}required aria-required="true"{/if}" />
    <label class="Form-label" for="{$id_base}_text">{'Text'|i18n( 'design/standard/content/datatype' )}</label>
    <input id="{$id_base}_text" class="Form-input" type="text" name="{$attribute_base}_ezurl_text_{$attribute.id}" value="{$attribute.data_text|wash( xhtml )}" />

</fieldset>
{undef $contentclass_attribute}


{/default}
