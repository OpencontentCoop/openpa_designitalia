<section class="Grid {$node|access_style}">
    <div class="Grid-cell u-sizeFull">
        {if $node|has_attribute('image')}
            <figure {if $node|has_attribute('image_full')}class="bg-contain"{/if} style="background: url( {$node|attribute('image').content.imagefull.full_path|ezroot(no)} )"></figure>
        {/if}

        <div class="u-padding-bottom-s">
            <h4><a class="u-textClean" href="{$openpa.content_link.full_link}" title="{$node.name|wash()}">{$node.name|openpa_shorten(60)|wash()}</a></h4>

            <p class="u-margin-bootm-xs">{$node.object.published||l10n(date)}</p>

            <div class="u-lineHeight-m u-textSecondary abstract u-padding-bottom-xs">
                {$node|abstract()|openpa_shorten(270)}
            </div>

            {if or( count($openpa.content_related.info)|gt(0), $openpa.content_gallery.has_images, $node|has_attribute( 'file' ) )}
                <ul class="fa-ul panel-story u-padding-bottom-xs">
                    {if $node|has_attribute( 'file' )}
                        <li><i class="fa-li fa fa-paperclip"></i> {attribute_view_gui attribute=$node|attribute( 'file' )}</li>
                    {/if}
                    {if $openpa.content_gallery.has_images}
                    <li><i class="fa-li fa fa-camera"></i> <a href="{$openpa.content_link.full_link}" title="{$openpa.content_gallery.title|wash()}">{$openpa.content_gallery.title|wash()}</a>
                        {/if}
                        {if count($openpa.content_related.info)|gt(0)}
                    <li><i class="fa-li fa fa-link"></i>
                        {foreach $openpa.content_related.info as $class_name => $infos}{foreach $infos as $info}{node_view_gui content_node=$info view=text_linked}{delimiter}, {/delimiter}{/foreach}{delimiter}, {/delimiter}{/foreach}
                    </li>
                    {/if}
                </ul>
            {/if}

            <a class="Button Button--info u-text-r-xs" href="{$openpa.content_link.full_link}" title="{$node.name|wash()}">Leggi</a>
        </div>
    </div>
</section>

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
