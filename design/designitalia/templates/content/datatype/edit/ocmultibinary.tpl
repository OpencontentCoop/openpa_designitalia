{default attribute_base=ContentObjectAttribute}
<div class="Form-field{if $attribute.has_validation_error} has-error{/if}">
    <label class="Form-label {if $attribute.is_required}is-required{/if}"
           for="ezcoa-{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}">
        {first_set( $contentclass_attribute.nameList[$content_language], $contentclass_attribute.name )|wash}
        {if $attribute.is_information_collector} <em
                class="collector">{'information collector'|i18n( 'design/admin/content/edit_attribute' )}</em>{/if}
        {if $attribute.is_required} ({'richiesto'|i18n('design/ocbootstrap/designitalia')}){/if}
    </label>

    <div id="uploader_{$attribute_base}_data_multibinaryfilename_{$attribute.id}">

        <div class="clearfix upload-file-list">
            {include uri="design:content/datatype/view/filelist.tpl" attribute=$attribute}
        </div>

        {def $file_count = 0}
        {if $attribute.has_content}
            {set $file_count = $attribute.content|count()}
        {/if}
        {if or($file_count|lt( $attribute.contentclass_attribute.data_int2 ), $attribute.contentclass_attribute.data_int2|eq(0) )}
            <div class="clearfix upload-button-container">
                <span class="btn btn-info fileinput-button">
                    <i class="fa fa-plus"></i>
                    <span>Aggiungi file</span>
                    <input class="upload" type="file" name="OcMultibinaryFiles[]" data-url="{concat('ocmultibinary/upload/', $attribute.id, '/', $attribute.version, '/', $attribute.language_code  )|ezurl(no)}" />
                </span>
            </div>
            <div class="clearfix upload-button-spinner" style="display: none">
                <i class="fa fa-cog fa-spin fa-3x"></i>
            </div>
        {/if}


    </div>
</div>
{/default}


{ezscript_require( array( 'ezjsc::jquery', 'ezjsc::jqueryio', 'ezjsc::jqueryUI', 'jquery.fileupload.js','jquery.ocmultibinary.js') )}
{ezcss_require( 'jquery.fileupload.css' )}


<script>
    $(document).ready(function(){ldelim}
        $('#uploader_{$attribute_base}_data_multibinaryfilename_{$attribute.id}').ocmultibinary();
        {rdelim});
</script>
