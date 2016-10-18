{def $currentClass = false()}
{if is_set( $self.content_virtual.folder.classes )}
    {def $classes = fetch( 'class', 'list', hash( 'class_filter', $self.content_virtual.folder.classes ) )}
{else}
    {def $classes = fetch( 'ocbtools', 'children_classes', hash( 'parent_node_id', $node.node_id ) )}
{/if}

{if $data.is_search_request}
    {set $currentClass = cond( is_set( $data.fetch_parameters.class_id ), $data.fetch_parameters.class_id, $classes[0].id )}
{elseif count( $classes )|eq(1)}
    {set $currentClass = $classes[0].id}
{/if}

{if $currentClass|not()}
    {set $currentClass = $classes[0].id}
{/if}


<div class="u-padding-all-s u-background-grey-10">
    <div class="{if count( $classes )|gt(0)}Accordion fr-accordion js-fr-accordion{/if}" id="accordion-classFilters">
        {foreach $classes as $class}
            {if count( $classes )|gt(0)}
            <h2 class="Accordion-header js-fr-accordion__header fr-accordion__header"
                id="accordion-header-{$class.id}">
                <span class="Accordion-link u-text-r-s">{$class.name|wash()}</span>
            </h2>
            {/if}
            <div id="accordion-panel-{$class.id}"
                 class="Accordion-panel fr-accordion__panel js-fr-accordion__panel u-color-black">
                {class_search_form( $class.identifier, hash( 'RedirectNodeID', $node.node_id ) )}
            </div>
        {/foreach}
    </div>
</div>

