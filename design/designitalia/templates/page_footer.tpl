{def $is_area_tematica = is_area_tematica()}
{def $footerBlocks = 4
     $has_notes = false()
     $has_contacts = false()
     $has_links  = false()
     $has_social  = false()
     $footerBlocksClass = 'u-sizeFull'}

{if and($is_area_tematica, $is_area_tematica|has_attribute('link'))}
    {def $footer_links = array()}
    {foreach $is_area_tematica|attribute('link').content.relation_list as $item}
        {set $footer_links = $footer_links|append(fetch(content, node, hash(node_id, $item.node_id)))}
    {/foreach}
{else}
    {def $footer_links = fetch( 'openpa', 'footer_links' )}
{/if}

{if and($is_area_tematica, $is_area_tematica|has_attribute('note_footer'))}
    {def $footer_notes = $is_area_tematica|attribute('note_footer')}
{else}
    {def $footer_notes = fetch( 'openpa', 'footer_notes' )}
{/if}

{if count( $footer_notes )|gt(0)}
    {set $has_notes = true()}
{else}
    {set $footerBlocks = $footerBlocks|sub(1)}
{/if}

{if and($is_area_tematica, $is_area_tematica|has_attribute('contacts'))}
    {def $contacts = parse_contacts_matrix($is_area_tematica)}
{else}
    {def $contacts = $pagedata.contacts}
{/if}

{if or(is_set($contacts.indirizzo), is_set($contacts.telefono), is_set($contacts.fax),
       is_set($contacts.email), is_set($contacts.pec), is_set($contacts.web))}
    {set $has_contacts = true()}
{else}
    {set $footerBlocks = $footerBlocks|sub(1)}
{/if}

{if or(is_set($contacts.facebook), is_set($contacts.twitter), is_set($contacts.linkedin), is_set($contacts.instagram))}
    {set $has_social = true()}
{else}
    {set $footerBlocks = $footerBlocks|sub(1)}
{/if}

{if count( $footer_links )|gt(0)}
    {set $has_links = true()}
{else}
    {set $footerBlocks = $footerBlocks|sub(1)}
{/if}

{if $footerBlocks|gt(1)}
    {set $footerBlocksClass = concat('u-md-size1of', $footerBlocks, ' u-lg-size1of', $footerBlocks) }
{/if}

<div class="footer-container u-hiddenPrint">
  <div class="u-layout-wide u-layoutCenter u-layout-r-withGutter">
    <footer class="Footer u-hiddenPrint">
        <div class="u-cf">
            {if and( is_set($pagedata.header.logo.url), $pagedata.header.logo.url)}
                <img height="75" class="Footer-logo"
                     src="{$pagedata.header.logo.url|ezroot(no)}"
                     alt="{ezini('SiteSettings','SiteName')}"/>
            {/if}
            {if or($pagedata.homepage|has_attribute('only_logo')|not(), and( $pagedata.homepage|has_attribute('only_logo'), $pagedata.homepage|attribute('only_logo').data_int|eq(0) ))}
                <p class="Footer-siteName">{ezini('SiteSettings','SiteName')}</p>
            {/if}
        </div>

        <div class="Grid Grid--withGutter">

            {if $has_notes}
                <div class="Footer-block Grid-cell {$footerBlocksClass}">
                    <h2 class="Footer-blockTitle">{'Informazioni'|i18n('openpa/footer')}</h2>
                    <div class="Footer-subBlock">
                        <div class="u-lineHeight-xl u-color-white">
                            {attribute_view_gui attribute=$footer_notes}
                        </div>
                    </div>
                </div>
            {/if}

            {if $has_contacts}
                <div class="Footer-block Grid-cell {$footerBlocksClass}">
                    <h2 class="Footer-blockTitle">{'Contatti'|i18n('openpa/footer')}</h2>
                    {include uri='design:footer/contacts_list.tpl' contacts=$contacts}
                </div>
            {/if}

            {if $has_links}
                <div class="Footer-block Grid-cell {$footerBlocksClass}">
                    <h2 class="Footer-blockTitle">{'Links'|i18n('openpa/footer')}</h2>
                    <ul>
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
                </div>
            {/if}

            {if $has_social}
                <div class="Footer-block Grid-cell {$footerBlocksClass}">
                    <h2 class="Footer-blockTitle">{'Seguici su'|i18n('openpa/footer')}</h2>
                    {include uri='design:footer/social.tpl'}
                </div>
            {/if}

        </div>

        <div class="Footer-links u-cf"></div>

        <div class="Grid Grid--withGutter">
            <div class="Footer-block Grid-cell u-md-size3of5 u-lg-size3of5">
                {include uri='design:footer/copyright.tpl'}
            </div>
            <div class="Footer-block Grid-cell u-md-size2of5 u-lg-size2of5 text-right">
                {if $pagedata.is_login_page|not()}
                    {include uri='design:footer/user_access.tpl'}
                {/if}
            </div>
        </div>
    </footer>
  </div>
