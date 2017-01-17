{def $valid_node = $block.valid_nodes[0]
$link = '#'}

{if object_handler($valid_node).content_link.full_link|ne('')}
    {set $link = object_handler($valid_node).content_link.full_link}
{/if}

<div class="Entrypoint-item u-sizeFill u-background-compl-80">
    <p><a class="u-textClean u-text-h3 u-color-white" href="{$link}">{$valid_node.name|wash()}</a></p>
</div>
