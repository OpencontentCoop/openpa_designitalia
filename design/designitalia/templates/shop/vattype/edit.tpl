{* DO NOT EDIT THIS FILE! Use an override template instead. *}
<select class="Form-input" name="{$select_name|wash}">
{foreach $vat_types as $vat_type}
<option value="{$vat_type.id}" {if eq( $vat_type.id, $current_val )}selected="selected"{/if}>{$vat_type.name|wash}{if $vat_type.is_dynamic|not}, {$vat_type.percentage}%{/if}</option>
{/foreach}
</select>