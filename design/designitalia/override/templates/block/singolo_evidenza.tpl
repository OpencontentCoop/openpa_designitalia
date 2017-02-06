{def $valid_node = $block.valid_nodes[0]
$image = false()}
{if $valid_node.data_map.image.content['agid_carousel']}
    {set $image = $valid_node.data_map.image.content['agid_carousel'].url|ezroot(no)}
{/if}
{def $openpa_valid_node = object_handler($valid_node)}
<div class="Hero openpa-widget {$block.view} {if and(is_set($block.custom_attributes.color_style), $block.custom_attributes.color_style|ne(''))}color color-{$block.custom_attributes.color_style}{/if}" style="background-image:url({$image});">
    <div class="Hero-content">
        {if array('link','banner')|contains($valid_node.class_identifier)|not()}
        <p class="u-padding-r-bottom u-padding-r-top u-text-r-xs">
            <a href="{$valid_node.parent.url_alias|ezurl(no)}" class="u-textClean u-color-60 u-text-h4"><span class="Dot u-background-60"></span>{$valid_node.parent.name|wash()}</a>
        </p>
        {/if}
        <h2 class="u-text-h2"><a href="{$openpa_valid_node.content_link.full_link}" class="u-color-95 u-textClean">{$valid_node.name|wash()}</a></h2>
        <p class="u-padding-r-bottom u-padding-r-top u-text-p u-margin-r-bottom">{$valid_node|abstract()|oc_shorten(150)}</p>
    </div>
</div>
{undef $openpa_valid_node}