</div>

{* Box al volo per orari 
{literal}
    <style>
        #times {
            position: fixed;
            height: auto;
            width: auto;
            z-index: 999999;
            bottom: 4em;
            right: 1em;
            border-radius: 5px;
            margin-left: 1em;
            background-color: #fff;
            opacity: .9;
            border-radius: 5px;
            border: 1px solid #253d15;
            max-width: 60%;
        }

        #open-times-entry {
            padding: 8px 16px;
        }

        #times-entry {
            padding: 20px;
        }


        .market-info {
            text-align: right;
        }

        @media screen and (max-width: 800px) {
            #times {
                max-width: 100%;
            }

            .market-info {
                text-align: left;
            }

            .market-address {
                display: none;
            }
        }


    </style>
{/literal}


{def $markets = fetch( 'content', 'list',
                hash( 'parent_node_id', array( '1211' ),
                'sort_by',        array( 'name', true() ) ) )}

<div id="times">
    <div class="Grid Grid--withGutter u-hidden" id="open-times-entry">
        <h3 class="u-text-h3" style="margin-bottom: 0 !important;"><a href="#" id="open-times" class="u-floatRight"><i class="fa fa-shopping-cart"></i></a></h3>
    </div>
    <div class="Grid Grid--withGutter" id="times-entry">
        <div class="Grid-cell u-size" style="/*border-bottom: 1px solid #eee*/">
            <h3 class="u-text-h3">Orari apertura <a href="#" id="close-times" class="u-floatRight"><i class="fa fa-times"></i></a></h3>
        </div>

        {foreach $markets as $m max 3}
            <div class="Grid-cell u-size u-md-size2of5 u-lg-size2of5 u-margin-top-s">
                <h4 class="u-text-h4"><a href="#"><i class="fa fa-shopping-cart"></i> {$m.name}</a></h4>
            </div>

            <div class="Grid-cell u-size u-md-size3of5 u-lg-size3of5 market-info">
                <p class="Prose"><span class="market-address"><strong>Indirizzo:</strong> {$m.data_map.geo.content.address}<br /></span>
                <strong>Orario:</strong> <strong style="color:#155724"> Aperto</strong> ⋅ Chiude tra 3 ore 20<br />
            </div>
            {delimiter}<div class="Grid-cell u-size u-margin-top-s" style="border-bottom: 1px solid #eee; margin: 0 4em"></div>{/delimiter}
        {/foreach}
    </div>
</div>

{ezscript_require( array( 'ezjsc::jquery' ) )}
{literal}
    <script type="application/javascript">
        $( "#close-times" ).click(function(event) {
            event.preventDefault();
            $( "#times-entry" ).addClass('u-hidden');
            $( "#open-times-entry" ).removeClass('u-hidden')
        });
        $( "#open-times" ).click(function(event) {
            event.preventDefault();
            $( "#open-times-entry" ).addClass('u-hidden');
            $( "#times-entry" ).removeClass('u-hidden')
        });
    </script>
{/literal}

{undef $markets}
*}

<a href="#" title="torna all'inizio del contenuto" class="ScrollTop js-scrollTop js-scrollTo">
    <i class="ScrollTop-icon Icon-collapse" aria-hidden="true"></i>
    <span class="u-hiddenVisually">{"torna all'inizio del contenuto"|i18n('openpa/footer')}</span>
</a>

{undef}
