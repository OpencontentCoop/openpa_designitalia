{default attribute_base=ContentObjectAttribute}

{def $contentclassattribute = $attribute.contentclass_attribute}
<fieldset class="Form-field{if $attribute.has_validation_error} has-error{/if}">
    <legend class="Form-label {if $attribute.is_required}is-required{/if}">
        {first_set( $contentclassattribute.nameList[$content_language], $contentclassattribute.name )|wash}
        {if $attribute.is_information_collector} <em class="collector">{'information collector'|i18n( 'design/admin/content/edit_attribute' )}</em>{/if}
        {if $attribute.is_required} ({'required'|i18n('design/ocbootstrap/designitalia')}){/if}
    </legend>

{set $attribute = fill_contacts_matrix( $attribute )}

{let matrix=$attribute.content}

{def $rows = $matrix.rows.sequential}

    <table cellspacing="0" class="list">
        <tbody>
        {foreach contacts_matrix_fields() as $index => $name}
            <tr>
                <td>
                    <input type="hidden" value="{$name}" name="{$attribute_base}_ezmatrix_cell_{$attribute.id}[]" />
                    <label class="Form-label" for="contact-{$index}">{$name}</label>

                </td>
                <td>
                    <input class="Form-input" type="text" id="contact-{$index}" value="{$rows[$index].columns[1]|wash()}" name="{$attribute_base}_ezmatrix_cell_{$attribute.id}[]">
                </td>
            </tr>
        {/foreach}
        </tbody>
    </table>
{undef $rows}
{/let}

</fieldset>
{undef $contentclassattribute}
{/default}
