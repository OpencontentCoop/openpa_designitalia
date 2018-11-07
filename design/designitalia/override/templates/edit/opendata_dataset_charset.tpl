{def $charsets = fetch_charsets()}
{default attribute_base=ContentObjectAttribute placeholder=false()}
<div class="Form-field{if $attribute.has_validation_error} has-error{/if}">
    <label class="Form-label {if $attribute.is_required}is-required{/if}" for="ezcoa-{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}">
        {first_set( $contentclass_attribute.nameList[$content_language], $contentclass_attribute.name )|wash}
        {if $attribute.is_information_collector} <em class="collector">{'information collector'|i18n( 'design/admin/content/edit_attribute' )}</em>{/if}
        {if $attribute.is_required} ({'richiesto'|i18n('design/ocbootstrap/designitalia')}){/if}
    </label>
    <select class="form-control" name="{$attribute_base}_ezstring_data_text_{$attribute.id}">
        <option value=""></option>
        {foreach $charsets as $name}
        <option value="{$name}"{if and( $attribute.has_content, $attribute.data_text|eq($name) )}selected="selected"{/if}>
            {$name}
        </option>
        {/foreach}
    </select>
</div>
{/default}
