{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{default attribute_base=ContentObjectAttribute}

<div class="Form-field{if $attribute.has_validation_error} has-error{/if}">
    {* Always set the .._selected_array_.. variable, this circumvents the problem when nothing is selected. *}
    <input type="hidden" name="{$attribute_base}_ezselect_selected_array_{$attribute.id}" value=""/>
    <label class="Form-label {if $attribute.is_required}is-required{/if}"
           for="ezcoa-{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}">
        {first_set( $contentclass_attribute.nameList[$content_language], $contentclass_attribute.name )|wash}
        {if $attribute.is_information_collector} <em class="collector">{'information collector'|i18n( 'design/admin/content/edit_attribute' )}</em>{/if}
        {if $attribute.is_required} ({'required'|i18n('design/ocbootstrap/designitalia')}){/if}
    </label>

    {if $contentclass_attribute.description}
        <em class="attribute-description">{first_set( $contentclass_attribute.descriptionList[$content_language], $contentclass_attribute.description)|wash}</em>
    {/if}

    <div class="Grid Grid--withGutter">
    	<div class="Grid-cell u-sizeFull u-sm-size1of3 u-md-size1of3 u-lg-size1of3">
    		<label class="Form-label" for="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_price">
    			<em>{'Price'|i18n( 'design/standard/class/datatype' )}:</em>    			
			</label>
			<input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_price" 
				   class="Form-input ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" 
				   type="text" 
				   name="{$attribute_base}_data_price_{$attribute.id}" 
				   size="12" 
				   value="{$attribute.content.price|l10n( clean_currency )}" />
			{if $attribute.class_content.is_vat_included}
				{* Entered price already includes VAT. *}
			{else}
				&nbsp;(+ {$attribute.content.selected_vat_type.name}, {$attribute.content.selected_vat_type.percentage}%)
			{/if}
    	</div>
    	<div class="Grid-cell u-sizeFull u-sm-size1of3 u-md-size1of3 u-lg-size1of3">
    		<label class="Form-label" for="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_vat">
				<em>{'VAT'|i18n( 'design/standard/class/datatype' )}:</em>
			</label>
			<select id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_vat" 
					class="Form-input ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" 
					name="{$attribute_base}_ezprice_inc_ex_vat_{$attribute.id}">
				<option value="1" {if eq( $attribute.content.is_vat_included, true() )}selected="selected"{/if}>{'Price inc. VAT'|i18n( 'design/standard/class/datatype' )}</option>
				<option value="2" {if eq( $attribute.content.is_vat_included, false() )}selected="selected"{/if}>{'Price ex. VAT'|i18n( 'design/standard/class/datatype' )}</option>
			</select>

    	</div>
    	<div class="Grid-cell u-sizeFull u-sm-size1of3 u-md-size1of3 u-lg-size1of3">
    		<label class="Form-label"><em>{'VAT type'|i18n( 'design/standard/class/datatype' )}:</em></label>
			{include uri='design:shop/vattype/edit.tpl'
			         select_name=concat( $attribute_base, "_ezprice_vat_id_", $attribute.id )
			         vat_types=$attribute.content.vat_type
			         current_val=$attribute.content.selected_vat_type.id}
    	</div>
    </div>

</div>

{/default}
