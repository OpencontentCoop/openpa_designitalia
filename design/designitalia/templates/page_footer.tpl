    {if and( $ui_context|ne( 'edit' ), $ui_context|ne( 'browse' ) )}    
      {if and( $current_node_id|ne(2), $pagedata.class_identifier|ne('frontpage'), $pagedata.class_identifier|ne('') ) }
        <div id="valuation-container">
          <div class="container">
            <div class="row">
              <div class="col-xs-12">
                {include name=valuation node_id=$current_node_id uri='design:openpa/valuation.tpl'}
              </div>
            </div>
          </div>
        </div>  
      {/if}
    {/if}

{*<div id="footer">
    {if and( $ui_context|ne( 'edit' ), $ui_context|ne( 'browse' ), $pagedata.is_login_page|not() )}
        <div class="footer-data container">
            <div class="row">
                <div class="col-lg-5 col-md-5 col-sm-4 notes">
                    <h4>{ezini('SiteSettings','SiteName')}</h4>
                    {def $footer_notes = fetch( 'openpa', 'footer_notes' )}
                    {if $footer_notes}
                        {attribute_view_gui attribute=$footer_notes}
                    {/if}
                </div>

                <div class="col-lg-4 col-md-4 col-sm-4 contacts">
                    {include uri='design:footer/contacts_list.tpl'}
                </div>

                <div class="col-lg-3 col-md-3 col-sm-4 links">
                    {def $footer_links = fetch( 'openpa', 'footer_links' )}
                    {if count( $footer_links )}
                        <ul class="list-unstyled ">
                            {foreach $footer_links as $item}
                                {def $href = $item.url_alias|ezurl(no)}
                                {if eq( $ui_context, 'browse' )}
                                    {set $href = concat("content/browse/", $item.node_id)|ezurl(no)}
                                {elseif $pagedata.is_edit}
                                    {set $href = '#'}
                                {elseif and( is_set( $item.data_map.location ), $item.data_map.location.has_content )}
                                    {set $href = $item.data_map.location.content}
                                {/if}
                                <li><a href="{$href}"
                                       title="Leggi {$item.name|wash()}">{$item.name|wash()}</a>
                                </li>
                                {undef $href}
                            {/foreach}
                        </ul>
                    {/if}
                </div>
            </div>
        </div>
        {if is_set($pagedata.contacts.indirizzo)}
            <div id="footer-map-container" class="hidden-xs hidden-sm" style="display: none">
                <span class="caret caret-big"></span>
                {include uri='design:footer/map.tpl'}
            </div>
        {/if}
    {/if}
</div>*}


<div class="u-background-grey-80">
    <div class="u-layout-wide u-layoutCenter u-layout-r-withGutter">
        <footer class="Footer u-padding-all-s">

            <div class="u-cf">

                {if and( is_set($pagedata.header.logo.url), $pagedata.header.logo.url)}
                    <img height="75" class="Footer-logo" src={$pagedata.header.logo.url|ezroot()} alt="{ezini('SiteSettings','SiteName')}" alt="{ezini('SiteSettings','SiteName')}" />
                {else}
                    <img class="Footer-logo" src="//placehold.it/75x80?text=placeholder" alt="">
                {/if}
                <p class="Footer-siteName">{ezini('SiteSettings','SiteName')}</p>
            </div>

            <div class="Grid Grid--withGutter">

                {def $footer_notes = fetch( 'openpa', 'footer_notes' )}
                {if $footer_notes}
                    <div class="Footer-block Grid-cell u-md-size1of4 u-lg-size1of4">
                        <h2 class="Footer-blockTitle">Informazioni</h2>
                        <div class="Footer-subBlock">

                            <div class="u-lineHeight-xl u-color-white">
                                {attribute_view_gui attribute=$footer_notes}
                            </div>

                        </div>
                    </div>
                {/if}

                <div class="Footer-block Grid-cell u-md-size1of4 u-lg-size1of4">
                    <h2 class="Footer-blockTitle">Recapiti</h2>
                    <div class="Footer-subBlock">
                        {include uri='design:footer/address.tpl'}
                    </div>
                </div>

                <div class="Footer-block Grid-cell u-md-size1of4 u-lg-size1of4">
                    <h2 class="Footer-blockTitle">Contatti</h2>
                    {include uri='design:footer/contacts_list.tpl'}
                </div>

                <div class="Footer-block Grid-cell u-md-size1of4 u-lg-size1of4">
                    <h2 class="Footer-blockTitle">Seguici su</h2>
                    <div class="Footer-subBlock">
                        <ul class="Footer-socialIcons">
                            {if is_set($pagedata.contacts.facebook)}
                                <li><a href="{$pagedata.contacts.facebook}"><span class="Icon Icon-facebook"></span><span class="u-hiddenVisually">Facebook</span></a></li>
                            {/if}
                            {if is_set($pagedata.contacts.twitter)}
                                <li><a href="{$pagedata.contacts.twitter}"><span class="Icon Icon-twitter"></span><span class="u-hiddenVisually">Twitter</span></a></li>
                            {/if}
                            {if is_set($pagedata.contacts.youtube)}
                                <li><a href="{$pagedata.contacts.youtube}"><span class="Icon Icon-youtube"></span><span class="u-hiddenVisually">Youtube</span></a></li>
                            {/if}
                        </ul>
                    </div>
                </div>

            </div>

            {def $footer_links = fetch( 'openpa', 'footer_links' )}
            {if count( $footer_links )}
                <ul class="Footer-links u-cf">
                    {foreach $footer_links as $item}
                        {def $href = $item.url_alias|ezurl(no)}
                        {if eq( $ui_context, 'browse' )}
                            {set $href = concat("content/browse/", $item.node_id)|ezurl(no)}
                        {elseif $pagedata.is_edit}
                            {set $href = '#'}
                        {elseif and( is_set( $item.data_map.location ), $item.data_map.location.has_content )}
                            {set $href = $item.data_map.location.content}
                        {/if}
                        <li><a href="{$href}"
                               title="Leggi {$item.name|wash()}">{$item.name|wash()}</a>
                        </li>
                        {undef $href}
                    {/foreach}
                </ul>
            {/if}

            <div class="Grid Grid--withGutter">
                <div class="Footer-block Grid-cell u-md-size1of2 u-lg-size1of2">
                    {include uri='design:footer/copyright.tpl'}
                </div>
                <div class="Footer-block Grid-cell u-md-size1of2 u-lg-size1of2">
                    {if $pagedata.is_login_page|not()}
                        {include uri='design:footer/user_access.tpl'}
                    {/if}
                </div>
            </div>

        </footer>
    </div>
</div>


<a href="#" title="torna all'inizio del contenuto" class="ScrollTop js-scrollTop js-scrollTo">
    <i class="ScrollTop-icon Icon-arrow-up" aria-hidden="true"></i>
    <span class="u-hiddenVisually">torna all'inizio del contenuto</span>
</a>
