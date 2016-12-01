{def $image = false()}
{if $node.data_map.image.content[$image_class]}
    {set $image = $node.data_map.image.content[$image_class].url|ezroot(no)}
{/if}
{if $image}
    <div class="carousel-image" style="background-image:url({$image});">
        <a href="{$openpa.content_link.full_link}" title="Vai a {$node.name|wash()}">
            <img src="{$image}"
                 class="u-sizeFull"
                 role="presentation"
                 alt="">
        </a>
    </div>
{/if}
{undef $image}
