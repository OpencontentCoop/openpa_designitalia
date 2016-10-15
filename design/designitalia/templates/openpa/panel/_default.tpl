<section class="openpa-panel {$node|access_style}">
    <div class="content">
        {if $node|has_attribute('image')}
            <figure {if $node|has_attribute('image_full')}class="bg-contain"{/if}
                    style="background: url( {$node|attribute('image').content.imagefull.full_path|ezroot(no)} )"></figure>
        {/if}

        <div class="link">
            <h4><a href="{$openpa.content_link.full_link}"
                   title="{$node.name|wash()}">{$node.name|openpa_shorten(60)|wash()}</a></h4>

            <div class="abstract">
                {$node|abstract()|openpa_shorten(270)}
            </div>

            <a class="readmore" href="{$openpa.content_link.full_link}" title="{$node.name|wash()}">Leggi</a>
        </div>
    </div>
</section>
