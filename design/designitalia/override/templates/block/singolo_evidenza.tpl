{def $valid_node = $block.valid_nodes[0]
$image = false()}
{if $valid_node.data_map.image.content['agid_carousel']}
    {set $image = $valid_node.data_map.image.content['agid_carousel'].url|ezroot(no)}
{/if}

<div class="Hero openpa-widget {$block.view} {if is_set($block.custom_attributes.color_style)}color color-{$block.custom_attributes.color_style}{/if}" style="background-image:url({$image});">
    <div class="Hero-content">
        <p class="u-padding-r-bottom u-padding-r-top u-text-r-xs">
            <a href="{$valid_node.parent.url_alias|ezurl(no)}" class="u-textClean u-color-60 u-text-h4"><span class="Dot u-background-60"></span>{$valid_node.parent.name|wash()}</a>
        </p>
        <h2 class="u-text-h2"><a href="{$valid_node.url_alias|ezurl(no)}" class="u-color-95 u-textClean">{$valid_node.name|wash()}</a></h2>
        <p class="u-padding-r-bottom u-padding-r-top u-text-p u-margin-r-bottom">{$valid_node|abstract()|oc_shorten(150)}</p>
    </div>
</div>
