{if $openpa.content_tools.editor_tools}
    {include uri=$openpa.content_tools.template}
{/if}

<div class="openpa-full class-{$node.class_identifier}">
    <div class="openpa-content-container">
      {if $node.data_map.page.has_content}
        {attribute_view_gui attribute=$node.data_map.page}
      {else}
        {include uri=$openpa.control_children.template}
      {/if}
    </div>
</div>
