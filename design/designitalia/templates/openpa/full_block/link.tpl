<div class="openpa-widget {$block.view} {if and(is_set($block.custom_attributes.color_style), $block.custom_attributes.color_style|ne(''))}color color-{$block.custom_attributes.color_style}{/if}">

    <div class="openpa-widget-content">
        {if $node|has_attribute('image')}
            <section class="Grid">
                <div class="Grid-cell u-sizeFull u-md-size1of2 u-lg-size1of2 u-text-r-s u-padding-r-top u-padding-r-bottom">
                    <div class="u-text-r-m u-layout-prose">
                        <h2 class="u-text-h2 u-margin-r-bottom">
                            <a class="u-text-h2 u-textClean" href="{$openpa.content_link.full_link}">
                                {$node.name|wash()}
                            </a>
                        </h2>
                        <div class="u-textSecondary u-lineHeight-l">
                            {$node|abstract()}
                        </div>
                    </div>
                </div>

                <div class="Grid-cell u-sizeFull u-md-size1of2 u-lg-size1of2 u-text-r-s u-padding-r-all">
                    {if $node|has_attribute('image')}
                        <div class="openpa-panel-image">
                            <a href="{$node.url_alias|ezurl(no)}" aria-hidden="true" tabindex="-1">
                                <img src="{$node|attribute('image').content['singolo'].full_path|ezroot(no)}"
                                     alt=""
                                     class="u-sizeFull"
                                     role="presentation" />
                            </a>
                        </div>
                    {/if}
                </div>
            </section>
        {else}
            <div class="Grid-cell u-flex">
                <div class="Entrypoint-item u-sizeFill u-background-60">
                    <p><a class="u-textClean u-text-h3 u-color-white" href="{$openpa.content_link.full_link}">{$node.name|wash()}</a></p>
                </div>
            </div>
        {/if}
    </div>
</div>
