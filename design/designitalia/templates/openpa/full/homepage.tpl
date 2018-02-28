{ezpagedata_set( 'has_container', true() )}
{if $openpa.content_tools.editor_tools}
    {include uri=$openpa.content_tools.template}
{/if}

<div class="openpa-full class-{$node.class_identifier}">
    <div class="content-container">
        <div class="content">
            {if $node.data_map.page.has_content}
                {attribute_view_gui attribute=$node.data_map.page}
            {else}
                {node_view_gui content_node=$node view=children view_parameters=$view_parameters}
            {/if}
        </div>
    </div>
</div>
