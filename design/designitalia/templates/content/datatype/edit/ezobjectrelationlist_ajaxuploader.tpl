{*$class_content.class_constraint_list|contains( 'image', 'file', 'file_pdf' )		 *}
{if and( is_set( $class_content.class_constraint_list ),
		 $class_content.class_constraint_list|count|ne( 0 ),
     ezini( 'ObjectRelationsMultiupload', 'ClassAttributeIdentifiers', 'ocoperatorscollection.ini' )|contains( $attribute.contentclass_attribute_identifier )
)}

<div id="{concat('multiupload-', $attribute.id, '-container')}" class="pull-left">
    <span class="btn btn-success u-padding-all-s fileinput-button">
        <i class="add glyphicon glyphicon-plus"></i>
        <i class="spinner fa a fa-circle-o-notch fa-spin" style="display: none"></i>
        <span>Inserisci file</span>
        <!-- The file input field used as target for the file upload widget -->
        <input id="{concat('multiupload-', $attribute.id)}" type="file" name="files[]" multiple>
    </span>
</div>

{def $start_node = cond( and( is_set( $class_content.default_placement.node_id ), $class_content.default_placement.node_id|ne( 0 ) ),
                                $class_content.default_placement.node_id,
								'auto' )}

{ezscript_require( array( 'ezjsc::jquery', 'ezjsc::jqueryio', 'ezjsc::jqueryUI', 'plugins/jquery.fileupload/jquery.fileupload.js' ) )}
{ezcss_require( 'plugins/jquery.fileupload/jquery.fileupload.css' )}
<script type="text/javascript">
{literal}
$(function () {
    'use strict';
    $({/literal}'#{concat('multiupload-', $attribute.id)}'{literal}).fileupload({
        url: {/literal}{concat('ocbtools/upload/',$attribute.id, '/', $attribute.version, '/', $start_node)|ezurl()}{literal},
        acceptFileTypes: "{/literal}{$attribute|multiupload_file_types_string_from_attribute()}{literal}",
        dataType: 'json',
        submit: function (e, data) {
            $("{/literal}#{concat('multiupload-', $attribute.id, '-container')}{literal} .spinner").show();
            $("{/literal}#{concat('multiupload-', $attribute.id, '-container')}{literal} .add").hide();
        },
        done: function (e, data) {
            if ( data.result.errors.length > 0 ){
                alert('Error');
                $("{/literal}#{concat('multiupload-', $attribute.id, '-container')}{literal} .spinner").hide();
                $("{/literal}#{concat('multiupload-', $attribute.id, '-container')}{literal} .add").show();
            }else{
                var container = $("{/literal}#{concat('multiupload-', $attribute.id, '-container')}{literal} .spinner").hide();
                var id = data.result.contentobject_id;
                var priority = parseInt(container.parent().prev().find('input[name^="ContentObjectAttribute_priority"]:last-child').val()) || 0;
                priority++;
                $.ez('ezjsctemplate::relation_list_row::'+id+'::{/literal}{$attribute.id}{literal}::'+priority+'::?ContentType=json', false, function(content){
                    if (content.error_text.length) {
                        alert(content.error_text);
                    }else{
                        var table = container.parents( ".ezcca-edit-datatype-ezobjectrelationlist" ).find('table').show().removeClass('hide');
                        table.find('tr.hide').before(content.content);
                    }
                    $("{/literal}#{concat('multiupload-', $attribute.id, '-container')}{literal} .spinner").hide();
                    $("{/literal}#{concat('multiupload-', $attribute.id, '-container')}{literal} .add").show();
                });
            }
        }
    }).prop('disabled', !$.support.fileInput)
            .parent().addClass($.support.fileInput ? undefined : 'disabled');
});
{/literal}
</script>

{/if}
