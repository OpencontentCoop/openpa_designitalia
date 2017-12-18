{def $is_single = cond( or( is_set($items_per_row)|not(), and(is_set($items_per_row), $items_per_row|eq(1)) ), true(), false() )
     $image = false()}
{if $node.data_map.image.content[$image_class]}
    {set $image = $node.data_map.image.content[$image_class].url|ezroot(no)}
{/if}

<div class="openpa-carousel">
    <div class="Hero" style="background-image:url({$image});">

      {if $node.data_map.image.content}
          <div class="Hero-image u-sm-hidden u-md-hidden u-lg-hidden">
            {*attribute_view_gui attribute=$image_attribute image_class="agid_panel" fluid=$fluid*}
              <a href="{$openpa.content_link.full_link}" aria-hidden="true" role="presentation" tabindex="-1">
                  <img src="{$image}"
                       alt=""
                       class="u-sizeFull"
                       role="presentation" />
              </a>
          </div>
      {/if}

        <div class="Hero-content carousel-caption">
            <h3 class="u-text-h2"><a href="{$openpa.content_link.full_link}" class="u-color-95 u-textClean">{$node.name|wash()}</a></h3>
            {if $node|has_abstract()}
            <div class="u-padding-r-bottom u-padding-r-top u-text-p u-margin-r-bottom">{$node|abstract()}</div>
            {/if}
        </div>
    </div>
</div>

{undef $is_single $image}
