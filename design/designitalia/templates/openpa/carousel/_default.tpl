{def $is_single = cond( or( is_set($items_per_row)|not(), and(is_set($items_per_row), $items_per_row|eq(1)) ), true(), false() )}

<div class="openpa-carousel {if $is_single|not} u-padding-all-xxs{/if}">

    {include uri='design:openpa/carousel/parts/image.tpl'}

    <div class="carousel-caption">
      <div class="u-layout-r-withGutter u-layout-wide u-layoutCenter">
        <h3>
            <a href="{$openpa.content_link.full_link}">{$node.name|wash()}</a>
        </h3>
        {if and( $is_single, $node|has_abstract())}
            <p class="u-hidden u-md-block u-lg-block">{$node|abstract()|openpa_shorten(300)}</p>
        {/if}
      </div>
    </div>
</div>

{undef $is_single}
