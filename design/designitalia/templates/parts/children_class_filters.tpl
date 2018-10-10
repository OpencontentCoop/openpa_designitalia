{def $currentClass = false()}
{if is_set( $self.content_virtual.folder.classes )}
    {def $classes = fetch( 'class', 'list', hash( 'class_filter', $self.content_virtual.folder.classes ) )}
{else}
    {def $classes = fetch( 'ocbtools', 'children_classes', hash( 'parent_node_id', $node.node_id ) )}
{/if}

{if and( is_set($data), $data.is_search_request)}
    {set $currentClass = cond( is_set( $data.fetch_parameters.class_id ), $data.fetch_parameters.class_id, $classes[0].id )}
{elseif count( $classes )|eq(1)}
    {set $currentClass = $classes[0].id}
{/if}

{if $currentClass|not()}
    {set $currentClass = $classes[0].id}
{/if}

{foreach $classes as $class}
<div class="openpa-widget nav-section">
    <h2 class="openpa-widget-title"><span>Cerca {$class.name|wash()|downcase()}</span></h2>
    <div class="u-padding-all-s u-background-grey-10">
        {class_search_form( $class.identifier, hash( 'RedirectNodeID', $node.node_id ) )}
    </div>
</div>
{/foreach}
