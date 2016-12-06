{def $footerBlocksClass = 'u-sizeFull'
     $has_contacts = false()
     $has_social  = false}

{if or(is_set($pagedata.contacts.indirizzo), is_set($pagedata.contacts.telefono), is_set($pagedata.contacts.fax),
       is_set($pagedata.contacts.email), is_set($pagedata.contacts.pec), is_set($pagedata.contacts.web))}
    {set $has_contacts = true()
         $footerBlocksClass = 'u-md-size1of2 u-lg-size1of2'}
{/if}

{if or(is_set($pagedata.contacts.facebook), is_set($pagedata.contacts.twitter), is_set($pagedata.contacts.linkedin), is_set($pagedata.contacts.instagram))}
    {set $has_social = true()}
    {if $has_contacts}
        {set $footerBlocksClass = 'u-md-size1of3 u-lg-size1of3'}
    {else}
        {set $footerBlocksClass = 'u-md-size1of2 u-lg-size1of2'}
    {/if}
{/if}

{if openpaini('GeneralSettings','valutation', 1)}
    {if and( $ui_context|ne( 'edit' ), $ui_context|ne( 'browse' ) )}
        {if $pagedata.class_identifier|ne('')}
            <div class="survey u-background-95 u-textCenter u-padding-all-s">
                <a href="#"
                   onClick="getElementById('openpa-valuation').style.display='block';return false;"
                   class="u-linkClean u-color-white">
                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Valuta questo sito
                </a>
                <div style="display: none" id="openpa-valuation">
                    {include name=valuation node_id=$current_node_id uri='design:openpa/valuation.tpl'}
                </div>
            </div>
        {/if}
    {/if}
{/if}


<footer class="Footer u-padding-all-s">
    <div class="u-layout-wide u-layoutCenter">
        <div class="u-cf">

            {if and( is_set($pagedata.header.logo.url), $pagedata.header.logo.url)}
                <img height="75" class="Footer-logo"
                     src="{$pagedata.header.logo.url|ezroot(no)}"
                     alt="{ezini('SiteSettings','SiteName')}"/>
            {else}
                <img class="Footer-logo" src="//placehold.it/75x80?text=placeholder" alt="">
            {/if}
            {if and( $pagedata.homepage|has_attribute('only_logo'), $pagedata.homepage|attribute('only_logo').data_int|eq(0) )}
                <p class="Footer-siteName">{ezini('SiteSettings','SiteName')}</p>
            {/if}
        </div>

        <div class="Grid Grid--withGutter">

            {def $footer_notes = fetch( 'openpa', 'footer_notes' )}
            {if $footer_notes}
                <div class="Footer-block Grid-cell {$footerBlocksClass}">
                    <h2 class="Footer-blockTitle">Informazioni</h2>
                    <div class="Footer-subBlock">
                        <div class="u-lineHeight-xl u-color-white">
                            {attribute_view_gui attribute=$footer_notes}
                        </div>
                    </div>
                </div>
            {/if}

            {if $has_contacts}
                <div class="Footer-block Grid-cell {$footerBlocksClass}">
                    <h2 class="Footer-blockTitle">Contatti</h2>
                    {include uri='design:footer/contacts_list.tpl'}
                </div>
            {/if}

            {if $has_social}
                <div class="Footer-block Grid-cell {$footerBlocksClass}">
                    <h2 class="Footer-blockTitle">Seguici su</h2>
                    {include uri='design:footer/social.tpl'}
                </div>
            {/if}

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
            <div class="Footer-block Grid-cell u-md-size3of5 u-lg-size3of5">
                {include uri='design:footer/copyright.tpl'}
            </div>
            <div class="Footer-block Grid-cell u-md-size2of5 u-lg-size2of5 text-right">
                {if $pagedata.is_login_page|not()}
                    {include uri='design:footer/user_access.tpl'}
                {/if}
            </div>
        </div>
    </div>
</footer>


<a href="#" title="torna all'inizio del contenuto" class="ScrollTop js-scrollTop js-scrollTo">
    <i class="ScrollTop-icon Icon-arrow-up" aria-hidden="true"></i>
    <span class="u-hiddenVisually">torna all'inizio del contenuto</span>
</a>
