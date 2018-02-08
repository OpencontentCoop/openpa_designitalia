{def $is_single = cond( or( is_set($items_per_row)|not(), and(is_set($items_per_row), $items_per_row|eq(1)) ), true(), false() )
     $image_attribute = $node|attribute('image')
     $image = false()}
{if and($image_attribute, $image_attribute.content[$image_class])}
  {set $image = $image_attribute.content[$image_class].url|ezroot(no)}
{/if}

<div class="openpa-carousel">
    <div class="Hero" style="background-image:url({$image});">

      {if $image_attribute}
          <div class="Hero-image u-sm-hidden u-md-hidden u-lg-hidden">
            {*attribute_view_gui attribute=$image_attribute image_class="agid_panel" fluid=$fluid*}
              <a href="{$openpa.content_link.full_link}" aria-hidden="true" tabindex="-1">
                  <img src="{$image_attribute.content['agid_panel'].full_path|ezroot(no)}"
                       alt="Immagine decorativa per il contenuto {$node.name|wash()}"
                       class="u-sizeFull"
                       role="presentation" />
              </a>
          </div>
      {/if}

        <div class="Hero-content carousel-caption">
            <p class="u-padding-r-bottom u-padding-r-top u-text-r-xs u-xs-hidden">
                <a href="{$node.parent.url_alias|ezurl(no)}" class="u-textClean u-color-60 u-text-h4"><span class="Dot u-background-60"></span>{$node.parent.name|wash()}</a>
            </p>
            <h3 class="u-text-h2"><a href="{$openpa.content_link.full_link}" class="u-color-95 u-textClean">{$node.name|wash()}</a></h3>
            <p class="u-padding-r-bottom u-padding-r-top u-text-p u-margin-r-bottom">{$node|abstract()|openpa_shorten(200)}</p>
        </div>
    </div>
</div>

{undef $is_single $image}
