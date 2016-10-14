<section class="Grid {$node|access_style}">
  <div class="Grid-cell u-sizeFull">
    {if $node|has_attribute('image')}
      <figure {if $node|has_attribute('image_full')}class="bg-contain"{/if} style="background: url( {$node|attribute('image').content.imagefull.full_path|ezroot(no)} )"></figure>
    {/if}

    <div class="u-padding-bottom-s">
      <h4><a class="u-textClean" href="{$openpa.content_link.full_link}" title="{$node.name|wash()}">{$node.name|openpa_shorten(60)|wash()}</a></h4>

      <div class="u-lineHeight-l u-text-r-xs u-textSecondary abstract">
        {$node|abstract()|openpa_shorten(270)}
      </div>

      <a class="Button Button--info u-text-r-xs" href="{$openpa.content_link.full_link}" title="{$node.name|wash()}">Leggi</a>
    </div>
  </div>
</section>