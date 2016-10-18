{set_defaults(hash(
    'page_limit', 10
))}

{def $root_nodes = array( $node.node_id )
$self = object_handler( $node )}
{if is_set( $self.content_virtual.folder.subtree )}
    {set $root_nodes = $self.content_virtual.folder.subtree}
{/if}

{def $data = class_search_result(  hash( 'subtree_array', $root_nodes, 'sort_by', hash( 'name', 'asc' ), 'limit', $page_limit ), $view_parameters )}


{if and( $data.is_search_request, is_set( $view_parameters.class_id ) )}
    {include name=class_search_form_result
             uri='design:parts/children_class_search_form_result.tpl'
             data=$data
             page_url=$node.url_alias
             view_parameters=$view_parameters
             page_limit=$page_limit}
{else}

    {include uri='design:parts/children/default.tpl' view='line'}

{/if}
