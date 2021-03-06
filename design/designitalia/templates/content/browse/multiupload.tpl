{def $number_of_items=10
     $select_name='SelectedObjectIDArray'
     $select_type='checkbox'
     $select_attribute='contentobject_id'
     $browse_list_count=0
     $page_uri_suffix=false()
     $node_array=array()
     $bookmark_list=fetch('content','bookmarks',array())
     $is_search = false()}

{if is_set( $node_list )}
    {def $page_uri=$requested_uri
         $main_node = fetch( content, node, hash(node_id, $browse.start_node ) )}
    {set $browse_list_count = $node_list_count
         $node_array        = $node_list
         $page_uri_suffix   = concat( '?', $requested_uri_suffix, '&SubTreeArray[]=', $browse.start_node )
         $is_search = true()}
{else}
    {def $page_uri=concat( '/content/browse/', $main_node.node_id )}
    {set $browse_list_count=fetch( content, list_count, hash( parent_node_id, $node_id, depth, 1, objectname_filter, $view_parameters.namefilter) )}
    {if $browse_list_count}
        {set node_array=fetch( content, list, hash( parent_node_id, $node_id,
                                                    depth, 1,
                                                    offset, $view_parameters.offset,
                                                    limit, $number_of_items,
                                                    sort_by, array( 'published', false() ),
                                                    objectname_filter, $view_parameters.namefilter ) )}
    {/if}
{/if}

{if eq( $browse.return_type, 'NodeID' )}
    {set select_name='SelectedNodeIDArray'}
    {set select_attribute='node_id'}
{/if}

{if eq( $browse.selection, 'single' )}
    {set select_type='radio'}
{/if}


{if $browse.description_template}
    {include name=Description uri=$browse.description_template browse=$browse main_node=$main_node}
{else}
    <div class="u-padding-bottom-l">
        <h1>{"Browse"|i18n("design/standard/content/browse")} - {$main_node.name|wash}</h1>
    </div>
{/if}

<form class="u-padding-bottom-l" action={"/content/search"|ezurl}>
    <div class="Grid-cell Form-field Form-field--withPlaceholder">
        <input style="padding:6px" class="Form-input u-text-r-s u-padding-r-all u-color-black"
               name="SearchText" type="text"
               value="{cond( ezhttp_hasvariable('SearchText','get'), ezhttp('SearchText','get')|wash(),'')}"
               size="12"/>
        <input type="hidden" value="{'Search'|i18n('openpa_designitalia')}" name="SearchButton"/>
        <input type="hidden" value="{$browse.start_node}" name="SubTreeArray[]"/>
        <input name="Mode" type="hidden" value="browse"/>
        <button name="SearchButton" value="{'Search'|i18n('openpa_designitalia')}" id="searchbox_submit" type="submit"
                class="u-background-40 u-color-white u-padding-all-s u-text-r-m u-textNoWrap">
            <span class="fa fa-search"></span>
        </button>
    </div>
    {if and( $is_search, count($node_array)|gt(0) )}
        <span class="input-group-btn">
          <a href={concat('content/browse/', $browse.start_node)|ezurl()} class="btn btn-danger">{'Reset search'|i18n('openpa_designitalia')}</a>
        </span>
    {/if}
</form>
{if and( $is_search, count($node_array)|eq(0) )}
    <div class="warning message-warning">
        Nessun elemento trovato <a href={concat('content/browse/', $browse.start_node)|ezurl()}>[Indietro]</a>
    </div>
{/if}

