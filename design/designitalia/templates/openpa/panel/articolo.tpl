<article class="openpa-panel {$node|access_style} Card Card--withBorder u-color-grey-30">

    {include uri='design:openpa/panel/parts/image.tpl'}

    <div class="Card-content u-padding-r-all">
        <p class="Card-title">
            <a class="Card-titleLink" href="{$openpa.content_link.full_link}"
               title="{$node.name|wash()}">{$node.name|openpa_shorten(60)|wash()}</a>
        </p>

        <div class="Card-text">
            {$node|abstract()}
        </div>

        {include uri='design:openpa/panel/parts/extrainfos.tpl'}

    </div>

    <a class="readmore" href="{object_handler($node).content_link.full_link}" title="{$node.name|wash()}">Leggi</a>

</article>
