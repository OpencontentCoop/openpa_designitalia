{def $is_single = cond( or( is_set($items_per_row)|not(), and(is_set($items_per_row), $items_per_row|eq(1)) ), true(), false() )
     $image = false()}
{if $node.data_map.image.content['agid_carousel']}
    {set $image = $node.data_map.image.content['agid_carousel'].url|ezroot(no)}
{/if}

<div class="openpa-carousel">
    <div class="Hero" style="background-image:url({$image});">
        <div class="Hero-content carousel-caption">
            <p class="u-padding-r-bottom u-padding-r-top u-text-r-xs">
                <a href="{$node.parent.url_alias|ezurl(no)}" class="u-textClean u-color-60 u-text-h4"><span class="Dot u-background-60"></span>{$node.parent.name|wash()}</a>
            </p>
            <h3 class="u-text-h2"><a href="{$node.url_alias|ezurl(no)}" class="u-color-95 u-textClean">{$node.name|wash()}</a></h3>
            <p class="u-padding-r-bottom u-padding-r-top u-text-p u-margin-r-bottom">{$node|abstract()|openpa_shorten(200)}</p>
        </div>
    </div>
</div>

{undef $is_single $image}