<div class="Grid Grid--withGutter">
    <div class="Grid-cell u-md-size1of2 u-lg-size1of2">

        <form class="u-padding-bottom-l" name="browse" method="post" action={$browse.from_page|ezurl}>

            <div id="selection" class="context-block" style="margin: 20px 0">
                <div class="panel panel-success">
                    <div style="background: #eee">
                        <table id="select_table" class="table" cellspacing="0">
                            <tbody></tbody>
                        </table>
                    </div>
                    {section var=PersistentData show=$browse.persistent_data loop=$browse.persistent_data}
                        <input type="hidden" name="{$PersistentData.key|wash}" value="{$PersistentData.item|wash}"/>
                    {/section}
                    <input type="hidden" name="BrowseActionName" value="{$browse.action_name}"/>
                    {if $browse.browse_custom_action}
                        <input type="hidden" name="{$browse.browse_custom_action.name}"
                               value="{$browse.browse_custom_action.value}"/>
                    {/if}
                    {if $cancel_action}
                        <input type="hidden" name="BrowseCancelURI" value="{$cancel_action}"/>
                    {/if}
                    <div class="panel-body">
                        <div class="text-center">
                            <input class="defaultbutton" type="submit" name="SelectButton" value="{'Upload'|i18n( 'design/admin/content/upload' )}"/>
                            <input class="button" type="submit" name="BrowseCancelButton" value="{'Cancel'|i18n( 'design/admin/content/browse' )}"/>
                        </div>
                    </div>
                </div>
            </div>

            {include name=navigator
                    uri='design:navigator/alphabetical.tpl'
                    page_uri=$page_uri
                    page_uri_suffix=$page_uri_suffix
                    item_count=$browse_list_count
                    view_parameters=$view_parameters
                    node_id=$browse.start_node
                    item_limit=$number_of_items}

            
            <table id="browse_table" class="table" cellspacing="0" style="margin: 20px 0">
            {def $current_node=fetch( content, node, hash( node_id, $browse.start_node ) )}
            {if and($browse.start_node|gt( 1 ), $is_search|not() )}
            <thead>
                <tr>
                    <td><a href={concat( '/content/browse/', $main_node.parent_node_id, '/' )|ezurl}><i class="fa fa-arrow-up"></i></a></td>
                    <td colspan="4">{$current_node.name|wash}&nbsp;[{$current_node.children_count}]</td>
                </tr>
            </thead>
            {/if}
            <tbody> 
                {foreach $node_array as $item}
                    <tr id="object-{$item.contentobject_id}">
                        <td>
                            {def $ignore_nodes_merge=merge( $browse.ignore_nodes_select_subtree, $item.path_array )
                            $browse_permission = true()}
                            {if $browse.permission}
                                {if $browse.permission.contentclass_id}
                                    {if is_array( $browse.permission.contentclass_id )}
                                        {foreach $browse.permission.contentclass_id as $contentclass_id}
                                            {set $browse_permission = fetch( 'content', 'access', hash( 'access', $browse.permission.access,
                                            'contentobject',   $item,
                                            'contentclass_id', $contentclass_id ) )}
                                            {if $browse_permission|not}{break}{/if}
                                        {/foreach}
                                    {else}
                                        {set $browse_permission = fetch( 'content', 'access', hash( 'access', $browse.permission.access,
                                        'contentobject',   $item,
                                        'contentclass_id', $browse.permission.contentclass_id ) )}
                                    {/if}
                                {else}
                                    {set $browse_permission = fetch( 'content', 'access', hash( 'access', $browse.permission.access,
                                    'contentobject',   $item ) )}
                                {/if}
                            {/if}
                            {if and( $browse_permission, $browse.ignore_nodes_select|contains( $item.node_id )|not, eq( $ignore_nodes_merge|count, $ignore_nodes_merge|unique|count ) )}
                                {if is_array( $browse.class_array )}
                                    {if $browse.class_array|contains( $item.object.content_class.identifier )}
                                        <input type="{$select_type}" name="{$select_name}[]"
                                               value="{$item[$select_attribute]}"/>
                                    {else}
                                        <input type="{$select_type}" name="_Disabled" value="" disabled="disabled"/>
                                    {/if}
                                {else}
                                    {if and( or( eq( $browse.action_name, 'MoveNode' ), eq( $browse.action_name, 'CopyNode' ), eq( $browse.action_name, 'AddNodeAssignment' ) ), $item.object.content_class.is_container|not )}
                                        <input type="{$select_type}" name="{$select_name}[]"
                                               value="{$item[$select_attribute]}" disabled="disabled"/>
                                    {else}
                                        <input type="{$select_type}" name="{$select_name}[]"
                                               value="{$item[$select_attribute]}"/>
                                    {/if}
                                {/if}
                            {else}
                                <input type="{$select_type}" name="_Disabled" value="" disabled="disabled"/>
                            {/if}
                        </td>
                        <td>
                            {if and( is_set($item.data_map.image), $item.data_map.image.has_content )}
                                <img data-object="{$item.contentobject_id}" class="load-preview"
                                     src="{$item.data_map.image.content['small'].url|ezroot(no)}"
                                     style="height: 60px; width: auto; max-width: 100px"/>
                            {/if}
                        </td>
                        <td class="object-name">
                            {set $ignore_nodes_merge=merge( $browse.ignore_nodes_click, $item.path_array )}
                            {if eq( $ignore_nodes_merge|count, $ignore_nodes_merge|unique|count )}
                                {if and( or( ne( $browse.action_name, 'MoveNode' ), ne( $browse.action_name, 'CopyNode' ) ), $item.object.content_class.is_container )}
                                    <a href={concat( '/content/browse/', $item.node_id )|ezurl}>{$item.name|wash}</a>
                                {else}
                                    {$item.name|wash}
                                {/if}
                            {else}
                                {$item.name|wash}
                            {/if}
                        </td>
                        <td>
                            {$item.object.content_class.name|wash}
                        </td>
                        <td>
    					  <span data-object="{$item.contentobject_id}" class="load-preview">
    						  <span class="fa fa-expand"></span>
    					  </span>
                        </td>
                    </tr>
                    {undef $ignore_nodes_merge $browse_permission}
                {/foreach}
            </tbody>
            </table>

            <input style="margin-bottom: 20px" class="pull-right Button Button--danger" type="submit" name="BrowseCancelButton" value="Esci"/>
        </form>
    </div>
    <div class="Grid-cell u-md-size1of2 u-lg-size1of2">
        <div id="preview-container"></div>
        <img id="spinner" style="display: none" src={'loader.gif'|ezimage()} alt="Attendere..."/>
    </div>
