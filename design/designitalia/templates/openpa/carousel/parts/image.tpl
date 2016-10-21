{def $image = false()}
{if $node.data_map.image.content['agid_carousel']}
    {set $image = $node.data_map.image.content['agid_carousel'].url|ezroot(no)}
{/if}
{if $image}
    <div class="carousel-image" style="background-image:url({$image});">
        <img src="{$image}"
             class="u-sizeFull"
             role="presentation"
             alt="">
    </div>
{/if}
{undef $image}
