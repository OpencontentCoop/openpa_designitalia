{default attribute_base=ContentObjectAttribute placeholder=false()}
<div class="Form-field{if $attribute.has_validation_error} has-error{/if}">
    <label class="Form-label {if $attribute.is_required}is-required{/if}" for="ezcoa-{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}">
        {first_set( $contentclass_attribute.nameList[$content_language], $contentclass_attribute.name )|wash}
        {if $attribute.is_information_collector} <em class="collector">{'information collector'|i18n( 'design/admin/content/edit_attribute' )}</em>{/if}
        {if $attribute.is_required} ({'richiesto'|i18n('design/ocbootstrap/designitalia')}){/if}
    </label>

    {section show=$attribute.content.author_list}
        <table class="table" cellspacing="0">
            <tr>
                <th>{'Name'|i18n( 'design/standard/content/datatype' )}</th>
                <th>{'Email'|i18n( 'design/standard/content/datatype' )}</th>
            </tr>
            {section name=Author loop=$attribute.content.author_list sequence=array( bglight, bgdark )}
                <tr class="{$Author:sequence}">
                    {* Name. *}
                    <td>
                        <input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_name_{$Author:index}" class="form-control" type="text" name="{$attribute_base}_data_author_name_{$attribute.id}[]" value="{$Author:item.name|wash}" />
                        <input type="hidden" name="{$attribute_base}_data_author_id_{$attribute.id}[]" value="{$Author:item.id}" />
                    </td>

                    {* Email. *}
                    <td><input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_email_{$Author:index}" class="form-control" type="text" name="{$attribute_base}_data_author_email_{$attribute.id}[]" value="{$Author:item.email|wash}" /></td>

                </tr>
            {/section}
        </table>
    {/section}


    {if $attribute.content.author_list|count()|eq(0)}
        <input class="btn btn-sm btn-success" type="submit" name="CustomActionButton[{$attribute.id}_new_author]" value="{'Add author'|i18n('design/standard/content/datatype')}" title="{'Add a new row to the author list.'|i18n( 'design/standard/content/datatype' )}" />
    {/if}
</div>
{/default}
