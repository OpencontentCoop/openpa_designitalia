{if $openpa.content_tools.editor_tools}
    {include uri=$openpa.content_tools.template}
{/if}

<div class="u-layout-wide u-layoutCenter u-layout-withGutter u-padding-r-top content-view-full class-{$node.class_identifier}">

    <div class="content-main u-sizeFull">

      {if $node.data_map.page.has_content}
        {attribute_view_gui attribute=$node.data_map.page}
      {else}
        {include uri=$openpa.control_children.template}
      {/if}

    </div>

</div>