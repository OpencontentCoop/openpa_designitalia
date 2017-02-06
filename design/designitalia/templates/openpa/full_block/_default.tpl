<div class="openpa-widget {$block.view} {if and(is_set($block.custom_attributes.color_style), $block.custom_attributes.color_style|ne(''))}color color-{$block.custom_attributes.color_style}{/if}">

    <div class="openpa-widget-content">
        <section class="Grid">
          {if $node|has_attribute('image')}
            <div class="Grid-cell u-sizeFull u-md-size1of2 u-lg-size1of2 u-text-r-s u-padding-r-top u-padding-r-bottom">
              <div class="u-text-r-m u-layout-prose">
                <h3 class="u-text-h3 u-margin-r-bottom">
                  <a class="u-text-h2 u-textClean" href="{$openpa.content_link.full_link}">
                      {$node.name|wash()}
                  </a>
                </h3>
                <div class="u-textSecondary u-lineHeight-l">
                    {$node|abstract()}
                </div>
              </div>
            </div>

            <div class="Grid-cell u-sizeFull u-md-size1of2 u-lg-size1of2 u-text-r-s u-padding-r-all">
              <div class="openpa-panel-image">
                  <a href="{$node.url_alias|ezurl(no)}" aria-hidden="true" role="presentation" tabindex="-1">
                      <img src="{$node|attribute('image').content['singolo'].full_path|ezroot(no)}"
                           alt=""
                           class="u-sizeFull"
                           role="presentation" />
                  </a>
              </div>
            </div>
          {else}
            <div class="Grid-cell u-sizeFull u-text-r-s u-padding-r-top u-padding-r-bottom">
              <div class="u-text-r-m u-layout-prose">
                <h3 class="u-text-h3 u-margin-r-bottom">
                  <a class="u-text-h2 u-textClean" href="{$openpa.content_link.full_link}">
                    {$node.name|wash()}
                  </a>
                </h3>
                <div class="u-textSecondary u-lineHeight-l">
                  {$node|abstract()}
                </div>
              </div>
            </div>
          {/if}
            {* Abilitare nei casi specifici  *}
            {*if $node.children_count|gt(0))}
                <hr />
                <div class="u-layout-centerContent u-cf">
                    <section class="js-Masonry-container u-layout-wide" data-columns>
                        {foreach $node.children as $item max 6}
                            <div class="Masonry-item js-Masonry-item">
                                {node_view_gui content_node=$item view='panel' image_class='agid_panel'}
                            </div>
                        {/foreach}
                    </section>
                </div>
                <p class="u-cf u-textCenter u-text-md-right u-text-lg-right u-margin-r-top">
                    <a href="{$node.url_alias|ezurl(no)}" class="u-color-50 u-textClean u-text-h4">
                        Vedi tutto <span class="Icon Icon-chevron-right"></span></a>
                </p>
            {/if*}
        </section>
    </div>
</div>
