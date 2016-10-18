{def $is_single = cond( or( is_set($items_per_row)|not(), and(is_set($items_per_row), $items_per_row|eq(1)) ), true(), false() )}

<div class="openpa-carousel {if $is_single|not} u-padding-all-s{/if}">
    {include uri='design:openpa/carousel/parts/image.tpl'}
    <div class="carousel-caption">
        <h3>
            <a href="{$openpa.content_link.full_link}">{$node.name|wash()}</a>
        </h3>
        {if and( $is_single, $node|has_abstract())}
            <p class="u-hidden u-md-block u-lg-block">{$node|abstract()|oc_shorten(400)}</p>
        {/if}
    </div>
</div>

{undef $is_single}
