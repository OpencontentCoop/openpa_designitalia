{ezcss_require( array(
    'jqmodal.css',
    'tagssuggest.css',
    'contentstructure-tree.css',
    'jstree/eztags/style.css'
))}

{ezscript_require( array(
    'ezjsc::jquery',
    'ezjsc::jqueryio',
    'ezjsc::jqueryUI',
    'jqmodal.js',
    'jstree.min.js',
    'jquery.eztags.js',
    'jquery.eztags.select.js',
    'jquery.eztags.tree.js',
    'tagsstructuremenu.js'
))}

{default attribute_base='ContentObjectAttribute' html_class='full' placeholder=false()}

<div class="Form-field{if $attribute.has_validation_error} has-error{/if}">

    <legend class="Form-label {if $attribute.is_required}is-required{/if}" for="ezcoa-{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}">
        {first_set( $contentclass_attribute.nameList[$content_language], $contentclass_attribute.name )|wash}
        {if $attribute.is_information_collector} <em class="collector">{'information collector'|i18n( 'design/admin/content/edit_attribute' )}</em>{/if}
        {if $attribute.is_required} ({'richiesto'|i18n('design/ocbootstrap/designitalia')}){/if}
    </legend>

    {if $contentclass_attribute.description}
        <em class="attribute-description">{first_set( $contentclass_attribute.descriptionList[$content_language], $contentclass_attribute.description)|wash}</em>
    {/if}

    {def $permission_array = $attribute.content.permission_array}
    {def $builder = 'Default'}
    {if $attribute.contentclass_attribute.data_text1}
        {set $builder = $attribute.contentclass_attribute.data_text1}
    {/if}

    <div class="eztags-wrapper">
        <div id="eztags{$attribute.id}" class="tagssuggest"
             data-eztags
             data-builder="{$builder|wash}"
             data-max-results="{ezini( 'GeneralSettings', 'MaxResults', 'eztags.ini' )}"
             data-has-add-access="{cond( $permission_array.can_add, 'true', true(), 'false' )}"
             data-subtree-limit="{$attribute.contentclass_attribute.data_int1}"
             data-hide-root-tag="{$attribute.contentclass_attribute.data_int3}"
             data-max-tags="{if $attribute.contentclass_attribute.data_int4|gt( 0 )}{$attribute.contentclass_attribute.data_int4}{else}0{/if}"
             data-locale="{$attribute.language_code}"
             data-icon-path="{'eng-GB'|flag_icon()|explode('src="')|extract_right(1)|implode('')|explode('eng-GB')|extract_left(1)|implode('')}"
        >
            <input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}" class="tagnames" type="hidden" name="{$attribute_base}_eztags_data_text_{$attribute.id}" value="{$attribute.content.keyword_string|wash}"  />
            <input id="ezcoa2-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}" class="tagpids" type="hidden" name="{$attribute_base}_eztags_data_text2_{$attribute.id}" value="{$attribute.content.parent_string|wash}"  />
            <input id="ezcoa3-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}" class="tagids" type="hidden" name="{$attribute_base}_eztags_data_text3_{$attribute.id}" value="{$attribute.content.id_string|wash}"  />
            <input id="ezcoa4-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}" class="taglocales" type="hidden" name="{$attribute_base}_eztags_data_text4_{$attribute.id}" value="{$attribute.content.locale_string|wash}"  />
        </div>

        {include uri=concat( 'design:content/datatype/edit/view/', $builder|downcase, '.tpl' )}
    </div>

<script>
{run-once}
$.EzTags.Base.defaults.translations = {ldelim}{*
*}"selectedTags":"{'Selected tags'|i18n( 'extension/eztags/datatypes' )}",{*
*}"loading":"{'Loading'|i18n( 'extension/eztags/datatypes' )}...",{*
*}"noSelectedTags":"{'There are no selected tags'|i18n( 'extension/eztags/datatypes' )}",{*
*}"suggestedTags":"{'Suggested tags'|i18n( 'extension/eztags/datatypes' )}",{*
*}"noSuggestedTags":"{'There are no tags to suggest'|i18n( 'extension/eztags/datatypes' )}",{*
*}"addNew":"{'Add new'|i18n( 'extension/eztags/datatypes' )}",{*
*}"clickAddThisTag":"{'Click to add this tag'|i18n( 'extension/eztags/datatypes' )}",{*
*}"removeTag":"{'Remove tag'|i18n( 'extension/eztags/datatypes' )}",{*
*}"translateTag":"{'Translate tag'|i18n( 'extension/eztags/datatypes' )}",{*
*}"existingTranslations":"{'Existing translations'|i18n( 'extension/eztags/datatypes' )}",{*
*}"noExistingTranslations":"{'No existing translations'|i18n( 'extension/eztags/datatypes' )}",{*
*}"addTranslation":"{'Add translation'|i18n( 'extension/eztags/datatypes' )}",{*
*}"cancel":"{'Cancel'|i18n( 'extension/eztags/datatypes' )}",{*
*}"ok":"{'OK'|i18n( 'extension/eztags/datatypes' )}",{*
*}{rdelim};
{/run-once}
</script>

</div>
{/default}

{run-once}
<style>{literal}
.eztags-wrapper{font-size: .875em}
.tagssuggest-ui:before, .tagssuggest-ui:after{content: " ";display: table;}
.tagssuggest-ui:after{clear: both;}

.tagssuggest-ui .tags-output{float: left;width: 50%}
.tagssuggest-ui .tags-input{float: right;width: 50%}

div.tagssuggestfieldwrap{float: left;width: 65%;margin: 0}
div.tagssuggestfieldwrap .tags-input-field{margin: 0;width: 100%;height: 33px;font-size: 1.5em;}
.tags-input .button-add-tag{float: right;max-width: 50%}
.tags-input input[disabled]{
    display: inline-block;
    margin-bottom: 0;
    font-weight: normal;
    text-align: center;
    vertical-align: middle;    
    background-image: none;
    border: 1px solid transparent;
    white-space: nowrap;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857;
    border-radius: 4px;
    text-transform: uppercase;
}
div.jsonSuggestResults{border: none;}
.js-autocomplete-item img,
ul.js-tags-selected li img, 
div.tagssuggest div.tags-suggested ul li.js-suggested-item img{display: none;}
.js-autocomplete-item{font-size: 1.5em;}
.js-autocomplete-item span{padding-left: 5px;font-size: .7em;font-style: italic;}
div.tagssuggest ul.js-tags-selected li, div.tagssuggest div.tags-suggested ul li.js-suggested-item{border: none;border-radius: 0}
div.ez-tags-tree-selector{max-width: none;width: 100%}
.tags-list .no-results{font-size: .7em;font-style: italic;}
{/literal}</style>
{/run-once}
