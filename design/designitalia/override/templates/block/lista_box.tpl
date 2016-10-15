{def $openpa= object_handler($block)}
{set_defaults(hash('show_title', true()))}

<div class="openpa-widget {$block.view} {if is_set($block.custom_attributes.color_style)}color color-{$block.custom_attributes.color_style}{/if}">
    {if and( $show_title, $block.name|ne('') )}
        <h3 class="openpa-widget-title">
            {if $openpa.root_node}<a href={$openpa.root_node.url_alias|ezurl()}>{/if}
                {$block.name|wash()}
                {if $openpa.root_node}</a>{/if}
        </h3>
    {/if}
    <div class="openpa-widget-content">
        {foreach $openpa.content as $item}
            {node_view_gui content_node=$item view=line image_class=small}
        {/foreach}
    </div>
</div>
{unset_defaults( array('show_title') )}
