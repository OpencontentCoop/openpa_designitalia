{def $valid_nodes = $block.valid_nodes}
{if $valid_nodes|count()|gt(0)}
<div class="openpa-widget {$block.view} {if is_set($block.custom_attributes.color_style)}color color-{$block.custom_attributes.color_style}{/if}">
    {if $block.name}
        <h3 class="openpa-widget-title">{$block.name}</h3>
    {/if}
    <div class="openpa-widget-content">
        <div class="widget_tabs {$block.view}" id="{$block.id}">
            <ul class="nav nav-tabs">
                {foreach $valid_nodes as $index => $child}
                    <li class="nav-tab {if $index|eq(0)}active{/if}">
                        <a href="#{$block.id}-{$child.name|slugize()}" data-toggle="tab" title="{$child.name|wash()}">{$child.name|wash()}</a>
                    </li>
                {/foreach}
            </ul>
            <div>
                <div class="tab-content">
                    {foreach $valid_nodes as $index => $child}
                        <div class="tab-pane{if $index|eq(0)} active{/if}" id="{$block.id}-{$child.name|slugize()}">
                            {node_view_gui content_node=$child view=accordion_content image_class=medium}
                            <a class="readmore" href="{$child.url_alias|ezurl(no)}" title="Link alla pagina {$child.name|wash()}">Leggi</a>
                        </div>
                    {/foreach}
                </div>
            </div>
        </div>
    </div>
</div>

    <script type="text/javascript">
        {literal}
        $(document).ready(function() {
            $("#{/literal}{$block.id}{literal}").tabs();
        });
        {/literal}
    </script>
{/if}
