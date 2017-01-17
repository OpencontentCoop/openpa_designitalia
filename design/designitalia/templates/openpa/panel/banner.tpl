<div class="openpa-panel {$node|access_style}">

    {include uri='design:openpa/panel/parts/image.tpl'}

    <div class="Card-content u-padding-r-all">
        <p class="Card-title">
            <a class="Card-titleLink" href="{$openpa.content_link.full_link}"
               title="{$node.name|wash()}">{$node.name|wash()}</a>
        </p>

        <div class="Card-text">
            {$node|abstract()}
        </div>
    </div>

</div>
