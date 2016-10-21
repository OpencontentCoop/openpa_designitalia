{if is_area_tematica()}
    {def $area = is_area_tematica()}
    {if and( is_set( $area.data_map.cover ), $area.data_map.cover.has_content, $area.data_map.cover.content['original'].height|ge(200))}
        <div class="Headroom-hideme Header-homebanner u-hidden u-sm-block u-md-block u-lg-block"
             style="background-image: url({$area.data_map.cover.content['agid_topbanner'].url|ezroot(no)});"></div>
        {undef $area}
    {/if}
{elseif and( $pagedata.is_homepage, is_set($pagedata.header.image.url) )}
    {def $home = fetch('openpa','homepage')}
    <div class="Headroom-hideme Header-homebanner u-hidden u-sm-block u-md-block u-lg-block u-textCenter"
         style="background-image: url({$home.data_map.image.content['agid_topbanner'].url|ezroot(no)});">

        {if $home|has_attribute('menu_button')}

            {def $banner = $home|attribute('menu_button').content}
            <div class="u-layout-wide u-layoutCenter u-layout-withGutter u-padding-r-top">
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
                <nav class="Megamenu Megamenu--styled">
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
