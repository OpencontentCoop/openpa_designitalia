{def $image = false()}
{if is_area_tematica()}
    {def $area = is_area_tematica()}
    {if and( is_set( $area.data_map.cover ), $area.data_map.cover.has_content, $area.data_map.cover.content['original'].height|ge(200))}
        {set $image = $area.data_map.image}
        <div class="Headroom-hideme Header-homebanner u-block u-sm-block u-md-block u-lg-block">
            <div id="Imageheader" role="presentation">
                <div class="inner"></div>
            </div>
        </div>
        {undef $area}
    {else}
        {include uri='design:menu/header_menu.tpl'}
    {/if}
{elseif and( $pagedata.is_homepage, is_set($pagedata.header.image.url) )}
    {def $home = fetch('openpa','homepage')}
    {set $image = $home.data_map.image}
    <div class="Headroom-hideme Header-homebanner u-block u-sm-block u-md-block u-lg-block u-textCenter">

        <div id="Imageheader" role="presentation">
            <div class="inner"></div>
        </div>

        {if $home|has_attribute('menu_button')}
            {def $banner = $home|attribute('menu_button').content}
            <div class="u-hidden u-sm-block u-md-block u-lg-block u-layout-wide u-layoutCenter u-layout-withGutter u-padding-r-top">
                <div class="Entrypoint-item u-md-size1of2 u-lg-size1of3 u-background-teal-70 u-textCenter">
                    <p class="u-padding-bottom-m u-textLeft">
                        <a class="u-textClean u-text-h4 u-color-white"
                           href="{object_handler($banner).content_link.full_link}">{$banner.name|wash()}</a>
                    </p>
                    {if $banner|has_attribute('image')}
                        {attribute_view_gui attribute=$banner|attribute('image') image_class=large image_css_classes='u-sizeFull' href=object_handler($banner).content_link.full_link}
                    {/if}
                    {if $banner|has_attribute('abstract')}
                        <div class="u-color-white u-lineHeight-xl u-textLeft u-padding-top-m">
                            {attribute_view_gui attribute=$banner|attribute('abstract')}
                        </div>
                    {/if}
                </div>
            </div>
            {undef $banner}
        {else}
            {def $top_menu_node_ids = openpaini( 'TopMenu', 'NodiCustomMenu', array() )}
            {def $top_menu_node_ids_count = $top_menu_node_ids|count()}
            {if $top_menu_node_ids_count}
                <nav class="Megamenu Megamenu--styled u-hidden u-sm-block u-md-block u-lg-block">
                    <ul class="Megamenu-list">
                        {foreach $top_menu_node_ids as $id}
                            {def $tree_menu = tree_menu( hash( 'root_node_id', $id, 'scope', 'top_menu'))}
                            <li class="Megamenu-item">
                                {include recursion=0
                                name=top_menu
                                uri='design:menu/header_menu_item.tpl'
                                menu_item=$tree_menu
                                current=false()}
                            </li>
                        {/foreach}
                    </ul>
                </nav>
            {/if}
            {undef $top_menu_node_ids $top_menu_node_ids_count}

        {/if}
    </div>
    {undef $home}
{/if}
{if $image}
    {literal}
        <style>
            .Headroom-hideme.Header-homebanner #Imageheader {
                background-image: url({/literal}{$image.content['agid_topbanner'].url|ezroot(no)}{literal});
            }

            @media only screen and (min-width: 768px) and (max-width: 992px){
                .Headroom-hideme.Header-homebanner #Imageheader {
                    background-image: url({/literal}{$image.content['agid_topbanner_sm'].url|ezroot(no)}{literal});
                }
            }

            @media only screen and (min-width: 992px) and (max-width: 1440px){
                .Headroom-hideme.Header-homebanner #Imageheader {
                    background-image: url({/literal}{$image.content['agid_topbanner_md'].url|ezroot(no)}{literal});
                }
            }

            @media only screen and (min-width: 1440px){
                .Headroom-hideme.Header-homebanner #Imageheader {
                    background-image: url({/literal}{$image.content['agid_topbanner_lg'].url|ezroot(no)}{literal});
                }
            }
        </style>
    {/literal}
{/if}
{undef $image}