</div>


{ezscript_require( array( 'ezjsc::jquery' ) )}
{ezscript( array( 'ezjsc::jqueryio', 'jcookie.js' ) )}

<script>
    var previewIcon = {'websitetoolbar/ezwt-icon-preview.png'|ezimage()};
    {literal}
    $(document).ready(function () {

        $("#selection").hide();

        var displayImageDetail = function (e) {
            $(this).closest('table').find('tr').removeClass('success');
            $(this).closest('tr').addClass('success');
            var objectId = $(this).data('object');
            var spinner = $("#spinner").clone();
            $('#preview-container').empty().append(spinner.show().css({margin: '20px auto', display: 'block'}));
            $.ez('ezjsctemplate::preview::' + objectId, false, function (data) {
                if (data.error_text.length) {
                    alert(data.error_text);
                } else {
                    $('#preview-container').html(data.content);
                }
            });
            e.preventDefault();
        };

        var selectUnselect = function (e) {
            var selectTable = $("#select_table");
            var checkbox = $(e.currentTarget);
            var row = checkbox.closest('tr');
            if (checkbox.is(':checked')) {
                selectTable.find('tbody').append(row);
                addSelect(checkbox.val());
            } else {
                $("#browse_table").find('tbody').prepend(row);
                removeSelect(checkbox.val());
                if (selectTable.find("tr").length == 0) {
                    $("#selection").hide();
                }
            }
        };

        var addSelect = function (selection) {
            var cookies = readCookie('ocb_browse');
            if (cookies == null || cookies == '-' || cookies == '') {
                cookies = selection;
                $("#selection").show();
            } else {
                cookies += '-' + selection;
            }
            eraseCookie('ocb_browse');
            createCookie('ocb_browse', cookies);
        };

        var removeSelect = function (selection) {
            var cookie = readCookie('ocb_browse');
            var cookies = cookie.split('-');
            $.each(cookies, function (i, v) {
                if (v == selection) cookies.splice(i, 1);
            });
            eraseCookie('ocb_browse');
            createCookie('ocb_browse', cookies.join('-'));
        };

        var showSelectedItems = function () {
            var selection = $("#selection");
            var cookie = readCookie('ocb_browse');
            if (cookie != null && cookie !== '') {
                selection.show();
                var spinner = $("#spinner").clone();
                selection.prepend(spinner.show().css({margin: '20px auto', display: 'block'}));
                var cookies = cookie.split('-');
                $.each(cookies, function (i, v) {
                    $.ez('ezjsctemplate::browse_list_row::' + v + '::{/literal}{$select_type}{literal}::{/literal}{$select_name}{literal}::1', false, function (content) {
                        if (content.error_text.length) {
                            alert(content.error_text);
                        } else {
                            selection.find("#spinner").remove();
                            $('#select_table').find('tbody').prepend(content.content);
                        }
                    });
                });
            }
        };

        var inlineEdit = function () {
            $('span.inline-form').each(function () {
                $(this).hide();
                $(this).prev().show()
            });
            var editButton = $(this);
            var attributeData = editButton.data();
            var text = editButton.parent();
            var form = text.next();
            text.hide();
            form.show().find('button').bind('click', function () {
                var value = form.find(attributeData.input).val();
                form.hide();
                text.show();
                var spinner = $("#spinner").clone();
                $('#preview-container').empty().append(spinner.show().css({margin: '20px auto', display: 'block'}));
                $.ez('ocb::attribute_edit', {
                    objectId: attributeData.objectid,
                    attributeId: attributeData.attributeid,
                    version: attributeData.version,
                    content: value
                }, function (result) {
                    if (result.error_text.length) {
                        alert(result.error_text);
                    } else {
                        $('#object-' + attributeData.objectid + ' td.object-name').html(result.content);
                    }
                    $.ez('ezjsctemplate::preview::' + attributeData.objectid, false, function (data) {
                        if (data.error_text.length) {
                            alert(data.error_text);
                        } else {
                            $('#preview-container').html(data.content);
                        }
                    });
                });
            });
        };

        if ($.isFunction($(document).on)) {
            $(document).on('click', '.load-preview', displayImageDetail);
            $(document).on('change', 'td > input:checkbox', selectUnselect);
            $(document).on('submit', 'form[name="browse"]', function () {
                eraseCookie('ocb_browse');
            });
            $(document).on('click', '.inline-edit', inlineEdit);
        } else {
            $('.load-preview').live('click', displayImageDetail);
            $('.inline-edit').live('click', inlineEdit);
            $('td > input:checkbox').live('change', selectUnselect);
            $('form[name="browse"]').bind('submit', function () {
                eraseCookie('ocb_browse');
            });
        }

        $('.load-preview').css({cursor: 'pointer'});
        $(".load-preview:first").trigger('click');
        showSelectedItems();
    });
    {/literal}
</script>
